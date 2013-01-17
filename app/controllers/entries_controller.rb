class EntriesController < ApplicationController
  before_filter :authenticate_user!, except: [ :about, :show, :index ]
  load_and_authorize_resource except: [ :about, :show ]

  def index
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
  end

  def create
    if @entry.save
      redirect_to @entry, flash: { success: "Entry successfully created" }
    else
      flash.now[:error] = "There was an error saving the entry"
      render :new
    end
  end

  def edit
  end

  def update
    if @entry.update_attributes(params[:entry])
      redirect_to @entry
    else
      flash.now[:error] = "There was an error updating the entry"
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end

  def about
  end
end
