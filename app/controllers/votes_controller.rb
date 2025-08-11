class VotesController < ApplicationController
  def new
  end

  def thank_you
  end

  def create
    candidate_name = params[:candidate_name]
    
    # Find or create the vote record and increment the count
    vote = Vote.find_or_initialize_by(candidate: candidate_name)
    if vote.persisted?
      vote.increment!(:vote_count)
    else
      vote.vote_count = 1
      vote.save!
    end
    
    redirect_to thank_you_path
  end
end