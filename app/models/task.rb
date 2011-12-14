class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :name
  attr_accessible :name, :description
end

