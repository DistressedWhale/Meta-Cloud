#ReviewStripper, integrated into a single class file by Sam Whale (From Code snippets by multiple group members)
require 'PearsonLongman-Dictionary'
require 'sort_alphabetical'

class ReviewStripper
    #<---------------------Code by Sam Whale--------------------------------------------->
    include DictionaryLookup
    def getWordType(word)
            begin
                DictionaryLookup::Base.define(word).first.part_of_speech #gets type of word
            rescue #error handling
                return 'invalid' #invalid is useful for debugging, and will be converted to a noun later anyway
            else
                puts("Got word: " + word) #debug statement
                return DictionaryLookup::Base.define(word).first.part_of_speech
            end
    end
    
    def getWordTypeArr(a)
        out = []
        counter = 0
        target = a.length
        whitelist = []
        blacklist = []

        a.each_index do |x|
            #try to find word in blacklist or whitelist
            if whitelist.include?(a[x])
                out << 'adjective'
            elsif (blacklist.include?(a[x])) or (a[x].length < 4) then
                out << ' '
            else
                #otherwise look it up
                current = getWordType(a[x])
                if current == "adjective"
                    whitelist << a[x] #add to whitelist
                    out << current
                else
                    blacklist << a[x] #add to blacklist
                    out << ' '
                end
            end
        end
    return out
end

    #<---------------------Code by Alex Hughes Davies------------------------------------>

    #String splitter. E.g. takes sentence and cuts the words out into an Array.
    #Sentence is a String argument.
    def stringSplit(s)
        wordArray = []  #this array is to contain each of the words from the sentence
        wordArray = s.split(/\W+/)
        return wordArray
    end

    #<--------------------Code by Alex Shmerg Schudel, revised by Sam Whale--------------->
    #Words - The original words (After Stringsplit)
    #Types - A corresponding array of the types of the words in the 'Words' Array (noun, adjective etc)
    #Finds the adjectives, strips out other types to Null

    #Puts the adjectives from Words in an array
    def stripNonAdjectives(words,types)
        outputList = []
        # method_WordTypes(types)
        types.each_index do |i|
            outputList << words[i] if types[i] == 'adjective'
        end
        
        return outputList
    end

    #counts frequency, returns word followed by the frequency in an array (overall array is 2d)
    def calcFrequency(a) #v1 by alex, v2 by Sam Whale
        frequency = [[]] #2d array for the output
        wordsAlreadyPicked = [] #array of the words already counted
        counter = 0
        a.each_index do |x| #for each word
            if ([a[x]] & (wordsAlreadyPicked)).empty? #If a[x] has not already been picked
                counter = a.count(a[x])
                frequency << [a[x],14] #pack up the word and the counter. **-1 does the weighting.
                wordsAlreadyPicked << a[x]
            end
        end
        return frequency
    end
end
