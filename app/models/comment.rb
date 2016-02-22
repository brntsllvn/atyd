class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comic  

  validates :body, presence: true

  # def owner?
  #   if self.user == current_user || current_user.is_admin?
  #     return true
  #   end
  #   false
  # end

end