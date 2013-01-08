class SessionsController < Devise::SessionsController
  def new
    redirect_to root_path, flash: { notice: 
                                    "Sorry, we're not currently accepting registrations" }
  end

  def create
    super
  end

  def destroy
    super
  end
end