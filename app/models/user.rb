class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  has_many :attendences, foreign_key: 'attendee_id', class_name: 'Attendence'
  has_many :attended_events, through: :attendences

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {in: 5..20}
  validates :password, presence: true, length: {in: 10..30}

  def prev_events
    attended_events.where('event_date <= ?', Time.now)
  end

  def upcoming_events
    attended_events.where('event_date > ?', Time.now)
  end
end
