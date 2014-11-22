class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:info] = "New user created."
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events

    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
