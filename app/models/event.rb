class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendences, foreign_key: 'attended_event_id', class_name: 'Attendence'
  has_many :attendees, through: :attendences

  scope :upcoming, -> { where('event_date > ?', Time.now) }
  scope :past, -> { where('event_date <= ?', Time.now) }

  validates :title, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :event_date, :description, presence: true
end
