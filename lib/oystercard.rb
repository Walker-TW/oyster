class Oystercard

attr_reader :balance, :limit

LIMIT = 90


  def initialize (balance = 0, limit = LIMIT)
    @balance = balance
    @limit = limit
  end

  def top_up(amount)
    raise "Exceeded limit" if exceeds_limit?(amount)
    @balance += amount
  end


  private

  def exceeds_limit?(amount)
    @limit < @balance + amount
  end

end
