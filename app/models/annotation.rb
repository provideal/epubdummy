class Annotation
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  embedded_in :epub

  # Field
  field :data, type: String

end