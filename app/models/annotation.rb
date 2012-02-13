class Annotation < ActiveRecord::Base

  # Relations
  belongs_to :user
  belongs_to :scenario

  # Validations
  validates_presence_of :user, :scenario

end