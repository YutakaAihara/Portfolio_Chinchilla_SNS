class CommunityMember < ApplicationRecord
  belongs_to :community_members
  belongs_to :owner
end
