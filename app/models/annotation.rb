class Annotation
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :user_id, type: String

  # Relations
  embedded_in :epub

  # Field
  field :data, type: String


  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]

    xml.annotation do
      xml.tag!(:id, id)
      xml.tag!(:updated_at, updated_at)
      xml.tag!(:data, data)
    end
  end

end