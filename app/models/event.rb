class Event < ActiveRecord::Base
  validates_presence_of :title, :start_at, :end_at
end
