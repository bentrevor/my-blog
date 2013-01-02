RSpec.configure do |config|
  # controller test helpers to set up a signed-in user before tests are run
  # (so controllers with 'before_filter :authenticate_user!' can pass)
  config.include Devise::TestHelpers, type: :controller
end