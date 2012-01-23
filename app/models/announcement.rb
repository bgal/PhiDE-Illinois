class Announcement < ActiveRecord::Base
  belongs_to :user
  
  def author
    user
  end
  
  def author=(new_author)
    user = new_author
  end
end
