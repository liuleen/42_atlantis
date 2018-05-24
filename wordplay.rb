#!/usr/bin/env ruby

class WordPlay
	def self.switch_pronouns(text)
		text.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
			case pronoun.downcase
			when "i" then "you"
			when "you" then "me"
			when "me" then "you"
			when "i am" then "you are"
			when "you are" then "i am"
			when "your" then "my"
			when "my" then "your"
			end.sub(/^me\b/i, 'i')
		end
	end
	
		def self.best_sentence(sentences, desired_words)
			ranked_sentences = sentences.sort_by do |s|
				s.words.length - (s.downcase.words - desired_words).length
			end

			ranked_sentences.last
		end
end

class String
	def sentences
		gsub(/\n|\r/,' ').split(/\.\s*/)
	end

	def words
		scan(/\w[\w\'\-]*/)
	end
end

# hot_words = %w{test ruby}
# my_string = "This is a test. Dull sentence here. Ruby is great. So is cake."
# my_string.sentences.find_all do |s|
# s.downcase.words.any? { |word| hot_words.include?(word) }
# end

# while input = gets
# 	puts '>> ' + WordPlay.switch_pronouns(input).chomp + '?'
# end

# puts "This is a test of words' capabilities".words
# puts %q{Hello. This is a test of basic sentence splitting. It even works over multiple lines}.sentences[1].words[3]
# puts WordPlay.switch_pronouns("Your cat is fighting with my cat")
