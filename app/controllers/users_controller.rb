class UsersController < ApplicationController
  def list
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find_by_id(params[:id])
    authorize! :update, :users
  end
  
  def update
    @user = User.find_by_id(params[:id])
    authorize! :update, :users
    @user.admin = params[:admin]
    @user.hours = params[:hours]
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_list_path, :notice => "User has been successfully updated" }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
