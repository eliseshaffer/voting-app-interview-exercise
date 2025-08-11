class LoginController < ApplicationController
  def new
  end

  def create
    # Since login always succeeds, we'll just redirect or render success
    redirect_to root_path, notice: "Login successful!"
  end
end
