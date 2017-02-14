class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting_number, final_number)
    (final_number..starting_number).to_a.reverse.map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    line_one = "#{start_sentence(bottle_count(number))} on the wall, #{bottle_count(number)}."
    line_two = "Take #{number == 1 ? 'it' : 'one'} down and pass it around, #{bottle_count(number - 1)} on the wall."

    if number == 0
      line_two = "Go to the store and buy some more, 99 bottles of beer on the wall."
    end

    [line_one, line_two, ''].join("\n")
  end

  private

  def bottle_count(number)
    if number > 0
      "#{number} bottle#{number == 1 ? '' : 's'} of beer"
    else
      "no more bottles of beer"
    end
  end

  def start_sentence(words)
    "#{words[0].upcase}#{words[1..-1]}"
  end
end
