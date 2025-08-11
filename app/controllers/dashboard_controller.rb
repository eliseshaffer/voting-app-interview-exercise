class DashboardController < ApplicationController
  def index
    # Since we're passing this to a react component, just picking the fields we need
    @votes = Vote.all.select(:candidate, :vote_count)
  end
end
