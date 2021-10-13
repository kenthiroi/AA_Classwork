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

  def new
    @user = User.new
    render :new
  end

  def show
    
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end