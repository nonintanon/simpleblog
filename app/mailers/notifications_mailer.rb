class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"

  def comment_notification(user, comment)
    @comment = comment
    @user = user
    mail(to: user.email, subject: "A New Comment") do |format|
      format.html
      format.text
    end
  end
end
