class Annotation
  include Mongoid::Document

  # Relations
  embedded_in :epub

  # Field
  field :data, type: String

end