class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def show
    @summary = Summary.find(params[:id])
    authorize @summary
    @topic = Topic.find(params[:id])
    @post = Post.find(params[:id])
    authorize @topic
  end
end