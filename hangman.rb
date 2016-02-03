def find_replace_letter(word, letter, board)
  position = 0
  
  while position < word.length
    if letter == word[position]
      board[position] = letter
    end
    position += 1
  end
  
  return word, letter, board
end

def start_game
  continue = true
  
  puts "Load previous game?: Y/n"
  answer = gets.chomp
  word_array = []
  
  if answer == "n"
    File.open("5desk.txt").each do |line|
      if (line.length >= 7) && (line.length <= 14) # 5 letter words are len 7 (\r\n)
        word_array.push(line.chomp.downcase) # remove new line chars
      end
    end
    
    word = word_array[rand(word_array.length)]
    board = "_" * word.length
    lives_left = 10
    
    # puts word #this is the answer
    puts board
    puts "You have #{lives_left} lives left!"
  else
    # board and word and turns left are set equal to values loaded from csv
    lives_left = 2
    board = "_____**____"
    word = "shite"
  end
  
  while continue
    puts "What letter would you like to guess?:"
    letter = gets.chomp
    
    if word.include? letter
      find_replace_letter(word, letter, board)
    else
      lives_left -= 1
    end
    
    puts board
    puts "You have #{lives_left} lives left!"
    
    if lives_left == 0
      puts "YOU LOSE, GAME OVER!"
      puts "The word was #{word}"
      continue = false
    end 
    
    unless board.include?("_")
      puts "CONGRADULATIONS, YOU WIN!"
      continue = false
    end
  end
end

start_game