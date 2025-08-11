class VotesController < ApplicationController
  def new
    # Check if voter has already voted
    if session[:voter_email] && Voter.exists?(email: session[:voter_email])
      redirect_to thank_you_path, alert: "You have already voted!"
      return
    end
    
    @candidates = Vote.all.map(&:candidate)
    @candidate_count = Vote.count
  end

  def thank_you
  end

  def create
    # Check if voter has already voted
    voter_email = session[:voter_email]
    if !voter_email || Voter.exists?(email: voter_email)
      redirect_to thank_you_path, alert: "You have already voted or are not logged in!"
      return
    end
    
    candidate_name = params[:candidate_name]
    
    # Find or create the vote record and increment the count
    vote = Vote.find_or_initialize_by(candidate: candidate_name)
    if vote.persisted?
      vote.increment!(:vote_count)
    else
      vote.vote_count = 1
      vote.save!
    end
    
    # Create voter record to mark as voted
    # In  a more robust version, we might use a join table, but since we're a
    # assuming good faith, I figured this would save time.
    Voter.create!(email: voter_email, voted_at: Time.current)
    
    redirect_to thank_you_path
  end
end
