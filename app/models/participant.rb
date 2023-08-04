class Participant < ApplicationRecord
  belongs_to :retro

  after_update_commit lambda {
    broadcast_update_to "participant_#{id}",
      partial: '/pointing/points_remaining',
      locals: { votes_remaining: votes }
  }
end
