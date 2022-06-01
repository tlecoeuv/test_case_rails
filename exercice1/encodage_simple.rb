def encode(plain_message)
	return "" if plain_message.empty?

	encoded_message = ""
	count = 0
	plain_message = plain_message.downcase
	previous_letter = plain_message[0]

	plain_message.each_char { |c|
		if c == previous_letter
			count += 1
		else
			encoded_message += count.to_s
			encoded_message += previous_letter
			count = 1
			previous_letter = c
		end
	}
	encoded_message += count.to_s
	encoded_message += previous_letter

	return encoded_message
end

puts "___________________"
puts "test aaabcccaaa:"
puts "result  : " + encode("aaabcccaaa")
puts "expected: 3a1b3c3a"
puts "___________________"
puts "test empty string:"
puts "result  : " + encode("")
puts "expected: "
puts "___________________"
puts "test a, string of length 1:"
puts "result  : " + encode("a")
puts "expected: 1a"
puts "___________________"
puts "test abbbbccca, start with one letter in a row and finish with 1 in row:"
puts "result  : " + encode("abbbbccca")
puts "expected: 1a4b3c1a"
puts "___________________"
puts "test AaAbBBBbbCCCcz, with some upercase"
puts "result  : " + encode("AaAbBBBbbCCCcz")
puts "expected: 3a6b4c1z"
puts "___________________"