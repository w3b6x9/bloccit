require 'rails_helper'

describe User do 

  include TestFactories

  describe "#favorited(post)" do

    before do 
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do 
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do 
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
    end

    it "returns 'nil' if the user has favorited another post" do 
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorites.find_by_post_id(@post.id+1) ).to be_nil
    end
  end
end