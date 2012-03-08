require 'active_support/lazy_load_hooks'

module Rails::Subdomain
end

require 'rails/subdomain/version'
require 'rails/subdomain/cucumber' if defined? Cucumber

ActiveSupport.on_load :action_controller do
  require 'rails/subdomain/mapper'
  require 'rails/subdomain/url_for'
end
