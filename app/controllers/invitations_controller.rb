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
    @invitation = Invitation.create(invitation_params)
    redirect_to @invitation.event
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
