require 'pry'

def dictionary
	my_d = {
		"hello" => "hi",
		"to, two, too" => "2",
		"for, four" => "4",
		"be" => "b",
		"you" => "u",
		"at" => "@",
		"and" => "&"
	}
end

def word_substituter(tweet)
	tweet = tweet.split
	short_tweet = []
	d_keys = dictionary.keys #gets array of dictionary keys

	#loops through each word of the tweet
	tweet.each do |word|
		
		#check to see if the word is in the dictionary's keys
		if d_keys.include?(word.downcase) == true
			#the word is exactly a key
			short_tweet << dictionary.fetch(word)

		
		elsif d_keys.any? { |str| str.include?(word.downcase)} == true && word.downcase != "a"
			#the word is a substring of a key, gets the index where it is found
			#fetches the appropriate abbr calling the index on the d_keys array
			d_i = d_keys.index { |s| s.include?(word.downcase)}
			short_tweet << dictionary.fetch(d_keys[d_i])

		else
			#if the word is not in the dictionary's keys, 
			#adds the original word to the short tweet
			short_tweet << word
		end
	
	end

	short_tweet.join(" ")
end

def bulk_tweet_shortener(tweets)
	tweets.each do |tweet|
		puts word_substituter(tweet)
	end
end

def selective_tweet_shortener(tweet)

	if tweet.length > 140
		tweet = word_substituter(tweet)
		puts tweet
	else
		puts tweet
	end
	tweet
end

def shortened_tweet_truncator(tweet)
	if tweet.length > 140
		tweet = word_substituter(tweet)
		if tweet.length > 140
			tweet = tweet[0...137] + "..."
		end
	end
	puts tweet
	return tweet
end
