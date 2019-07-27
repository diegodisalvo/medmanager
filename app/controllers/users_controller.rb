class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def change_location
    @location = Location.find(params[:location_id])
    current_user.location = @location
    current_user.save
    respond_to do |format|
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname,
                                 :lname,
                                 :location_id,
                                 location_ids:[]
                                )
  end
end
