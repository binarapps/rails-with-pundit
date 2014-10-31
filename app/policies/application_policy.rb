class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    check_if_admin(@user) || available_to_show?(@user, @record)
  end

  def show?
    check_if_admin(@user) || available_to_show?(@user, @record) && scope.where(:id => record.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    check_if_admin(@user) || proper_owner?(@user, @record)
  end

  def edit?
    update?
  end

  def destroy?
    check_if_admin(@user) || proper_owner?(@user, @record)
  end

  def check_if_admin(user)
    return false unless user
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

