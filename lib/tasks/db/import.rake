# frozen_string_literal: true

namespace :db do
  desc 'Import the given record type. Optionally supply IMPORT_CHUNK_SIZE and IMPORT_BATCH_SIZE. Usage: `rake db:import[example_record_type]`'
  task :import, %i[record_type] => :environment do |task, args|
    chunk_size = ENV['IMPORT_CHUNK_SIZE']
    batch_size = ENV['IMPORT_BATCH_SIZE']

    puts "[#{task.name}] running with args:#{args.to_hash}".light_cyan

    ImportService::Importer.new(
      args[:record_type],
      chunk_size: chunk_size,
      batch_size: batch_size
    ).call
  end
end
