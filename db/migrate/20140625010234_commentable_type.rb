class CommentableType < ActiveRecord::Migration
  def change
    
    add_column(:comments, :commentable_type, :string)
    add_column(:comments, :commentable_id, :string)
  end
end
