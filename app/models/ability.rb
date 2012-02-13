class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is?('admin')
      can :manage, :all
    else
      can :read, :all
      can :read, Scenario, active: true
      can :create, Annotation
      can [:update, :destroy], Annotation do |annotation|
        annotation.user_id == user.id
      end
    end
  end
end
