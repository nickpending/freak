module Freak
  module Frequency
    
    # Thanks wikipedia!
    ENGLISH_FREQUENCY = {
        "e" => 0.12702,
        "t" => 0.09056,
        "a" => 0.08167,
        "o" => 0.07507,
        "i" => 0.06966,
        "n" => 0.06749,
        "s" => 0.06327,
        "h" => 0.06094,
        "r" => 0.05987,
        "d" => 0.04253,
        "l" => 0.04025,
        "c" => 0.02782,
        "u" => 0.02758,
        "m" => 0.02406,
        "w" => 0.02360,
        "f" => 0.02228,
        "g" => 0.02015,
        "y" => 0.01974,
        "p" => 0.01929,
        "b" => 0.01492,
        "v" => 0.00978,
        "k" => 0.00772,
        "j" => 0.00153,
        "x" => 0.00150,
        "q" => 0.00095,
        "z" => 0.00074
    }
    PRINTABLE="[a-z0-9]"
    ALPHA="[a-z]"
    
    # Perform frequency counts
    def self.frequency(data)
      results = data.split(//).inject(Hash.new(0)) do |h, c|
        # Ignore case
        character = c.downcase
        
        # Encode "unprintables"
        character = encode(character) if unprintable?(character)
        h[character] += 1
        h 
      end
    end
    
    # Calculate the relative frequency of characters in the ENGLISH set
    def self.relative_frequency(data)
      # Generate total length
      length = length(data)
      results = Hash.new(0)
      
      ENGLISH_FREQUENCY.keys.each do |k|
        results[k] = (data[k] / length.to_f).round(2)
      end
      # Check that results are equal to 1
      results
    end
    
    # Calculates the length of the ENGLISH character set
    # Takes a hash and regex
    def self.length(data, regex=nil)
      # Default regex
      regex ||= ALPHA
      
      # Use ENGLISH_FREQUENCY hash instead of source string because
      # we encoded unprintables as 0x?? and that will "match" our regex
      length = 0
      ENGLISH_FREQUENCY.keys.each do |k|
        length += data[k] unless k.match(Regexp.new(regex)).nil?
      end
      length
    end
    
    # TODO - Generate ascii histogram
    def self.histogram(data)
      #data.each_keys do |key|
      #end
    end
    
    # Check for characters in our unprintable ranges
    def self.unprintable?(character, regex=nil)
      regex ||= PRINTABLE
      return true if character.match(Regexp.new(regex)).nil?
      return false
    end
    
    # Encode unprintable characters as hex strings
    def self.encode(character)
      return "0x" + character.unpack("H*").join
    end
    
    # Create a header for CSV data
    def self.header(data)
      header = []
      data.keys.each { |k| header << k }
      header.join(",")
    end
    
    # Output csv
    def self.csv(data)
      # Error if a hash isn't passed
      raise "Invalid type" unless data.kind_of?(Hash)

      # Create the row
      result = []
      data.each_key { |k| result << "#{k},#{data[k]}" }
      result.join(",")
    end
    
    # Perform analysis of top n characters (as determined by ranking)
    def self.top(data, n)
      # Error if a hash isn't passed
      raise "Invalid type" unless data.kind_of?(Hash)
      
      data.select { |k, v| ENGLISH_FREQUENCY.keys[0,n].include?(k) }
    end
  end
end