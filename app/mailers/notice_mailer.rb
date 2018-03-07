class NoticeMailer < ApplicationMailer
  
  def sendmail_event(event)
    @event = event

    mail to: "saylako@icloud.com",
         subject: 'イベントが投稿されました'
  end
end
