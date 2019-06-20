class UserInterestsController < ApplicationController
 before_action :set_interest, only: %i[new create destroy]

  def new
    @user_interest = UserInterest.new
  end

  def create
    @user_interest = @user.user_interests.new(user_interest_params)

    if @user_interest.save
      redirect_to page_path(@user)
    else
      render 'pages/show'
    end
  end

  def destroy
    @user_interest = UserInterest.find(params[:id])
    @user_interest.destroy
    redirect_to page_path(@user)
  end

  private

  def set_interest
    @user = User.find(params[:user_id])
  end

  def user_interest_params
    params.require(:user_interest).permit(:interest_id)
  end
end

