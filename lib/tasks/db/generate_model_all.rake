# frozen_string_literal: true

namespace :db do
  desc 'Generate models for all TCAD record types. Usage: `rake db:generate_model_all`'
  task generate_model_all: :environment do
    Rails.configuration.record_types.each do |record_type|
      Rake::Task['db:generate_model'].invoke(record_type)
      Rake::Task['db:generate_model'].reenable
    end
  end
end
