FactoryGirl.define do
  
  factory :user do
     email 'ss@ss.ss'
     password '123456'
     password_confirmation '123456'
   end
   
   factory :project do
     name 'aaaaaa'
     description 'aaaaaaaaaa'
     deadline '11-11-11'
   end
end