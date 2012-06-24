# Defines the abilities of a user.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # anonymous user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :member
      can :manage, Recipe
    end
  end
end
