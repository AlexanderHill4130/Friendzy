class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:photo))
    redirect_to page_path(@user)
  end
end
