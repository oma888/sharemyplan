class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    true
    # record.cotisation.user == user && record.cotisation.reviews.count < 1
  end

end
