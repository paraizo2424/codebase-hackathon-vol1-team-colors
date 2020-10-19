class UsersController < ApplicationController
  before_action :set_user_record, only: [:show, :update]
  before_action :authenticate_user!

  # GET /users
  def show
    render json: @user
  end

  # PATCH /users/update
  def update
    # # @user.image.attach(params[:user][:image])
    # if @user.update(user_params)
    #   flash[:success] = "登録成功!!"
    #   render json: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
    # render json: "user ok!"
  end

private
  def set_user_record
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :birthday, :email, :note, :image)
  end
end
