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


  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]

    xml.epub do
      xml.tag!(:id, id)
      xml.tag!(:name, name)
      xml.tag!(:updated_at, updated_at)
      xml.file do
        xml.tag!(:name, file_identifier)
        xml.tag!(:path, file.url)
      end
      xml.annotations do
        annotations.each do |annotation|
          annotation.to_xml(:skip_instruct => true)
        end
      end
    end
  end

end