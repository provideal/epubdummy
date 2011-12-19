Semapp.delete_all

semapp = Semapp.create!(name: 'Test Semapp')
epub = Epub.new(name: 'Test epub')
semapp.epubs << epub
semapp.save!

epub.file = File.open(File.join(Rails.root, 'db', 'assets', 'test.epub'))
epub.save!

epub.annotations << Annotation.new(data: '<annotation><id>123</id></annotation>')
epub.save!