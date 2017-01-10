class Bottles
  def song
    verses(99, 0)
  end

  def verses(max, min)
    max.downto(min).map {|bottles| verse(bottles)}.join("\n")
  end

  def verse(num)
    first_line(num) + second_line(num)
  end

  def bottles(num)
    if num == 0
      'no more bottles'
    else
      "#{num} bottle#{'s' if num!=1}"
    end
  end

  def it(num)
    num == 1 ? 'it' : 'one'
  end

  def first_line(num)
    "#{bottles(num).capitalize} of beer on the wall, " +
      "#{bottles(num)} of beer.\n"
  end

  def second_line(num)
    first = if num == 0
      leftover_beers = 99
      "Go to the store and buy some more, "
    else
      leftover_beers = num-1
      "Take #{it(num)} down and pass it around, "
    end

    first + "#{bottles(leftover_beers)} of beer on the wall.\n"
  end
end
