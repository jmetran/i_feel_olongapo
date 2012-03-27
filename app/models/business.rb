class Business < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  validates :location_id, :name, :trade_name, :status, :presence => true

  attr_accessible :location_id, :name, :trade_name, :status

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    options = { :page => (params[:page] || 1), :per_page=> (params[:per_page] || 1), load: params[:load] }
    tire.search(options) do
      query { string params[:q]} if params[:q].present?
    end
  end

end
