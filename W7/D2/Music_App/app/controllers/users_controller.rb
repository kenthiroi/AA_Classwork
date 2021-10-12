class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end