class Barber < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  belongs_to :user
  belongs_to :barbershop, optional: true
  has_many :appointments, through: :barber_services, dependent: :destroy
  has_many :barber_services, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :name, :description, :location, presence: true
end
