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
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to @entry
    else
      flash.now[:error] = "There was an error updating the entry"
      render :edit
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end
end
