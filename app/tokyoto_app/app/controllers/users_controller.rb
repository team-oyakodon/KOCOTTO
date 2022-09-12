class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to edit_profile_path, notice: 'ユーザー情報を登録しました。プロフィール情報を入力してください'
    else
      flash.now[:alert] = 'ユーザー情報の登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
