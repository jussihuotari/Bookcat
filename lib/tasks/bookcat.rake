# Rake is the best way? http://stackoverflow.com/questions/529651/how-can-i-set-the-rails-environment-for-my-somewhat-stand-alone-ruby-script
# The generator command: rails g task bookcat import

namespace :bookcat do
  desc "Import book catalogue in .csv format to database"
  task import: :environment do
    filename = ENV['file']
    puts "Importing file '#{filename}'." # http://stackoverflow.com/questions/825748/how-do-i-pass-command-line-arguments-to-a-rake-task
    options = {key_mapping: {author_details: 'author'}}
    n = SmarterCSV.process(filename, options) do |array|
      puts array.first.inspect if rand(1..50)==1
    end
    puts "Imported #{n} rows."
  end

end
