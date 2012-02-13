class Scenario
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  has_many   :annotations
  belongs_to :epub

  # Fields
  field :name,   type: String
  field :type,   type: Integer
  field :active, type: Boolean, default: false

  # Validations
  validates_presence_of :name, :type

end