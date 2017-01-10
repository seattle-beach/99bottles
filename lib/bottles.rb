class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, stop)
    start.downto(stop).map {|n| verse(n) }.join("\n")
  end

  def verse(n)
    Verse[n].to_s
  end

  class Verse
    def self.[](n)
      klass = "::#{self.name.split('::').first}::Verse#{n}"
      klass = const_defined?(klass) ? const_get(klass) : self
      klass.new(n)
    end

    attr_reader :n

    def initialize(n)
      @n = n
    end

    def to_s
      <<-VERSE
#{refrain.capitalize}, #{descriptor}.
#{command}, #{succ.refrain}.
      VERSE
    end

    def refrain
      "#{descriptor} on the wall"
    end

    def descriptor
      "#{uber_quantity} of beer"
    end

    def uber_quantity
      "#{quantity} bottle#{?s if plural?}"
    end

    private

    def command
      'Take one down and pass it around'
    end

    def quantity
      n
    end

    def plural?
      n != 1
    end

    def succ
      Verse[next_verse]
    end

    def next_verse
      n - 1
    end
  end

  class Verse6 < Verse
    def uber_quantity
      '1 six-pack'
    end
  end

  class Verse1 < Verse
    def command
      'Take it down and pass it around'
    end
  end

  class Verse0 < Verse
    def command
      'Go to the store and buy some more'
    end

    def quantity
      'no more'
    end

    def next_verse
      99
    end
  end
end
