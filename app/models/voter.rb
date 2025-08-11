class Voter < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
