class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :name, :description
  validates :name, :presence => true
  validates :description, :presence => true
end

