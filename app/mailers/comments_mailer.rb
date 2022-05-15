class CommentsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comments_mailer.submit.subject
  #
  def submit(comment)
    @comment = comment

    mail to: "blog-owner@example.org", subject: "New Comment"
  end
end
