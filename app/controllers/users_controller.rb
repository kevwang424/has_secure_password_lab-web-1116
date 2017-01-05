class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      current_user
      redirect_to '/'
    else
      flash[:notice] = "Passwords do not match!"
      redirect_to users_new_path
    end
  end

  def show
    @user = User.find_by(name: session[:name])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
