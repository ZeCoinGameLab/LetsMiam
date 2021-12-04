class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Votre compte est créé'
    else
      render :new
    end
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:nickname, :password, :password_confirmation)
  end
end
