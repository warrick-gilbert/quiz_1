class WelcomeController < ApplicationController
def index
  #  this makes an object called @support_requests that is stuffed full of all 
    # the support requests, and orders them by whether they're done or not
    
    @support_requests = SupportRequest.all.order(done: :asc)
  
end

end
