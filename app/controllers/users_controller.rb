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
    render :text => params[:id]
  end
  
  def edit
    render :json => {params[:id] => "this is my id"}
  end
  
  def index
    render :json => User.all
  end
  
  def new
  end
  
  def show
  end
  
  def update
  end
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
