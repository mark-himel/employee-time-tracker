class UsersController < ApplicationController
  before_action :set_user

  def check_in
    @user.clock_event.update!(check_in: DateTime.now)
    redirect_to root_path
  end

  def check_out
    @user.clock_event.update!(check_out: DateTime.now)
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end