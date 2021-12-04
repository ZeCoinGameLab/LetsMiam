class GroupsController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @group = Group.new
    @users = User.where.not(id: Current.user.id)
  end

  def update
    @group = Group.create(name: params[:group][:name])
    params[:group][:users].reject!(&:empty?)
    users = User.find(params[:group][:users])
    users << Current.user
    @group.users << users
    if @group.save
      redirect_to my_profile_url, notice: "Groupe #{group_params[:name]} créé."
    else
      if !@group.blank? && @group.errors.any?
        @group.errors.each do |error|
          flash[:notice] = error.full_message
        end
      end
      redirect_to new_group_path
    end
  end

  def quit_group
    @user_group = AssociationUserGroup.find_by(group_id: params[:id], user_id: Current.user.id)
    if @user_group.destroy
      redirect_to my_profile_url, notice: 'Vous êtes bien retiré du groupe.'
    else
      redirect_to my_profile_url
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, users: [])
  end
end
