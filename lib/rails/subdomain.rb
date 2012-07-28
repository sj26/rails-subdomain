require 'active_support/lazy_load_hooks'

module Rails::Subdomain
end

require 'rails/subdomain/version'
require 'rails/subdomain/cucumber' if defined? Cucumber
require 'rails/subdomain/mapper'
require 'rails/subdomain/url_for'
