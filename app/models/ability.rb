class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is?('admin')
      can :manage, :all
    else
      can :read, :all
      can :create, Annotation
      can [:update, :destroy], Annotation, user_id: user.id.to_s
    end
  end
end
