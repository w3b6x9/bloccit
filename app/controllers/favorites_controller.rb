class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Your favorite has been saved."
      redirect_to [post.topic, post]
    else
      flash[:error] = "You failed to favorite this post. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorited(post)
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Your favorite has been removed."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Your favorite failed to be removed. Please try again."
      redirect_to [post.topic, post]
    end
  end
end
