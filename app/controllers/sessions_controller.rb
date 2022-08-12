class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #has_secure_password
      sing_in(user)
      redirect_to user_path(user)
    else
      flash.now[:danger]  = 'Email ou senha invalidos'
      render 'new'
    end
  end

end