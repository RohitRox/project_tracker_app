require 'spec_helper'

describe Project do
  
  it{ should have_valid(:name).when('The Destination','Chitwan')}
  it{ should_not have_valid(:name).when('The','aaaaa', ' ')}
  
  
end