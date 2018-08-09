class RegisterUserForm < ActiveType::Record[User]
  before_save :capitalize_name
  after_create :send_welcome_mail

  def capitalize_name
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end

  def send_welcome_mail
    UserMailer.with(user: self).welcome_email.deliver_later
  end
end