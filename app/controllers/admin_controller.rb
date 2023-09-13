class AdminController < ApplicationController
  def index
  end

  def posts
    #@posts = Post.all.includes(:user, :comments) # 근데 어째서 여기에 includes를 했었지?
    @posts = Post.all.includes(:user)
  end

  def comments
  end

  def users
  end

  def show_post
    #@post = Post.includes(:user, :comments).find(params[:id])
    @post = Post.includes(:user, comments: [:user, :rich_text_body]).find(params[:id])
  end
end
