class InviteMailer < ApplicationMailer

  # Can be anything you want, bear in mind that if you want replies -- it needs to be an email you have access to.
  default from: "HalimaAlshahrani@gmail.com"

  # Much like controllers for views in our app (like def index), the method should match our view name -- in this case welcome.
  def welcome(invitation)
    # Turn the user passed to the method into an instance variable, so we can access it in our view
    @invitation = invitation
    # Tell the mailer what addresses it is sending to. Can be also be used to cc/bcc etc. Docs here:
    #   mg_client = Mailgun::Client.new ENV["049bc87dd8a2135b336825d631a9b715-9b463597-20aeb929"]
    #   message_params = {:from => "norah1994@windowslive.com",
    #                     :to => @invitation.email,
    #                     :subject => "Sample Mail using Mailgun API",
    #                     :text => "This mail is sent using Mailgun API via mailgun-ruby"}
    #   mg_client.send_message ENV["sandbox6a882ee8ad374df9b6c9f46d66988a59.mailgun.org"], message_params
    # end

    mail to: @invitation.email, subject: "Sample Mail using Mailgun API"
  end
end
