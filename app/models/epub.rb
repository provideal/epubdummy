class Epub
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  embedded_in :semapp
  embeds_many :annotations

  # Fields
  field :name, type: String

  # Uploader
  mount_uploader :file, EpubUploader

end