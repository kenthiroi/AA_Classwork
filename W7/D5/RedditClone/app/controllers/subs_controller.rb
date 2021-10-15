class SubsController < ApplicationController

  before_action :require_logged_in, except: [:index, :show]
  before_action :is_moderator, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = params[:user_id]
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["Must fill all text boxes"]
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["Must fill all text boxes"]
      render :edit
    end
  end

  # def destroy
  #   sub = Sub.find(params[:id])
  #   sub.delete

  # end

  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def is_moderator
    sub = Sub.find(params[:id])
    if current_user.id != sub.moderator_id
      redirect_to sub_url(sub)
    end
  end

end
