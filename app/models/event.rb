class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendees, through: :attendence
  has_many :attendences, foreign_key: 'attended_event_id', class_name: 'Attendence'
end
