class SessionController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_url
    else
      redirect_to login_url, alert: 'Неверная комбинация логина и пароля!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url
  end
end
