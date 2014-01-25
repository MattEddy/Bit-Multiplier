require "./multiplier"

describe Multiplier do
  it "returns 0 when anything is multiplied by 0" do
    expect(Multiplier.multiply("1", "0")).to eq "0"
  end

  it "returns the identity of anything multiplied by 1" do
    expect(Multiplier.multiply("1", "1")).to eq "1"
  end

  it "strips leading zeros" do
    expect(Multiplier.multiply("0", "10")).to eq "0"
  end

  it "multiplies 2 digits" do
    expect(Multiplier.multiply("10", "10")).to eq "100"
  end

  it "handles number of different places" do
    expect(Multiplier.multiply("10101", "10")).to eq "101010"
  end

  it "is communicative" do
    expect(Multiplier.multiply("10", "10101")).to eq "101010"
  end

  describe "multiplying a simple table of numbers" do
    (0..5).to_a.repeated_permutation(2).each do |a, b|
      it "correctly multiplies #{a.to_s(2)} * #{b.to_s(2)} as #{(a * b).to_s(2)}" do
        pending
        expect(Multiplier.multiply(a.to_s(2), b.to_s(2))).to eq((a * b).to_s(2))
      end
    end
  end
end