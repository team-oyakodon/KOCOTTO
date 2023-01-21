class Municipality::BaseController < ApplicationController
  layout 'municipality/layouts/application'
  before_action :check_admin

  private
    def not_authenticated
      flash[:alert] = 'ログインしてください'
      redirect_to main_app.login_path
    end

    def check_admin
      redirect_to root_path, alert: '権限がありません' unless current_user.admin?
    end
end