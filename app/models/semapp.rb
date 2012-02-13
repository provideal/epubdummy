class Semapp
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  belongs_to :user
  has_and_belongs_to_many :epubs

  # Validations
  validates_presence_of :user

  # Fields
  field :name, type: String

end