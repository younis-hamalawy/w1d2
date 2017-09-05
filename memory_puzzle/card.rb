class Card
   attr_reader :value, :revealed
  def initialize(value)
    @value = value
    @revealed = false
  end


  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    if @revealed
      @value
    else
      "X"
    end
  end

  def ==(prev_card)
    if self.value == prev_card.value
      flip(prev_card)
      true
    else
      false
    end
  end

  def flip(prev_card)
    self.reveal
    prev_card.reveal
  end
end
