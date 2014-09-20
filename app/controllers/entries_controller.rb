class EntriesController < ApplicationController
  def index
    @entries = Entry.order('created_at DESC').all
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
