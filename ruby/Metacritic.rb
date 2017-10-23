#class for getting reviews

require 'rubygems'
require 'nokogiri' #Uses gem NokoGiri which turns website into an object in rubygems
require 'open-uri' #This gem makes an HTTP request easy for accessing websites.
class Metacritic
  def getWebsite(reviewURL) #method with input as the website
      page = Nokogiri::HTML(open(reviewURL, "User-Agent" => "Whatever you want here")) #makes object
      page.css("div.review_body").text
    end
end

# puts getWebsite("http://www.metacritic.com/music/yeezus/kanye-west/")
