class Annotation
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  belongs_to :user
  belongs_to :scenario

  validates_presence_of :user
  validates_presence_of :scenario

  # Fields
  field :data, type: String

end