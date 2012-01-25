class AddServiceEventToEvents < ActiveRecord::Migration
  def change
    add_column :events, :service_event, :boolean

  end
end
