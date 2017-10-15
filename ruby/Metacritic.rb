#class for getting reviews

require 'rubygems'
require 'nokogiri' #Uses gem NokoGiri which turns website into an object in rubygems
require 'open-uri' #This gem makes an HTTP request easy for accessing websites.
class Metacritic
  def getWebsite(baseURL) #method with input as the website
    #reviewURL http://www.metacritic.com/music/yeezus/kanye-west/critic-reviews
    #userURL http://www.metacritic.com/music/yeezus/kanye-west/user-reviews
    text = ""
    userCritic = ["user", "critic"]

    userCritic.each do |person|
      page = Nokogiri::HTML(open(baseURL + person + '-reviews', "User-Agent" => "Whatever you want here")) #makes object
      text += page.css("div.review_body").text
    end

    return text
    #return "Great Amazing hello incredible world beautiful"
  end
end

# puts getWebsite("http://www.metacritic.com/music/yeezus/kanye-west/")
