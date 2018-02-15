class Review < ApplicationRecord
  validates_presence_of :rating, :description
  belongs_to :walk
end
