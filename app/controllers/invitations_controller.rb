class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      InviteMailer.welcome(@invitation).deliver_now
      redirect_to @invitation.event
      # format.html { redirect_to event_path(@invitation.event.id) }
      #  respond_to do |format|
      #       if @invitation.save

      #         # Just this lin -- all it says is, in invitationMailer (the controller) call the welcome method immediately,
      #         # then pass it the newly made invitation.
      #         InviteMailer.welcome(@invitation).deliver_now

      #         format.html { redirect_to @invitation, notice: 'invitation was successfully created.' }
      #         format.json { render :show, status: :created, location: @invitation }
      #       else
      #         format.html { render :new }
      #         format.json { render json: @invitation.errors, status: :unprocessable_entity }
      #       end
    end

    # redirect_to @invitation.event
  end

  def edit
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:name, :email, :event_id)
  end
end
