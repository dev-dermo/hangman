def start_game
  continue = true
  
  puts "Load previous game?: Y/n"
  answer = gets.chomp
  word_array = []
  
  if answer == "y"
    File.open("5desk.txt").each do |line|
      if (line.length >= 7) and (line.length <= 14) # 5 letter words are len 7 (\r\n)
        word_array.push(line.chomp.downcase) # remove new line chars
      end
    end
  else
    lives_left = 10
  end
end

start_game