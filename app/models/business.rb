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

  #validates :name, :uniqueness => { :scope => [:trade_name, :status], :case_sensitive => false}

  #validate :validate_name_and_trade_name
  #
  #def validate_name_and_trade_name
  #  errors.add("You are not allowed to submit message with the same information within 1 hour and 30 minutes", "") if check_name_and_trade_name
  #end
  #
  #def check_name_and_trade_name
  #  date_created = self.class.where(:name => self.name, :trade_name => self.trade_name).last
  #  if date_created
  #    time_diff = Time.diff(date_created.created_at, Time.current)
  #    time_diff_in_seconds = (time_diff[:hour] * 3600) + (time_diff[:minute] * 60)
  #    #puts Time.current
  #    #puts date_created.created_at
  #    #puts time_diff_in_seconds
  #    #puts time_diff
  #    true if time_diff_in_seconds <= 5400
  #  end
  #end

  def should_generate_new_friendly_id?
    new_record?
  end

  def self.search(params)
    options = { :page => (params[:page] || 1), :per_page=> (params[:per_page] || 10), load: params[:load] }
    tire.search(options) do
      query { string params[:q]} if params[:q].present?
    end
  end

end
