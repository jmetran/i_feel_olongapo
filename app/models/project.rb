class Project < ActiveRecord::Base

  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  attr_accessible :name, :tasks_attributes
  paginates_per 10
end
