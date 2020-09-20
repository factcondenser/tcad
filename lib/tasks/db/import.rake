# frozen_string_literal: true

namespace :db do
  desc 'Import the given record type. Usage: `rake db:import["example_record_type"]`'
  task :import, [:record_type] => :environment do |task, args|
    puts "[#{task.name}] running with args #{args.to_h}".green

    record_type = args[:record_type]

    # unless File.exist?(Rails.root.join('app', 'models', "#{record_type}.rb"))
      system(ImportService::MigrationStringBuilder.new(record_type).call)
      system('rails db:migrate')
    # end

    # Services::Importer.new(args[:record_type]).call
  end
end
