class Category < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name
  friendly_id :name, :use => :slugged
  paginates_per 10

  has_many :business_categories
  has_many :business, :through => :business_categories

end
