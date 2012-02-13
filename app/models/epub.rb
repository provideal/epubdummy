class Epub < ActiveRecord::Base

  # Relations
  has_and_belongs_to_many :semapps
  has_many :scenarios

  # Uploader
  mount_uploader :file, EpubUploader


  def annotations
    Annotation.joins(:scenario => :epub).where('epubs.id' => self.id)
  end

end