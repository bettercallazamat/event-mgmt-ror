class Attendence < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_events, class_name: "Event"
end
