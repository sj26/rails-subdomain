# Rails Subdomain

Subdomains in rails are [still a bit hairy](https://gist.github.com/1939812).

This is a growing collection of helpers and monkey patches to make it better(tm).

## Usage

```ruby
My::Application.routes.draw do
  subdomain /\A(www|)\Z/, default: "www" do
    root to: "home#show"
  end

  subdomain :admin, module: "admin", as: "admin" do
    root to: "admin/dashboard#show"
  end
end
```

This will route `http://mydomain.com` and `http://www.mydomain.com` in the
first subdomain scope, and `http://admin.mydomain.com` in the second scope.
If you have different number of TLDs (the `.com` bit, default is 1) change
`config.action_dispatch.tld_length` in your `config/application.rb` or
any `config/environments/*.rb` file. For example, `http://www.mydomain.com.au`
would need to change the `tld_length` to 2 (`.com.au`).

When on the home show page, `admin_root_path` will render a full URL,
`http://admin.mydomain.com/`, because it knows you'll cross subdomains.
From the admin dashboard, `admin_root_path` will be `/`, but `root_path`
will be `http://www.mydomain.com/`.

There will be test helpers added for capybara/selenium/cucumber super-soon.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
