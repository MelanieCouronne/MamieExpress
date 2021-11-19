class TravelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: nil)
    end
  end

  def show?
    true  # Anyone can view a travel
  end

  def create?
    true  # Anyone can create a travel
  end

  def update?
    record.user == user  # Only travel creator can update it
  end

  def destroy?
    record.user == user  # Only travel creator can update it
  end

  def seats?
    record.user != user
  end
end
