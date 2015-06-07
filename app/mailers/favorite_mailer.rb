class FavoriteMailer < ApplicationMailer
  default from: "wenbox323@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@wenbo-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@wenbo-bloccit.example>"
    headers["References"] = "<post/#{post.id}@wenbo-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
