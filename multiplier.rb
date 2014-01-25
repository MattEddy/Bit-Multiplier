class Multiplier
	ON  = "1"
	OFF = "0"

	def self.multiply(a, b)


		adder = Adder.new
		puts adder.add("0","0")
		place_holder = ""
		sum = "0"	  

 
 		puts "\n\n"

 		puts "started with #{a} and #{b}"

		numbers_to_add_together = a.each_char.map do |char|
			result = char == "1" ? b + place_holder : "0"
			place_holder = place_holder + "0"
			result
		end

		p numbers_to_add_together

		result = numbers_to_add_together.inject("0") do |running_total, number|
			puts "Adding #{running_total} to #{number}"
			running_total = Adder.new.add(running_total, number)
			puts "Got #{running_total}"
			running_total
		end
	end


	

	# adder.add(sum, (b + place_holder))
end

class MaxSize
end

class Adder
	def add(x, y)
		sum = ""
		carry = "0"
		# x = "0" + x
		# y = "0" + y
		if x.length > y.length
			until y.length == x.length do
				y = "0" + y
			end 
		elsif y.length > x.length 
			until x.length == x.length do
				x = "0" + x
			end 
		end
		
		x.each_char.with_index do |char, index|
			char2 = y.split('')[index]
			if char == "0" && char2 == "0" && carry == "0"
				sum = "0" + sum
			elsif (char == "0" && char2 == "1" || char == "1" && char2 == "0") && carry == "0"
				sum = "1" + sum
			elsif (char == "1" && char2 == "1" || char == "1" && char2 == "1") && carry == "0"
				sum = "0" + sum
				carry = "1"
			elsif char == "0" && char2 == "0" && carry == "1"
				sum = "1" + sum
				carry = "0"
			elsif (char == "0" && char2 == "1" || char == "1" && char2 == "0") && carry == "1"
				sum = "0" + sum
				carry = "1"
			elsif (char == "1" && char2 == "1" || char == "1" && char2 == "1") && carry == "0"
				sum = "1" + sum
				carry = "1"
			end
		end
		sum
	end
end


# class Boolean
# 	def and input_string, comparison_string 
# 		output
# 		input_string.each_char.with_index do |char, index|
# 			if char == comparison_string.split('')[index] && char != "O"
# 				output.push(char)
# 			end
# 		end
# 	end
# end

# class BitShifter
# 	def shift_left (input_string)
# 		input_string[1,-1]
# 		input_string + "0"
# 	end
# end

# class BitMask

# end
