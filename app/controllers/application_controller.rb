class ApplicationController < ActionController::Base
    before_action :set_theme_color
  
    private
  
    def set_theme_color
      @theme_name = Setting.last.display_background
    end
  end
  