class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    puts params[:username]

    if(@user and @user.authenticate(params[:user][:password]))
      session[:id] = @user.id
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash[:notice] = "Logged out successfully"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Logged out successfully"
    redirect_to login_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require([:username, :password])
  end
end
