require_relative 'station'
require_relative 'journey'

class Oystercard

attr_reader :balance, :limit, :entry_station
attr_accessor :journeys

LIMIT = 90
MINIMUM_TOUCH_IN = 1
MINIMUM_FARE = 2

  def initialize (balance = 0, limit = LIMIT)
    @balance = balance
    @limit = limit
    @journeys = []
  end

  def top_up(amount)
    raise "Exceeded limit" if exceeds_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficent funds to touch-in" if insufficent_touch_in?
    @entry_station = entry_station
  end

  def touch_out(exit)
    deduct(MINIMUM_FARE) if in_journey?
    @journeys << {entry: @entry_station, exit: exit}
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def exceeds_limit?(amount)
    @limit < @balance + amount
  end

  def insufficent_funds?(amount)
    0 > @balance - amount
  end

  def insufficent_touch_in?
    MINIMUM_TOUCH_IN > @balance
  end
  
  def deduct(amount)
    raise "Insufficent balance." if insufficent_funds?(amount)
    @balance -= amount
  end
end
