class Polish < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :user

	default_scope {order('created_at DESC')}
end
