class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # anonymous user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :member
      can :manage, Recipe
    else
      can :read, Recipe
      can :create, Recipe
    end
  end
end
