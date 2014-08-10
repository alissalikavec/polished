class OwnPolicy < ApplicationPolicy
	def create?
		user.present?
	end

	def destroy?
		create?
	end
end