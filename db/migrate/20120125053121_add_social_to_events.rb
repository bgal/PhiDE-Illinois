class AddSocialToEvents < ActiveRecord::Migration
  def change
    add_column :events, :social, :boolean

  end
end
