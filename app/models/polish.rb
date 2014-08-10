class Polish < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :user
	has_many :reviews, dependent: :destroy

	default_scope {order('created_at DESC')}

	validates :brand, length: { minimum: 3 }, presence: true
	validates :name, length: { minimum: 5 }, presence: true
	validates :color, presence: true
	validates :style, presence: true
	validates :user, presence: true
end
