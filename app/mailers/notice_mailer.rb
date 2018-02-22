class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_event.subject
  #
  def sendmail_event
    @greeting = "Hi"

    mail to: "saylako@icloud.com"
    subject: 'イベントが投稿されました'     
  end
end
