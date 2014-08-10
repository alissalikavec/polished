class PolishPolicy < ApplicationPolicy
	def index?
		true
	end

	def update?
		create?
	end

	def create?
		user.present? && user.role?(:admin)
	end
end