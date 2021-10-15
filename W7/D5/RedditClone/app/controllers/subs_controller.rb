class SubsController < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = params[:user_id]
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = ["Must fill all text boxes"]
      render :new
    end
  end

  def index

  end

  def show

  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update

  end

  def destroy

  end

  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
