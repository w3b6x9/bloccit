class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment successfully created!"
    else
      redirect_to [@topic, @post], error: "Comment failed to be created!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end