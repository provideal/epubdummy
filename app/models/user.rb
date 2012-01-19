class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  # User roles.
  # @see http://wiki.github.com/ryanb/cancan/role-based-authorization
  ROLES = %w[admin]

  # Relations
  has_many :semapps

  # Fields
  field :login,           type: String, index: true
  field :firstname,       type: String
  field :lastname,        type: String
  field :password_digest, type: String
  field :roles_mask,      type: Integer
  has_secure_password

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