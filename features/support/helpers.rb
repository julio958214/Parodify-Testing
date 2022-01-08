require "httparty"

module Helpers
  def delorean
    HTTParty.get("https://parodify.herokuapp.com/helpers?email=testerqaparodify@gmail.com")
  end
end
