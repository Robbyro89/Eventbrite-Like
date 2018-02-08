class User < ApplicationRecord
  has_many :authored_events, class_name: "Event", foreign_key: "creator_id"
  has_and_belongs_to_many :attended_events, class_name: "Event"
end
