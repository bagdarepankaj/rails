class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create(comment_params)
    comment.save 
    CommentsMailer.submit(comment).deliver_later
    redirect_to post_url(@post)
  end

  private

  def set_post
    @post = Post.find_by_id(
      params.fetch(:post_id)
    )
  end

  def comment_params
    params.fetch(:comment).permit(:content)
  end

end
