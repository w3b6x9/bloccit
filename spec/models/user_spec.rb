require 'rails_helper'

describe User do 

  include TestFactories

  describe "#favorited(post)" do 
    xit "returns 'nil' if the user has not favorited the post" do 
    end

    xit "returns the appropriate favorite if it exists" do 
    end
  end

  describe ".top_rated" do
<<<<<<< Updated upstream

    before do 
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post:post) }
    end

=======
>>>>>>> Stashed changes
    it "returns users ordered by comments + posts" do
      first_user = create(:user, :with_post_and_comment)
      second_user = create(:user, :with_post_and_comment, comment_count: 2)

      expect(User.top_rated).to eq([second_user, first_user])
    end

    it "stores a 'posts_count' on user" do
      first_user = create(:user, :with_post_and_comment)
      second_user = create(:user, :with_post_and_comment, comment_count: 2)
      top_rated_users = User.top_rated

      result = top_rated_users.first.comments.count

      expect(result).to eq(2)
    end

    it "stores a 'comments' on user" do
      first_user = create(:user, :with_post_and_comment)
      second_user = create(:user, :with_post_and_comment, comment_count: 2)
      top_rated_users = User.top_rated

      result = top_rated_users.first.comments.count

      expect(result).to eq(2)
    end
  end
end