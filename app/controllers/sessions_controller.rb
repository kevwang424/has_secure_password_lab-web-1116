class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to '/' if params[:user][:name].nil? || params[:user][:name].empty?
    if @user = User.find_by(name: params[:user][:name]).authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to ''
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

end
