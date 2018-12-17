class RemoveGuestIdfromInvitations < ActiveRecord::Migration[5.2]
  def up
    remove_column :invitations, :guest_id
  end

  def down
    add_column :invitations, :guest_id, :integer
  end
end
