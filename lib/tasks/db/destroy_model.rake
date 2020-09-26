# frozen_string_literal: true

namespace :db do
  desc 'Destroy model for the given record type. Usage: `rake db:destroy_model[example_record_type]`'
  task :destroy_model, [:record_type] => :environment do |task, args|
    puts "[#{task.name}] running with args:#{args.to_hash}".light_cyan

    record_type = args[:record_type]

    unless File.exist?(Rails.root.join('app', 'models', "#{record_type}.rb"))
      puts "[#{task.name}] skipping #{record_type.camelize} because it doesn't exist".light_yellow
      next
    end

    system("rails destroy model #{record_type.camelize}")
  end
end
