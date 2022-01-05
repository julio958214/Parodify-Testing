require "httparty"

module Helpers
  def delorean(email)
    HTTParty.get("https://parodify.herokuapp.com/helpers?email=testerqaparodify@gmail.com")
  end
end
