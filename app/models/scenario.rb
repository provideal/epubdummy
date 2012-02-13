class Scenario < ActiveRecord::Base

  # Relations
  belongs_to :epub
  belongs_to :semapp
  has_many   :annotations

  # Validations
  validates_presence_of :name, :version, :epub, :semapp

end