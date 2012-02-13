object @epub
attributes :id, :name, :created_at, :updated_at, :file_name
node(:file_name) { |epub| epub.file_identifier }
node(:file_path)  { |epub| epub.file.url }