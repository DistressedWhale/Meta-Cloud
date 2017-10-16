#ReviewStripper, integrated into a single class file by Sam Whale (From Code snippets by multiple group members)
require 'PearsonLongman-Dictionary'
require 'sort_alphabetical'

class ReviewStripper
    #<---------------------Code by Sam Whale--------------------------------------------->
    include DictionaryLookup
    def getAdjectives(a)
        out = Array.new
        whitelist = Array.new
        blacklist = Array.new

        a.each_index do |x|
            #try to find word in blacklist or whitelist
            if whitelist.include?(a[x])
                out << a[x]
            elsif !(blacklist.include?(a[x])) then 
              
              #otherwise look it up
                current = DictionaryLookup::Base.define(a[x]).first.part_of_speech
                if current == "adjective"
                    whitelist << a[x] #add to whitelist
                    out << a[x]
                else
                    blacklist << a[x] #add to blacklist
                end
                
            end
        end
    return out
    end

    #<--------------------Code by Alex Shmerg Schudel, revised by Sam Whale--------------->
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
