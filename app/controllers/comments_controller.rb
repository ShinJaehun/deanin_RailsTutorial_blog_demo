class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment has not been created"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        puts "####################################"
        puts post_url
        puts post_url(@post)
        puts "####################################"
        format.html { redirect_to post_url(@post), notice: "Comment has been updated" }
      else
        format.html { redirect_to post_url(@post), notice: "Comment was not updated" }
      end
    end
  end

  private

  def set_post
    # @post = Post.friendly.find(params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
