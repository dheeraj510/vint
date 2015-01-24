class Vint < ActiveRecord::Base
  attr_accessible :app_id, :descraption, :location_id, :title, :video_url
  attr_accessor :latitude, :longitude
end
