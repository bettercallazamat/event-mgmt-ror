class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attended_events, through: :attendence
  has_many :attendences, foreign_key: 'attendee_id', class_name: 'Attendence'
end