class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update(basic_user_params)
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  private
  	def basic_user_params
  		params.require(:user).permit(:email, :fname, :lname)
  	end
end
