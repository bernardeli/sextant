require 'sextant/route_inspector'
require 'sextant/engine'

module Sextant
  def self.format_routes(routes = all_routes)
    inspector = RouteInspector.new
    inspector.format(routes).join "\n"
  end

  def self.all_routes
    Rails.application.reload_routes!
    Rails.application.routes.routes
  end
end

