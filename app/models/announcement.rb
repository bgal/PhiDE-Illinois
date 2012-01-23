class Announcement < ActiveRecord::Base
  belongs_to :user
  
  def author
    user
  end
end
