class UserInterestsController < ApplicationController
 before_action :set_interest, only: %i[new create destroy]

  def new
    @user_interest = UserInterest.new
  end

  def create

    current_user.interests.destroy_all
    #@user_interest = @user.user_interests.new(user_interest_params)
    array_interest = params["interests"]["interest"]

    array_interest.delete("")

    array_interest.each do |int|
      @user_interest = UserInterest.new(user: current_user, interest_id: int.to_i )
      @user_interest.save
    end



      redirect_to page_path(@user)

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

