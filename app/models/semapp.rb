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
          xml << epub.to_xml(:skip_instruct => true)
        end
      end if options[:epubs] == true
    end
  end

end