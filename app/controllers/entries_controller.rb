class EntriesController < ApplicationController
  def index
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new()
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to @entry, flash: { success: "Entry successfully created" }
    else
      flash.now[:error] = "There was an error saving the entry"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
