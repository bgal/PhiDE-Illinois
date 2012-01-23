class AddMandatoryToEvents < ActiveRecord::Migration
  def change
    add_column :events, :mandatory, :boolean
  end
end
