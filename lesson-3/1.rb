require "rspec"

def wordScript(word)
  word = word.chomp # Удаляем возможные пробельные символы в конце слова
  if word[-2..-1].casecmp("CS").zero?
    2**word.size
  else
    word.reverse
  end
end

puts 'Введите слово: '
word = gets.chomp
puts 'Результат: '
puts wordScript(word)

RSpec.describe "#wordScript" do
  it "returns 2 to the power of the length of the word if it ends with 'CS'" do
    expect(wordScript("hCS")).to eq(8)
    expect(wordScript("HELLOCS")).to eq(128)
    expect(wordScript("abcdCS")).to eq(64)
  end

  it "returns the word reversed if it does not end with 'CS'" do
    expect(wordScript("hello")).to eq("olleh")
    expect(wordScript("world")).to eq("dlrow")
    expect(wordScript("test")).to eq("tset")
  end

  it "is case insensitive for the 'CS' ending" do
    expect(wordScript("hcs")).to eq(8)
    expect(wordScript("HelLoCs")).to eq(256)
  end
end

# Для запуска тестов в консоли:
# rspec <имя_файла>.rb
