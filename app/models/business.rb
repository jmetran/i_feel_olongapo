class Business < ActiveRecord::Base
  extend FriendlyId
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :location
  belongs_to :user
  has_many :business_categories
  has_many :categories, :through => :business_categories

  validates :location_id, :name, :trade_name, :status, :presence => true

  attr_accessible :location_id, :name, :trade_name, :status, :category_ids
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  def self.search(params)
    options = { :page => (params[:page] || 1), :per_page=> (params[:per_page] || 1), load: params[:load] }
    tire.search(options) do
      query { string params[:q]} if params[:q].present?
    end
  end

end
