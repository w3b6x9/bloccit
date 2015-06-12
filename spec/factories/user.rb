FactoryGirl.define do 
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      after(:create) do |user|
        post = create(:post, user: user)
        comment = create(:comment, user: user, post: post)
      end
    end

    factory :user_with_post_and_two_comments do
      after(:create) do |user|
        post = create(:post, user: user)
        2.times { create(:comment, user: user, post: post) }
      end
    end
  end
end