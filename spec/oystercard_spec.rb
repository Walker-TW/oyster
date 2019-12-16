require 'oystercard'

describe Oystercard do
  it describe " Oystercard created with a default 0 balance" do
    expect(subject.balance) .to eq(0)
  end
  it describe "Top-up a card with a new balance" do
    expect(subject.top_up(10)) .to eq(subject.balance)
  end
  it describe "Check default top up limit cannot be exceeded" do
    expect { subject.top_up(Oystercard::LIMIT + 1) } .to raise_error "Exceeded limit"
  end
  it describe "Deduct money from card " do
    subject.top_up(20)
    expect(subject.deduct(10)).to eq (subject.balance)
  end
  it describe "Cannot deduct below zero" do
    subject.top_up(20)
    expect{ subject.deduct(30) }.to raise_error "Insufficent balance."
  end

  describe "Journeys"do
    it describe "#touch_in" do
      expect(Oystercard.new(10).touch_in).to eq true 
    end
  
    it describe "touch_in with not enough money" do
      expect{ subject.touch_in }.to raise_error "Insufficent funds to touch-in"
    end

    it describe "#touch_out" do
      expect(subject.touch_out).to eq false 
    end
  end




end
