table_names = %w(super users tasks speacks)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds",table_name + ".rb")
  if File.exist?(path)
    puts "Creating records for #{table_name}"
    require path
  end
end