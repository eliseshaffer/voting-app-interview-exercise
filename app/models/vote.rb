class Vote < ApplicationRecord
  validates :candidate, presence: true, uniqueness: true
  validates :vote_count, presence: true
end
