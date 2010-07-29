class Notifier < ActionMailer::Base
  def receive(mail)
    return mail
  end
end
