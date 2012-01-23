class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
