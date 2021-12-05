class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(nickname: params[:nickname])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connecté(e).'
    else
      flash.now[:alert] = 'Combinaison surnom/mot de passe inconnue.'
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Déconnecté(e)'
  end
end
