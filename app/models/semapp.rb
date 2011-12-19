class Semapp
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  embeds_many :epubs

  # Fields
  field :name, type: String

end