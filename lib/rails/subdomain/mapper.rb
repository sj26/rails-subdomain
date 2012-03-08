class ActionDispatch::Routing::Mapper
  class InvalidSubdomain < RuntimeError; end

  # Some sugar to specify subdomain constraints and defaults
  def subdomain subdomain, options={}, &block
    subdomain = subdomain.to_s if subdomain.is_a? Symbol

    default = options.delete :default
    default ||= subdomain

    raise InvalidSubdomain, %{Default subdomain must be a string, try `subdomain #{subdomain.inspect}, default: "blah"`} unless default.is_a? String
    raise InvalidSubdomain, %{Default subdomain must match subdomain constraint} unless subdomain === default

    scope options.reverse_merge(:constraints => {:subdomain => subdomain}, :defaults => {:subdomain => default}), &block
  end
end
