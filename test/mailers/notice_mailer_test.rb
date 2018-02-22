require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_event" do
    mail = NoticeMailer.sendmail_event
    assert_equal "Sendmail event", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
