class Rails::RoutesController < ApplicationController
  layout 'rails/routes'

  before_filter :ensure_local

  def index
    @routes = Sextant.format_routes
  end

  private

  def ensure_local
    return false unless Rails.env.development? || Rails.env.test?
  end
end
