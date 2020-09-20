# frozen_string_literal: true

namespace :db do
  desc 'Import all TCAD record types. Usage: `rake db:import_all`'
  task import_all: :environment do
    Rails.configuration.record_types.each do |record_type|
      Rake::Task['db:import'].invoke(record_type)
      Rake::Task['db:import'].reenable
    end
  end
end
