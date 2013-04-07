class UserMailer < ActionMailer::Base
  default :from => "timukasr@gmail.com"

  def new_comment_email(comment)
  	@post = comment.post
  	@url = post_path(@post)
  	@comment = comment
  	email_with_name = "#{@post.name} <#{@post.email}>"
  	mail(:to => email_with_name, :subject => "Your post was commented")
  end
end
