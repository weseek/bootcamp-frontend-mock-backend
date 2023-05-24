class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    unless @user.save
      render json: {errors: @user.errors}, status: :unprocessable_entity
      return
    end
    render :show, status: :created
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    unless @user.update(user_params)
      render json: {errors: @user.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.except(:format, :user, :id).permit(:name, :username)
    end
end
