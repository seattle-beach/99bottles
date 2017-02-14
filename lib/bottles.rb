class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting_number, final_number)
    starting_number.downto(final_number).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    line_one = "#{bottle_count(number).capitalize} of beer on the wall, #{bottle_count(number)} of beer."
    line_two = "Take #{number == 1 ? 'it' : 'one'} down and pass it around, #{bottle_count(number - 1)} of beer on the wall."

    if number == 0
      line_two = "Go to the store and buy some more, 99 bottles of beer on the wall."
    end

    [line_one, line_two, ''].join("\n")
  end

  private

  def bottle_count(number)
    if number > 0
      "#{number} bottle#{number == 1 ? '' : 's'}"
    else
      "no more bottles"
    end
  end
end
