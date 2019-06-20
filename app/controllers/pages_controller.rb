class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
    @user = current_user
    @user_interest = UserInterest.new
  end
end
