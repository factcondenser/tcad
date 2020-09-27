# frozen_string_literal: true

namespace :db do
  desc 'Import the given record type. Optionally supply CHUNK_SIZE, BATCH_SIZE, and START_FROM_LINE. Usage: `rake db:import[example_record_type]`'
  task :import, %i[record_type] => :environment do |task, args|
    chunk_size = ENV['IMPORT_CHUNK_SIZE']
    batch_size = ENV['IMPORT_BATCH_SIZE']
    start_from_line = ENV['IMPORT_START_FROM_LINE']

    puts "[#{task.name}] running with args:#{args.to_hash}".light_cyan

    ImportService::Importer.new(
      args[:record_type],
      chunk_size: chunk_size,
      batch_size: batch_size,
      start_from_line: start_from_line
    ).call
  end
end
