require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module HrTil
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib', 'app/decorators')
    config.time_zone = 'Eastern Time (US & Canada)'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_controller.default_url_options = {
      host: ENV.fetch('HA_HOST'),
      protocol: ENV.fetch('HA_PROTOCOL')
    }
  end
end
