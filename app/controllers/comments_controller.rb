class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to [@topic, @post] notice: "Comment successfully created!"
    else
      redirect_to [@topic, @post] error: "Comment failed to be created!"
    end
  end

  private

  def comment_params
    user_id: current_user.id, body: params[:body]
  end
end