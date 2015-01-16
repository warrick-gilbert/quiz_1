class WelcomeController < ApplicationController
def index
  #  this makes an object called @support_requests that is stuffed full of all 
    # the support requests, and orders them by whether  done is true or not
    
    @support_requests = SupportRequest.all.order(done: :desc)
  
end

end
