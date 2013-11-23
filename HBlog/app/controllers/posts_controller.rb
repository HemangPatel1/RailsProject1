class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]
before_action :check_permission, only: [:update, :destroy]

def index
  @posts = Post.all
end


def new
  @post = Post.new
end


def edit
  @post = Post.find(params[:id])
end


def create
  @post = Post.new(params[:post].permit(:title, :text).merge(user: current_user))

  if @post.save
  	redirect_to @post
  else
  	render 'new'
  end
end


def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
end


def show
  @post = Post.find(params[:id])
  @comment = @post.comments.build
end


def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end



private
 def check_permission
    @post = Post.find(params[:id])

    if @post.user != current_user
      flash.alert = "Not your post"
      redirect_to post_path(@post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end


end
