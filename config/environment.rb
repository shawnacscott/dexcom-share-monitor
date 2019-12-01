# Load the Rails application.
require_relative 'application'

# Load ENV variables
Setting.load(
  path:  "#{Rails.root}/config/settings",
  files: ["default.yml", "environments/#{Rails.env}.yml"]
)

# Initialize the Rails application.
Rails.application.initialize!
