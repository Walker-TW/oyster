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
end
