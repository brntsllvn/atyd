class Vote < ActiveRecord::Base
  belongs_to :comic  
  belongs_to :user
end