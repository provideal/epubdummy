# User
User.delete_all
admin = User.create!(login: 'admin', password: 'admin', password_confirmation: 'admin', firstname: 'John', lastname: 'Doe')
admin.roles = ['admin']
admin.save!
user1 = User.create!(login: 'user1', password: 'user1', password_confirmation: 'user1', firstname: 'Max', lastname: 'Mustermann')

# Semapps
Semapp.delete_all
semapp1 = Semapp.new(name: 'Semapp 1', user: admin)
semapp1.save!
semapp2 = Semapp.new(name: 'Semapp 2', user: admin)
semapp2.save!

# epubs
Epub.delete_all
epub1 = Epub.create!(name: 'epub 1')
epub2 = Epub.create!(name: 'epub 2')
epub3 = Epub.create!(name: 'epub 3')
# ... files
epub1.file = File.open(File.join(Rails.root, 'db', 'assets', 'test.epub'))
epub1.save!
epub2.file = File.open(File.join(Rails.root, 'db', 'assets', 'test.epub'))
epub2.save!
epub3.file = File.open(File.join(Rails.root, 'db', 'assets', 'test.epub'))
epub3.save!

# Semapp <=> epub
semapp1.epubs << epub1
semapp2.epubs << epub2
semapp2.epubs << epub3

# epub <=> Scenario <=> Annotation
scenario1 = Scenario.new(name: 'Scenario 1', type: 1, active: true)
scenario1.save!
scenario1.annotations << Annotation.new(user: user1, data:'<annotation></annotation>')
scenario1.annotations << Annotation.new(user: user1, data:'<annotation></annotation>')
epub1.scenarios << scenario1