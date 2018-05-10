class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = 'User credentials invalid'
      # redirect_to songs_url
      redirect_to new_session_url
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end
end
