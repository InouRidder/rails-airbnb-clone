class Barber < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  has_many :appointments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, :description, :services, :location, presence: true
end
