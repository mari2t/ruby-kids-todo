class SettingsController < ApplicationController
    before_action :set_setting, only: [:show, :edit, :update]

    def index
        @setting = Setting.first || Setting.create
    end

    def show
    end

    def edit
    end

    def update
        if @setting.update(setting_params)
            redirect_to settings_path
        else 
            render :edit
        end
    end

    private
    
    def setting_params
        params.require(:setting).permit(:reward_url1, :reward_url2, :reward_url3, :reward_url4, :reward_url5, :reward_url6, :reward_url7, :reward_url8, :reward_url9, :reward_url10, :show_uncompleted_todos, :display_background)
    end

    def set_setting
        @setting = Setting.first || Setting.create
    end
end
