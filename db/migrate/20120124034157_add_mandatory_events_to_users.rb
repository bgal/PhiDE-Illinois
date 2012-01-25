class AddMandatoryEventsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mandatory_events, :integer

  end
end

