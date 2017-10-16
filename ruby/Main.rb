class Main
  def startMain(reviewURL)
    require_relative './ReviewStripper'
    require_relative './Metacritic'
    m = Metacritic.new
    rs = ReviewStripper.new
    words = m.getWebsite(reviewURL)
    words = rs.getWordTypeArr(words.downcase.split(/\W+/))
    words = rs.calcFrequency(words)
  end
end