class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
   @users = User.all
  end

  def edit
  end

  def update
   respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to users_index_path, notice: 'Users role was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
   end
  end

  private
   def set_user
     @user = User.find(params[:id])
   end

   def user_params
    params.require(:user).permit(:email, :role_id )
   end

end
