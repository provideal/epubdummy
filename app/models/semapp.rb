class Semapp
  include Mongoid::Document
  include Mongoid::Timestamps

  # Relations
  belongs_to :user
  embeds_many :epubs

  # Fields
  field :name, type: String


  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]

    xml.semapp do
      xml.tag!(:id, id)
      xml.tag!(:name, name)
      xml.tag!(:updated_at, updated_at)
      # epubs
      xml.epubs do
        epubs.each do |epub|
          xml.epub do
            xml.tag!(:id, epub.id)
            xml.tag!(:name, epub.name)
            xml.tag!(:updated_at, epub.updated_at)
            xml.file do
              xml.tag!(:name, epub.file_identifier)
              xml.tag!(:path, epub.file.url)
            end
            xml.annotations do
              epub.annotations.each do |annotation|
                xml.annotation do
                  xml.tag!(:id, annotation.id)
                  xml.tag!(:updated_at, annotation.updated_at)
                  xml.tag!(:data, annotation.data)
                end
              end
            end
          end
        end
      end if options[:epubs] == true
    end
  end

end