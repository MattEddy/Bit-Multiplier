class Multiplier
	ON  = "1"
	OFF = "0"

	def self.multiply(a, b)
		opManage = OperationManager.new
		numbers_to_add_together = opManage.numbers_to_add_together(a,b)
		opManage.add_numbers_together(numbers_to_add_together)
	end

end

class OperationManager
	attr_reader :adder
	def initialize
		@adder = Adder.new
	end

	def numbers_to_add_together(a,b)
		place_holder = ""
		numbers_to_add_together = a.reverse.each_char.map do |char|
			result = char == "1" ? b + place_holder : "0"
			place_holder = place_holder + "0"
			result
		end
	end

	def add_numbers_together(nums_to_add_together)
		result = nums_to_add_together.inject("0") do |running_total, number|
			running_total = Adder.new.add(BinaryString.new(running_total),BinaryString.new(number))
			running_total
		end
	end
end

class Adder
	def add(x, y)
		sum = ""
		carry = "0"
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

	def shift_left(num_digits)
		
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
