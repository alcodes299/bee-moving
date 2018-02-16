class Site < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates_presence_of :walk_id
  validates_presence_of :user_id
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :flyer
  validates_presence_of :role
  belongs_to :user
  belongs_to :walk
end
