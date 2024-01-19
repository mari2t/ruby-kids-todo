class ApplicationController < ActionController::Base
  before_action :set_setting

  private

  def set_setting
    @setting = Setting.first 
  end
end
