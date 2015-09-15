# Rake is the best way? http://stackoverflow.com/questions/529651/how-can-i-set-the-rails-environment-for-my-somewhat-stand-alone-ruby-script
# The generator command: rails g task bookcat import

namespace :bookcat do
  desc "Import book catalogue in .csv format to database"
  task import: :environment do
    filename = ENV['file']
    puts "Importing file '#{filename}'." # http://stackoverflow.com/questions/825748/how-do-i-pass-command-line-arguments-to-a-rake-task
    key_mapping = {
      author_details: 'author',
      title: 'title',
      isbn: 'isbn',
      publisher: 'publisher',
      date_published: 'date_published',
      book_uuid: 'book_uuid'
    }
    options = {key_mapping: key_mapping, remove_unmapped_keys: true, value_converters: {date_published: BooksHelper::PublishDateConverter}}
    n = SmarterCSV.process(filename, options) do |array|
      Book.create(array.first)
      puts array.first.inspect if rand(1..50)==1
    end
    puts "Imported #{n} rows."
  end

end
