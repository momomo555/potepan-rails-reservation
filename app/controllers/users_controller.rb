class UsersController < ApplicationController
  def account
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(params.require(:user).permit(:image, :name, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to users_profile_path
    else
      render users_profile_path
    end

  end
end
