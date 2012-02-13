# User
User.destroy_all
admin = User.create!(login: 'admin', password: 'admin', password_confirmation: 'admin', firstname: 'John', lastname: 'Doe')
admin.roles = ['admin']
admin.save!
user1 = User.create!(login: 'user1', password: 'user1', password_confirmation: 'user1', firstname: 'Max', lastname: 'Mustermann')

# Semapps
Semapp.destroy_all
semapp1 = Semapp.create!(name: 'Semapp 1', user: admin)
semapp2 = Semapp.create!(name: 'Semapp 2', user: admin)

# epubs
Epub.destroy_all
epub1 = Epub.create!(name: 'epub 1', file: File.open(File.join(Rails.root, 'db', 'assets', 'test.epub')))
epub2 = Epub.create!(name: 'epub 2', file: File.open(File.join(Rails.root, 'db', 'assets', 'test.epub')))
epub3 = Epub.create!(name: 'epub 3', file: File.open(File.join(Rails.root, 'db', 'assets', 'test.epub')))

# Semapp <=> epub
semapp1.epubs << epub1
semapp2.epubs << epub2
semapp2.epubs << epub3

# epub <=> Scenario <=> Annotation
Scenario.destroy_all
scenario1 = Scenario.create!(epub: epub1, semapp: semapp1, name: 'Scenario 1', version: 1, active: true)
scenario1.annotations << Annotation.new(user: user1, data:'<annotation></annotation>')
scenario1.annotations << Annotation.new(user: user1, data:'<annotation></annotation>')

scenario2 = Scenario.create!(epub: epub2, semapp: semapp1, name: 'Scenario 2', version: 1, active: true)
scenario2.annotations << Annotation.new(user: user1, data:'<annotation></annotation>')