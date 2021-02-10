require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecruitingCodingExercise
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	# Enable per-form CSRF tokens.
	config.action_controller.per_form_csrf_tokens = true

	# Enable origin-checking CSRF mitigation.
	config.action_controller.forgery_protection_origin_check = true

	# Make Ruby 2.4 preserve the timezone of the receiver when calling `to_time`.
	ActiveSupport.to_time_preserves_timezone = true

	# Require `belongs_to` associations by default.
	config.active_record.belongs_to_required_by_default = true

	# Do not halt callback chains when a callback returns false.
	ActiveSupport.halt_callback_chains_on_return_false = true
  end
end
