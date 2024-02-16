# lib/tasks/import_data.rake
namespace :import do
  desc "Import data from JSON file"
  task data: :environment do
    file = File.read(Rails.root.join('app', 'assets', 'data.json'))
    data = JSON.parse(file)
    
    data.each do |person_data|
      person = Person.create(name: person_data['name'])
      person.details.create(
        title: person_data['info']['title'],
        age: person_data['info']['age'],
        phone: person_data['info']['phone'],
        email: person_data['info']['email']
      )
    end

    puts "Data imported successfully!"
  end
end
