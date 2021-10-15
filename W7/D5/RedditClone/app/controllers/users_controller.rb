class UsersController < ApplicationController
  # new, create Sign up 

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      log_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Invalid Username or Password"]
      render :new
    end
  end

end
