class AdminController < ApplicationController

  before_action :check_if_admin

  def index
    @admins = User.where(is_admin: true)
    @fests = Fest.all
    @users = User.all
    @festlive = @fests.where(validation_admin: true)
  end
  
end

private

  def check_if_admin
    if current_user && current_user.is_admin == false
    redirect_to root_path
    end
  end
