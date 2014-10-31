class EntryPolicy < ApplicationPolicy
  def initalize(user, entry)
    super
  end

  def proper_owner?(user, entry)
    entry.proper_owner?(user, entry)
  end

  def available_to_show?(user, entry)
    return true if entry.published
    entry.proper_owner?(user)
  end
end
