class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    @url  = 'http://hrvojematic.com/login'
    mail(to: @user.email, subject: 'Welcome to my blog')
  end
end
