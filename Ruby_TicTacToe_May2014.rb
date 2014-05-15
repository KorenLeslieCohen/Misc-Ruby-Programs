=begin
Ruby Tic Tac Toe REVISED
(c) Koren Leslie Cohen 2014
=end

# welcome message and directions:
puts "\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "==============================================================="
puts "HELLO!!! Welcome to Ruby Tic Tac Toe!"
puts "==============================================================="
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "\nTo play this version of Tic Tac Toe, you will need TWO players."
puts "Player one will be X, and player two will be O. You will take turns playing."
puts "Player one will go first.  You must decide who will be players one and two."
puts "You can switch it up if you play again!\n\n"

# get and define player info:
puts "==============================================================="
puts "PLAYER ONE: What is your name?"
$player_one = gets.chomp
puts "Hello #{$player_one}, you are X. You go FIRST!\n\n"

puts "==============================================================="
puts "PLAYER TWO: What is your name?"
$player_two = gets.chomp
puts "Hello #{$player_two}, you are O. You go SECOND!\n\n"

# creates new hash which represents the board's tiles
$board = Hash.new

$board = {
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
	
# winning variables
$winX = " X  X  X " 
$winO = " O  O  O "	

# prints directions and confirms user understands
puts "==============================================================="
puts "DIRECTIONS"
puts "==============================================================="
puts "The board's numbers are as follows:\n\n"
puts " 0 | 1 | 2 "
puts "____________"
puts " 3 | 4 | 5 "
puts "____________"
puts " 6 | 7 | 8 \n\n"
puts "When it is your turn, you will be asked to place an X or an O on the board.\n"
puts "You must choose your spot based on the above numbers."
puts "==============================================================="
puts "\nHit any key, then enter, to show you understand!"
understand = gets.chomp	

# method that creates prints the board, so this only has to be typed once
def print_board	
	puts "\n\nThis is the current board, and a reminder of the square numbers!"
	puts "==============================================================="
	puts "CURRENT BOARD                        SQUARE NUMBERS"
	puts "==============================================================="
	print $board[0], "|", $board[1], "|", $board[2], "                             0 | 1 | 2 "
	print "\n____________", "                          ____________\n"
	print $board[3], "|", $board[4], "|", $board[5], "                             3 | 4 | 5 "
	print "\n____________", "                          ____________\n"
	print $board[6], "|", $board[7], "|", $board[8], "                             6 | 7 | 8 "
	puts "\n#{$player_one} is X."
	puts "#{$player_two} is O."
	puts "==============================================================="
	puts "                     GOOD LUCK                  "
	puts "==============================================================="
	puts "\n"
end

# prints board
puts print_board

# confirms user understands
puts "Hit any key, then enter, to show you understand!"
understand = gets.chomp

# method for player one's turn
def player_one_play
	puts "==============================================================="
	puts "#{$player_one.upcase}: Please place an X on the board!"
	puts "Enter square number: "
	$play = gets.chomp
	until $board[$play.to_i] == "   " # reprompts user until user chooses empty square
		puts "ERROR! You did't choose an empty square. Please enter empty square number: "
		$play = gets.chomp
	end
	$board[$play.to_i] = " X " # replace the hash value in board
	puts "Thank you!\n\n"
end

# method for player two's turn
def player_two_play
	puts "==============================================================="
	puts "#{$player_two.upcase}: Please place an O on the board!"
	puts "Enter square number: "
	$play = gets.chomp
	until $board[$play.to_i] == "   " # reprompts user until user chooses empty square
		puts "ERROR! You did't choose an empty square. Please enter empty square number: "
		$play = gets.chomp
	end
	$board[$play.to_i] = " O " # replace the hash value in board
	puts "Thank you!\n\n"
end

# keeps rotating plays until winning condition met
while ($board[0] + $board[1] + $board[2]) != $winX && ($board[3] + $board[4] + $board[5]) != $winX &&
 		($board[6] + $board[7] + $board[8]) != $winX && ($board[0] + $board[3] + $board[6]) != $winX &&
 		($board[1] + $board[4] + $board[7]) != $winX && ($board[2] + $board[5] + $board[8]) != $winX && 
 		($board[0] + $board[4] + $board[8]) != $winX && ($board[6] + $board[4] + $board[2]) != $winX && 
 		($board[0] + $board[1] + $board[2]) != $winO && ($board[3] + $board[4] + $board[5]) != $winO &&
 		($board[6] + $board[7] + $board[8]) != $winO && ($board[0] + $board[3] + $board[6]) != $winO &&
 		($board[1] + $board[4] + $board[7]) != $winO && ($board[2] + $board[5] + $board[8]) != $winO && 
 		($board[0] + $board[4] + $board[8]) != $winO && ($board[6] + $board[4] + $board[2]) != $winO
	puts player_one_play
	puts print_board
		if ($board[0] + $board[1] + $board[2]) == $winX || ($board[3] + $board[4] + $board[5]) == $winX ||
 		($board[6] + $board[7] + $board[8]) == $winX || ($board[0] + $board[3] + $board[6]) == $winX ||
 		($board[1] + $board[4] + $board[7]) == $winX || ($board[2] + $board[5] + $board[8]) == $winX || 
 		($board[0] + $board[4] + $board[8]) == $winX || ($board[6] + $board[4] + $board[2]) == $winX
 					puts "CONGRATULATIONS, #{$player_one.upcase}, you are the WINNER!!!"
			puts "Sorry, #{$player_two}.  Better luck next time."
			break # breaks loop if player one is winner
		elsif ($board[0] != "   ") && ($board[1] != "   ") && ($board[2] != "   ") && ($board[3] != "   ") &&
		($board[4] != "   ") && ($board[5] != "   ") && ($board[6] != "   ") && ($board[0] != "   ") &&
		($board[8] != "   ") 
			puts "There has been a tie.  Better luck next time, #{$player_one} and #{$player_two}."
			break # breaks loop if there are no more empty spaces left on board
		else
			puts player_two_play
			puts print_board
			if ($board[0] + $board[1] + $board[2])== $winO || ($board[3] + $board[4] + $board[5]) == $winO ||
 		($board[6] + $board[7] + $board[8]) == $winO || ($board[0] + $board[3] + $board[6]) == $winO ||
 		($board[1] + $board[4] + $board[7]) == $winO || ($board[2] + $board[5] + $board[8]) == $winO || 
 		($board[0] + $board[4] + $board[8]) == $winO || ($board[6] + $board[4] + $board[2]) == $winO 
 		puts "CONGRATULATIONS, #{$player_two.upcase}, you are the WINNER!!!"
			puts "Sorry, #{$player_one}.  Better luck next time."
			end
		end
end








