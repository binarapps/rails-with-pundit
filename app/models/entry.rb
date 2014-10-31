class Entry < ActiveRecord::Base
  belongs_to :user

  def proper_owner?(user)
    self.user == user
  end
end
