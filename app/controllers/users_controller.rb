class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @userProfile = User.find(params[:id])
    @user = current_user
    @title = @userProfile.fname
  end
end
