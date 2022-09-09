=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
    
    def initialize(word)
        @word = word
    end

    def word_count
        word_counts = {}
        words = @word.gsub(/[^a-z0-9']/i," ").downcase.split(" ")
        words.each do |word|
            word.gsub!(/^'|'$/,"")
            if !word_counts.key?(word)
                word_counts[word] = 1
            else
                word_counts[word] += 1
            end
        end
        word_counts
    end
end