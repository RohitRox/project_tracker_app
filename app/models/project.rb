class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks
  validates :deadline, :presence => true 
  validates :name, :presence => true ,:length => {:minimum => 6}
  validates :description, :presence => true 
end
