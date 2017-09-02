seed_names = %w(super users tasks speacks)

seed_names.each do|seed_name|
  path = Rails.root.join("db/seeds", seed_name + ".rb")
  if File.exist?(path)
    puts "Creating records for #{seed_name}"
    require path
  end
end