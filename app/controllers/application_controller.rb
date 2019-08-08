class ApplicationController < ActionController::Base
  before_action :set_current_usd_rate

  private

  def set_current_usd_rate
    @usd_rate = UsdRate.first.current_rate
  end
end
