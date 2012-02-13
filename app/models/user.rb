class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Password security
  include ActiveModel::SecurePassword
  has_secure_password

  # User roles.
  # @see http://wiki.github.com/ryanb/cancan/role-based-authorization
  ROLES = %w[admin]

  # Relations
  has_many :semapps

  # Validations
  validates_presence_of   :login
  validates_presence_of   :firstname
  validates_presence_of   :lastname
  validates_uniqueness_of :login
  validates_presence_of   :password, :on => :create

  # Accessors
  attr_accessible :login, :firstname, :lastname, :password, :password_confirmation


  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((self.roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

end