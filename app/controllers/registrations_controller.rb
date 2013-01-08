class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, flash: { notice: 
                                    "Sorry, we're not currently accepting registrations" }
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
    redirect_to root_path, flash: { notice: 
                                    "Sorry, we're not currently accepting registrations" }
  end
end