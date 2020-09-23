# frozen_string_literal: true

namespace :db do
  desc 'Destroy models for all TCAD record types. Usage: `rake db:destroy_model_all`'
  task destroy_model_all: :environment do
    Rails.configuration.record_types.each do |record_type|
      Rake::Task['db:destroy_model'].invoke(record_type)
      Rake::Task['db:destroy_model'].reenable
    end
  end
end
