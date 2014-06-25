
class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render :json => comment
    else
      render :json => 
          comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render :json => comment
  end

  def edit
    render :json => {params[:id] => "we will implement this later"}
  end

  def index
    comments = Comment.where("user_id = ?", comment_params[:user_id])
    render :json => comments
  end

  def new
    comment = Comment.new(comment_params)
    render :json => comment
  end

  def show
    comment = Comment.find(comment_params)
    render :json => comment
  end

  def update
    comment = Comment.find(comment_params[:id])
    if comment.update_attributes(comment_params)
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end
    

    private
    def comment_params
      params.require(:contact).permit(:id, :user_id, :receiver_id)
    end
end
