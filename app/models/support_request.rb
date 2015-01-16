class SupportRequest < ActiveRecord::Base

# validation, callbacks, reordering with SQL, goes here
# this demands that the title exist before allowing this to enter the db
# here we can change the error messages that Rails gives
validates :name, presence: {message: "Please provide your name. "}

validates :email, presence: {message: "Please provide your email address. "}  

# validates :email, presence: {message: "Please provide your email address. "}, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


# code to set initial value of "done" to false. This is run every time a record is retrieved.
  after_initialize :defaults

  def defaults
    self.done = false if self.done.nil?
  end

end
