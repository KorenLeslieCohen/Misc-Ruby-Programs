=begin
Ruby Tic Tac Toe REVISED
(c) Koren Leslie Cohen 2014
=end

@line = "==============================================================="
@header =  "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

# welcome message and directions:
puts "\n\n" + @header
puts @line
puts "HELLO!!! Welcome to Ruby Tic Tac Toe!"
puts @line
puts @header
puts "\nTo play this version of Tic Tac Toe, you will need TWO players."
puts "Player one will be X, and player two will be O. You will take turns playing."
puts "Player one will go first.  You must decide who will be players one and two."
puts "You can switch it up if you play again!\n\n"

# get and define player info:
puts @line
puts "PLAYER ONE: What is your name?"
@player_one = gets.chomp
puts "Hello #{@player_one}, you are X. You go FIRST!\n\n"

puts @line
puts "PLAYER TWO: What is your name?"
@player_two = gets.chomp
puts "Hello #{@player_two}, you are O. You go SECOND!\n\n"

# creates new hash which represents the board's tiles
@board = {
	0 => "   ",
	1 => "   ",
	2 => "   ",
	3 => "   ",
	4 => "   ",
	5 => "   ",
	6 => "   ",
	7 => "   ",
	8 => "   ",
	}
	
# winning constants
WINX = " X  X  X "
WINO = " O  O  O "	

# prints directions and confirms user understands
puts @line
puts "DIRECTIONS"
puts @line
puts "The board's numbers are as follows:\n\n"
puts " 0 | 1 | 2 "
puts "____________"
puts " 3 | 4 | 5 "
puts "____________"
puts " 6 | 7 | 8 \n\n"
puts "When it is your turn, you will be asked to place an X or an O on the board.\n"
puts "You must choose your spot based on the above numbers."
puts @line
puts "\nHit enter to show you understand!"
gets	

# method that prints current board
def print_board	
	puts "\n\nThis is the current board, and a reminder of the square numbers!"
	puts @line
	puts "CURRENT BOARD                        SQUARE NUMBERS"
	puts @line
	print @board[0], "|", @board[1], "|", @board[2], "                             0 | 1 | 2 "
	print "\n____________", "                          ____________\n"
	print @board[3], "|", @board[4], "|", @board[5], "                             3 | 4 | 5 "
	print "\n____________", "                          ____________\n"
	print @board[6], "|", @board[7], "|", @board[8], "                             6 | 7 | 8 "
	puts "\n#{@player_one} is X."
	puts "#{@player_two} is O."
	puts @line
	puts "                     GOOD LUCK                  "
	puts @line
	puts "\n"
end

# prints current board
print_board

# confirms user understands
puts "Hit enter to show you understand!"
gets

# method for player one's turn
def player_one_play
	puts @line
	puts "#{@player_one.upcase}: Please place an X on the board!"
	@play_proc.call
	@board[@play.to_i] = " X " # replace the hash value in board
	puts "Thank you!\n\n"
end

# method for player two's turn
def player_two_play
	puts @line
	puts "#{@player_two.upcase}: Please place an O on the board!"
	@play_proc.call
	@board[@play.to_i] = " O " # replace the hash value in board
	puts "Thank you!\n\n"
end

@play_proc = Proc.new do 
	puts "Enter square number: "
	@play = gets.chomp
	until @board[@play.to_i] == "   " # reprompts user until user chooses empty square
		puts "ERROR! You did't choose an empty square. Please enter empty square number: "
		@play = gets.chomp
	end
end	

# keeps rotating plays until winning condition met or there is a tie
while (@board[0] + @board[1] + @board[2]) != (WINX && WINO) && 
	(@board[3] + @board[4] + @board[5]) != (WINX && WINO) && (@board[6] + @board[7] + @board[8]) != (WINX && WINO) && 
	(@board[0] + @board[3] + @board[6]) != (WINX && WINO) && (@board[1] + @board[4] + @board[7]) != (WINX && WINO) && 
	(@board[2] + @board[5] + @board[8]) != (WINX && WINO) && (@board[0] + @board[4] + @board[8]) != (WINX && WINO) && 
	(@board[6] + @board[4] + @board[2]) != (WINX && WINO)
 		
	player_one_play
	print_board
	
		if (@board[0] + @board[1] + @board[2]) == WINX || (@board[3] + @board[4] + @board[5]) == WINX ||
 		(@board[6] + @board[7] + @board[8]) == WINX || (@board[0] + @board[3] + @board[6]) == WINX ||
 		(@board[1] + @board[4] + @board[7]) == WINX || (@board[2] + @board[5] + @board[8]) == WINX || 
 		(@board[0] + @board[4] + @board[8]) == WINX || (@board[6] + @board[4] + @board[2]) == WINX
			
 			puts "CONGRATULATIONS, #{@player_one.upcase}, you are the WINNER!!!"
			puts "Sorry, #{@player_two}.  Better luck next time."
			puts "THE END\n\n"
			break # breaks loop if player one is winner

		elsif @board.has_value?("   ") == false
		
			puts "There has been a tie.  Better luck next time, #{@player_one} and #{@player_two}."
			puts "THE END\n\n"
			break # breaks loop if there are no more empty spaces left on board
					
		else
		
			player_two_play
			print_board
	
			if (@board[0] + @board[1] + @board[2])== WINO || (@board[3] + @board[4] + @board[5]) == WINO ||
 		  (@board[6] + @board[7] + @board[8]) == WINO || (@board[0] + @board[3] + @board[6]) == WINO ||
 		  (@board[1] + @board[4] + @board[7]) == WINO || (@board[2] + @board[5] + @board[8]) == WINO || 
 		  (@board[0] + @board[4] + @board[8]) == WINO || (@board[6] + @board[4] + @board[2]) == WINO
 		  
 				puts "CONGRATULATIONS, #{@player_two.upcase}, you are the WINNER!!!"
				puts "Sorry, #{@player_one}.  Better luck next time."
				puts "THE END\n\n"
				
			end
		end
end



