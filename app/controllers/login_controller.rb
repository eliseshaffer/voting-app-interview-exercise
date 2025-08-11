class LoginController < ApplicationController
  def new
  end

  def create
    # Since login always succeeds, we'll just redirect or render success
    redirect_to new_vote_path, notice: "Login successful!"
  end
end
