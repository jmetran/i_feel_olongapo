class BusinessCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :business

  attr_accessible :category_id, :business_id, :category_ids
end
