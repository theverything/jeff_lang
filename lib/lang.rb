class JeffLang

  @@key = {"a"=>"t", "b"=>"n", "c"=>"b", "d"=>"k", "e"=>"x", "f"=>"i", "g"=>"r", "h"=>"a", "i"=>"c", "j"=>"h", "k"=>"f", "l"=>"o", "m"=>"y", "n"=>"j", "o"=>"m", "p"=>"q", "q"=>"z", "r"=>"g", "s"=>"e", "t"=>"u", "u"=>"l", "v"=>"w", "w"=>"p", "x"=>"s", "y"=>"v", "z"=>"d"}

  attr_accessor :text

  def self.create_key
    hash = {}
    i = 0
    a1 = ('a'..'z').to_a
    a2 = a1.shuffle
    a1.each do |letter|
      hash[letter] = a2[i]
      i += 1
    end
    @@key = hash
    puts "Make sure to save your new key!!!\n Key - #{hash}"
  end

  def initialize(text, key = nil)
    @text = text.downcase || ""
    @key = key ? key : @@key
  end

  def translate
    translated_message = []
    word_count.times do |i|
      translated_message << text_to_a[i].split("").map { |letter| letter = @key.invert[letter] }.join("")
    end
    translated_message.join(" ")    
  end

  def scramble
    scrambled_message = []
    word_count.times do |i|
      scrambled_message << text_to_a[i].split("").map { |letter| letter = @key[letter] }.join("")
    end
    scrambled_message.join(" ")
  end

  def text_to_a
    @text.split(" ")
  end

  def word_count
    text_to_a.size
  end


end