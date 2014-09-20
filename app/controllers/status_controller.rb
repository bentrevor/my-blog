class StatusController < ApplicationController
  def about
  end

  def tic_tac_toe
    render 'entries/tic_tac_toe', layout: false
  end
end
