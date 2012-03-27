class Location < ActiveRecord::Base
  has_many :users
  has_many :businesses

  attr_accessible :name, :location_type, :zip_code, :parent_id

  validates :name, :location_type, :presence => true

  belongs_to :parent_location, :class_name => "Location", :foreign_key => :parent_id, :select => "id, name"

  scope :locations, lambda { |id| where("id != ?", id) unless id.nil? }

  def self.location_collections(id = nil)
    locations(id).select("id, name").order("name")
  end

end
