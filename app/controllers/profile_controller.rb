class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_navigation_name
  layout 'dashboard'

  def change_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if !@user.valid_password? params[:user][:old_password]
      return redirect_to profile_change_password_path, alert: "Invalid Old Password"  
    end

    if params[:user][:password].blank?
      return redirect_to profile_change_password_path, alert: "Please input a new password"
    end

    if params[:user][:password_confirmation] != params[:user][:password]
      return redirect_to profile_change_password_path, alert: "New password and password confirmation did not match"
    end

    @user.password = params[:user][:password]
    
    
    if @user.save(validate: false)
      sign_in(current_user, :bypass => true)
      redirect_to profile_change_password_path, notice: "Password updated successfully"  
    else
      redirect_to profile_change_password_path, alert: "Something went wrong"  
    end
  end

  def index
  end
  
  private
  def set_navigation_name 
    @navigation_name = "Profile"
  end
end
