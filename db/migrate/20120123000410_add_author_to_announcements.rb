class AddAuthorToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :user_id, :integer
  end
end
