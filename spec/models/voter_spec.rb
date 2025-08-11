require 'rails_helper'

RSpec.describe Voter, type: :model do
  describe 'validations' do
    it 'requires an email' do
      voter = Voter.new(voted_at: Time.current)
      expect(voter).not_to be_valid
      expect(voter.errors[:email]).to include("can't be blank")
    end
  end

  describe 'uniqueness' do
    it 'enforces unique email addresses' do
      Voter.create!(email: 'user@example.com', voted_at: Time.current)
      
      duplicate_voter = Voter.new(email: 'user@example.com', voted_at: Time.current)
      expect(duplicate_voter).not_to be_valid
      expect(duplicate_voter.errors[:email]).to include('has already been taken')
    end

    it 'prevents duplicate emails at the database level' do
      Voter.create!(email: 'user@example.com', voted_at: Time.current)
      
      expect {
        Voter.create!(email: 'user@example.com', voted_at: Time.current)
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
