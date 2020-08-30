class UserTeam < ApplicationRecord
  validates :user_team_name, presence: true, uniqueness: true

end
