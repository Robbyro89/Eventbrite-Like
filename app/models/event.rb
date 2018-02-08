class Event < ApplicationRecord
  has_and_belongs_to_many :user_attendees, class_name => "User", :join_table => :events_users
  belongs_to :creator, class_name: "User"

  validates :description, presence: true, length: { minimum: 5 }
  validates :date, presence:true
  validates :place, presence: true

end
