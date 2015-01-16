class SupportRequestsController < ApplicationController

  def new
    @support_request = SupportRequest.new
    
  end

  def create
    # the params from our form inclued a lot of just we don't want, we just want the question key value.
    # this will make a new support_request object for our db.
    # this is an instance variable so that we can access it's errors
    @support_request = SupportRequest.new support_request_params
    # this doens't yet put the object in the db, it has to be validated
    if @support_request.save
      redirect_to support_requests_path 
    else
      # show the form again with error, and use the layout called "special"
      render :new, layout: "special"
            # render :new
    end
  # render text: params
  end

  def show
    # take the user to their support request.
    @support_request = SupportRequest.find params[:id]
  end

  def edit
    @support_request = SupportRequest.find params[:id]
  end

  def update
    @support_request = SupportRequest.find params[:id]
    if @support_request.update support_request_params
      redirect_to support_requests_path
    else
      # using render here keeps the values the user put in. 
      # if you don't use render, it starts a different cycle, and all
      # the user's entries will be lost.
      render :edit
    end
  end

  def destroy
    @support_request = SupportRequest.find params[:id]
    @support_request.destroy
    redirect_to support_requests_path
  end

  def toggle_done
    # code to toggle the status of the clicked object

    # then send user back to main page
    redirect_to support_requests_path

  end

  private
  def support_request_params
    # this is a security step. It only lets the variables through that we want.
    # this says, go to params, look for a key called question, and only allow the title and body values.
    support_request_params = params.require(:support_request).permit([:name, :email, :department, :message])
    
  end

end
