object @epub
attributes :id, :name
node(:file_name) { |epub| epub.file_identifier }
node(:file_path)  { |epub| epub.file.url }
attributes :created_at, :updated_at