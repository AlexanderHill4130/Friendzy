class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_user!

  def home
  end

  def show
    @user = current_user
    @user_interest = UserInterest.new
    @friend = User.find(params[:id])
    @friend_av = Availability.where(user: @friend)
    @user_av = Availability.where(user: @user)

    @footer = true
  end
  def new
  @user = current_user
  @user_interest = UserInterest.new
  end

end
