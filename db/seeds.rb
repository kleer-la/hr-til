channels = %w(
  culture
  business
  workspace
  enterprise
  teams
  software-craftmanship
  facilitation
  coaching
  education
  marketing
  social-media
  lean-agile
  startup
  leadership
)

channels.each do |channel|
  puts "Finding or creating channel: #{channel}"
  Channel.find_or_create_by!(name: channel)
end

seed_file = Rails.root.join("db/seeds/#{Rails.env}.rb")
if seed_file.exist? && !ENV['NO_SEED_DATA']
  puts "*** Loading #{Rails.env} seed data"
  require seed_file
end
