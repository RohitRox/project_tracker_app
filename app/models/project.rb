class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks
  validates :deadline, :presence => true , :format => { :with => /^(([1][012])||[0][1-9])\/(([0][1-9])||([12][0-9])||([3][0-2]))\/([2][0-9][1-9][0-9])$/}
  validates :name, :presence => true ,:length => {:minimum => 6},:format => {:with =>/^(\w|\s|[-]|['])*$/i}
  validates :description, :presence => true 
end

