require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it 'requires a candidate name' do
      vote = Vote.new(vote_count: 1)
      expect(vote).not_to be_valid
      expect(vote.errors[:candidate]).to include("can't be blank")
    end

    it 'requires a vote count' do
      vote = Vote.new(candidate: 'John Doe')
      expect(vote).not_to be_valid
      expect(vote.errors[:vote_count]).to include("can't be blank")
    end
  end

  describe 'uniqueness' do
    it 'enforces unique candidate names' do
      Vote.create!(candidate: 'John Doe', vote_count: 5)
      
      duplicate_vote = Vote.new(candidate: 'John Doe', vote_count: 3)
      expect(duplicate_vote).not_to be_valid
      expect(duplicate_vote.errors[:candidate]).to include('has already been taken')
    end

    it 'prevents duplicate candidates at the database level' do
      Vote.create!(candidate: 'John Doe', vote_count: 5)
      
      expect {
        Vote.create!(candidate: 'John Doe', vote_count: 3)
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
