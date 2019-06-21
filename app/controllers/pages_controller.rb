class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
    @user = current_user
    @user_interest = UserInterest.new
    @friend = User.find(params[:id])
    @friend_av = Availability.where(user: @friend)
    @user_av = Availability.where(user: @user)
  end
  def new
  @user = current_user
  @user_interest = UserInterest.new
  end

end
