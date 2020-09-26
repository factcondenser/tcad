# frozen_string_literal: true

namespace :db do
  desc 'Import the given record type. Optionally supply BATCH_SIZE and NUM_LINES_TO_DROP. Usage: `rake db:import[example_record_type]`'
  task :import, %i[record_type] => :environment do |task, args|
    batch_size = ENV['BATCH_SIZE']
    num_lines_to_drop = ENV['NUM_LINES_TO_DROP']

    puts "[#{task.name}] running with args:#{args.to_hash}".light_cyan
    puts "[#{task.name}] BATCH_SIZE=#{batch_size}".light_cyan if batch_size.present?
    puts "[#{task.name}] NUM_LINES_TO_DROP=#{num_lines_to_drop}".light_cyan if num_lines_to_drop.present?

    ImportService::Importer.new(
      args[:record_type],
      batch_size: batch_size,
      num_lines_to_drop: num_lines_to_drop
    ).call
  end
end
