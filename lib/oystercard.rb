class Oystercard

attr_reader :balance, :limit
attr_accessor :in_journey

LIMIT = 90
MINIMUM_TOUCH_IN = 1

  def initialize (balance = 0, limit = LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeded limit" if exceeds_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    raise "Insufficent balance." if insufficent_funds?(amount)
    @balance -= amount
  end

  def touch_in
    raise "Insufficent funds to touch-in" if insufficent_touch_in?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
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

end
