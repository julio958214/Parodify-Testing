require 'httparty'

#---> consumes service that deletes user from base
module Helpers
  def delorean
    HTTParty.get('https://parodify.herokuapp.com/helpers?email=testerqaparodify@gmail.com')
  end
end
