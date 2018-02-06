class Site < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
  belongs_to :walk
end
