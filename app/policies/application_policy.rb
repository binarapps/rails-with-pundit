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
    check_if_admin(@user) || available_to_show?(@user, @record)
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
end
