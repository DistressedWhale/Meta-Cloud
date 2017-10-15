class Main
  def startMain(reviewURL)
    require_relative './ReviewStripper'
    require_relative './Metacritic'
    m = Metacritic.new
    rs = ReviewStripper.new
    words = m.getWebsite(reviewURL)
    words = rs.stringSplit(words.downcase)

    types = rs.getWordTypeArr(words)
    output = rs.stripNonAdjectives(words,types)
    output = rs.calcFrequency(output)
  end
end
