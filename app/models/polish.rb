class Polish < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :user
	has_many :reviews, dependent: :destroy
  	has_many :favorites, dependent: :destroy
  	has_many :favorite_users, through: :favorites, source: :user
  	has_many :owns, dependent: :destroy
  	has_many :owned_users, through: :owns, source: :user
  	has_many :wants, dependent: :destroy
  	has_many :wanted_users, through: :wants, source: :user

	default_scope {order('created_at DESC')}

	validates :brand, length: { minimum: 3 }, presence: true
	validates :name, length: { minimum: 5 }, presence: true
	validates :color, presence: true
	validates :style, presence: true
	validates :user, presence: true
end
