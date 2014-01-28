class Multiplier
	ON  = "1"
	OFF = "0"

	def self.multiply(a, b)


		adder = Adder.new
		place_holder = ""
		sum = "0"	  

		numbers_to_add_together = a.reverse.each_char.map do |char|
			result = char == "1" ? b + place_holder : "0"
			place_holder = place_holder + "0"
			result
		end

		result = numbers_to_add_together.inject("0") do |running_total, number|
			running_total = Adder.new.add(running_total, number)
			running_total
		end
	end
end

class Adder
	def add(x, y)
		sum = ""
		carry = "0"
		x = BinaryString.new(x)
		y = BinaryString.new(y)
		x, y = StringPadder.equalize_lengths(x, y)

		x.digits_from_right.to_enum.with_index do |char, index|
			char2 = y.digits_from_right[index]
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

		if carry == "1"
			sum = "1" + sum
		end
		
		return sum if sum == "0"
		return "0" if sum[/^0*$/]
		sum.sub(/^0*/, "")
	end
end

class BinaryString < String
	def digits_from_right
		split('').reverse
	end	
end

class StringPadder
	def self.equalize_lengths(x, y)
		if x.length > y.length
			until y.length == x.length do
				y = "0" + y
			end
		elsif y.length > x.length
			until x.length == y.length do
				x = "0" + x
			end
		end

		[BinaryString.new(x), BinaryString.new(y)]
	end
end
