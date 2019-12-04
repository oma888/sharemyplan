class CotisationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def show?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end

  def dashboard?
    true
  end

  def destroy?
    (record.subscription.user == user) || (record.user == user)
  end

  def suppression?
    (record.subscription.user == user) || (record.user == user)
  end

  # def edit?
  #   update?
  # end

  # def update?
  #   record.user == user
  # end
end
