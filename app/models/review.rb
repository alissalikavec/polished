class Review < ActiveRecord::Base
  belongs_to :polish
  belongs_to :user
end
