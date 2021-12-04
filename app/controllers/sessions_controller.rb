class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(nickname: params[:nickname])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connection reussi'
    else
      flash.now[:alert] = 'Surnom ou mot de passe incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Déconnecté(e)'
  end
end
