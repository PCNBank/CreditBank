class SessionController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params.require(:name))
    if user && user.authenticate(params.require(:password))
      session[:user_id] = user.id
      redirect_to home
    end
    redirect_to login_url, alert: 'Неверная комбинация логина и пароля!'

  end

  def destroy
    session[:user_id] = nil
    redirect_to home
  end
end
