# class CommentsController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :show]
  before_action :check_permission, only: [:update,:destroy]

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(comment_params)
  #   redirect_to post_path(@post)
  # end
 
  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  def update
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end


private
  def check_permission
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user != current_user
      flash[:error] = "Not your comment"
      redirect_to '/'
    end
  end

  # def comment_params
  #   params.require(:comment).permit(:commenter, :body)
  # end
# end
