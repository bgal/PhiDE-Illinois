class AddMandatoryHoursToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mandatory_hours, :integer

  end
end
