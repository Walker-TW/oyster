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

  describe "Journeys"do
    it describe "#touch_in" do
      expect(Oystercard.new(10).touch_in).to eq true
    end

    it describe "touch_in with not enough money" do
      expect{ subject.touch_in }.to raise_error "Insufficent funds to touch-in"
    end

    it describe "#touch_out" do
      subject.top_up(20)
      expect(subject.touch_out).to eq false
    end

    it describe "#touch-out reduces balance by minimum fare" do
      subject.top_up(20)
      subject.touch_in
      expect {subject.touch_out} .to change { subject.balance } .by(-Oystercard::MINIMUM_FARE)
    end
  end
end
