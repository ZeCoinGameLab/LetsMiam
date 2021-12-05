class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(nickname: params[:nickname])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connecté(e).'
    else
      redirect_to sign_in_path, notice: 'Combinaison surnom/mot de passe inconnue.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Déconnecté(e)'
  end
end
