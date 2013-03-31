require_relative "../lib/lang"

describe JeffLang do

  before :each do
    @message = JeffLang.new('hello world my name is jeff')
  end

  describe "#new" do

    it "is a instance of JeffLang" do
      @message.should be_an_instance_of JeffLang
    end

    it "doesn't take more than two arguments" do
      lambda { JeffLang.new("hello", 4, 7) }.should raise_error ArgumentError
    end

  end

  describe "#text_to_a" do

    it "splits the text into an array" do
      @message.text_to_a.should be_kind_of Array
    end

    it "has the same contents of orginal text" do
      array = ["hello", "world", "my", "name", "is", "jeff"]
      @message.text_to_a.should eq(array)
    end

  end

  describe "#word_count" do

    it "has the same word count as original text" do
      @message.word_count.should eq(6)
    end

  end

  describe "#scramble" do

    it "returns a scrambled message" do
      @message.scramble.should eq("axoom pmgok yv jtyx ce hxii")
    end

  end

  describe "#translate" do

    it "returns a translated message" do
      JeffLang.new('axoom pmgok yv jtyx ce hxii').translate.should eq("hello world my name is jeff")
    end

  end

end
