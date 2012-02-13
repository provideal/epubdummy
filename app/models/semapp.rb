class Semapp < ActiveRecord::Base

  # Relations
  belongs_to :user
  has_and_belongs_to_many :epubs

  # Validations
  validates_presence_of :user

end