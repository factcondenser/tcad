# frozen_string_literal: true

namespace :db do
  desc 'Import the given record type. Usage: `rake db:import["example_record_type"]`'
  task :import, [:record_type] => :environment do |_task, args|
    ImportService::Importer.new(args[:record_type]).call
  end
end
