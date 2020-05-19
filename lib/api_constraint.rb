# frozen_string_literal: true

class ApiConstraint
  def initialize(options)
    @version = options.fetch(:version)
    @provider = options.fetch(:provider)
  end

  def matches?(request)
    mime_type = Mime::Type.parse(request.headers['Accept']).first
    mime_type.to_s == "#{@provider}.v#{@version}+json"
  end
end
