class UsersController < ApplicationController
  
  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render :json => user
    else
      render :json => 
          user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => user
  end
  
  def edit
    render :json => {params[:id] => "we will implement this later"}
  end
  
  def index
    render :json => User.all
  end
  
  def new
    user = User.new(user_params)
    render :json => user
  end
  
  def show
    user = User.find(params[:id])
    render :json => user
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
  
end
