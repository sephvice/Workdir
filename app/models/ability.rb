class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= Staff.new # guest user (not logged in)
      # if user.current_sign_in_at?
      #   can :update, Feed, :current_ability => true
      # else
      #   can :read, :all
      # end
      can [:update, :destroy], Feed do |feed|
         feed.staff_id == user.id
     end

     can [:update, :destroy], Comment do |comment|
       comment.staff_id == user.id
     end

     can [:update, :destroy], Staff do |staff|
       staff.id == user.id
     end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    # end
  end
end
