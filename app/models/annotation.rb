class Annotation
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :user_id, type: String

  # Relations
  embedded_in :epub

  # Field
  field :data, type: String

end