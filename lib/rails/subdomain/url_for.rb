class ActionDispatch::Routing::RouteSet
  # There's no nicer way to insert this behaviour that I could find. :-(

  # Rails constructs subdomain-based routes correctly, but sometimes
  # need a kick in the pants when generating a path and the route
  # subdomain doesn't match the current subdomain
  def url_for_with_subdomain options=nil
    if options.kind_of? Hash and options.has_key? :subdomain and options[:_path_segments] and options[:_path_segments][:subdomain] != options[:subdomain]
      options[:only_path] = false
    end

    url_for_without_subdomain options
  end

  alias_method_chain :url_for, :subdomain
end
