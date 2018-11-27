def create_dictionary file
  dictionary = []
  File.open(file).each do |word|
    if (word.strip.length >= 5 && word.strip.length <= 12)
      dictionary.push(word.strip)
    end
  end
  dictionary
end

def random_word dictionary
  max = dictionary.length
  random_index = rand(0..max)
  dictionary[random_index]
end

def create_guess_stub solution
  stub = ""
  solution.each_char do |letter|
    stub += "_"
  end
  stub
end

def insert_letters (letter, solution, guess)
  i = 0
  while (i < solution.length)
    if (letter == solution[i])
      guess[i] = letter
    end
    i += 1
  end
end

def game_over? (solution, guess)
  solution == guess
end

dictionary = create_dictionary "5desk.txt"
solution = random_word dictionary
guess = create_guess_stub solution
tries = 0
wrong_letters = []
puts guess

while (not game_over?(solution, guess) || tries >= 6)
  puts "Insert a letter: "
  letter = gets.chomp.downcase!
  if (solution.include? letter)
    insert_letters(letter, solution, guess)
  else
    wrong_letters.push(letter)
    tries += 1
  end
  puts guess
  puts wrong_letters.join(", ")
end

tries >= 6 ? "You lost!" : "You win!"

  