class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
