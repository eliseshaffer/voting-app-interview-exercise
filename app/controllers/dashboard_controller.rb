class DashboardController < ApplicationController
  def index
    @votes = Vote.all.select(:candidate, :vote_count)
  end
end
