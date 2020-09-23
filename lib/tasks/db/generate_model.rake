# frozen_string_literal: true

namespace :db do
  desc 'Generate model for the given record type. Usage: `rake db:generate_model["example_record_type"]`'
  task :generate_model, [:record_type] => :environment do |task, args|
    puts "[#{task.name}] running with args :#{args.to_hash}".light_cyan

    record_type = args[:record_type]

    if File.exist?(Rails.root.join('app', 'models', "#{record_type}.rb"))
      puts "[#{task.name}] skipping #{record_type.camelize} because it already exists".light_yellow
      next
    end

    system(ImportService::ModelGenerationStringBuilder.new(record_type).call)
    system(ImportService::MigrationModificationStringBuilder.new(record_type).call)
  end
end
