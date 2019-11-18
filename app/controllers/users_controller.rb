class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    user_auth = user.authenticate_with_credentials(params[:email], params[:password])
    if user.save && user_auth
      session[:user_id] = user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :password_confirmation
      )
  end

end
