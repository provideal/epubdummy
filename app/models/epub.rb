class Epub
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  has_and_belongs_to_many :semapps
  has_many :scenarios

  # Fields
  field :name, type: String

  # Uploader
  mount_uploader :file, EpubUploader

end