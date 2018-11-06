# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
# require 'sinatra'		# remove '#' character to run sinatra wen server

# Main class module
module CF_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	TOKEN1 = "O"
	TOKEN2 = "X"

	class Game
		attr_reader :matrix, :player1, :player2, :template, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		attr_writer :matrix, :player1, :player2, :template, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		
		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			txt = @input.gets.chomp
			return txt
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.
		
		#fulfills the first through 7th tests
		def start
			@output.puts('Welcome to Connect 4!')
			@output.puts("Created by:#{created_by}")
			@output.puts('Game started.')
			@output.puts("Player 1: O and Player 2: X")
			@output.puts("Enter column number to place token.")
		end
		
		#this returns my name when the created_by method is called
		def created_by
			return "Laura OMalley"
		end
		
		#this returns my student id when the student_id method is called
		def student_id
			return 51875531
		end
		
		#this corresponds to the 8th error. It fills the @output variable with 'Begin game'
		def displaybegingame
			@output.puts('Begin game.')
		end
		
		#This fulfills the 9th test. It should fill the @output variable with 'New game created'
		def displaynewgamecreated
			@output.puts('New game created.')
		end
		
		#This fulfills the 10th test. It should fill the @output variable with 'Game finished.'
		def finish
			@output.puts('Game finished.')
		end
		
		#This fulfills the 11th test. It should fill the @output variable with 'Menu: (1)Start | (2)New | (9)Exit\n'
		def displaymenu
			@output.puts("Menu: (1)Start | (2)New | (9)Exit\n")
		end
		
		#This fulfills the 12th test. It should fill the @output variable with 'Player 1 to enter token (0 returns to menu).'
		def displayplayer1prompt
			@output.puts("Player 1 to enter token (0 returns to menu).")
		end
		
		#This fulfills the 13th test. It should fill the @output variable with 'Player 2 to enter token (0 returns to menu).'
		def displayplayer2prompt
			@output.puts("Player 2 to enter token (0 returns to menu).")
		end
		
		#Fulfills 14th test. Fills output with 'Invalid input'
		def displayinvalidinputerror
			@output.puts('Invalid input.')
		end
		
		#Fulfills 15th test. Fills output with 'No more room'
		def displaynomoreroomerror
			@output.puts('No more room.')
		end
		
		#Fulfills 16th and 17th test. Fills the output variable with the given winner passed in the method
		def displaywinner(p)
			@output.puts("Player #{p} wins.")
		end
		
		#Fulfills 18th test. Sets player1 variable to O
		def setplayer1
			@player1 = "O"
		end
		
		#Fulfills 19th test. Sets player2 variable to X
		def setplayer2
			@player2 = "X"
		end
		
		#Fulfills 20th test. Returns player1 variable
		def getplayer1
			return @player1
		end
		
		#Fulfills 21st test. Returns player2 variable
		def getplayer2
			return @player2
		end
		
		#Fulfills 22nd test. Fills matrix variable with empty entries
		def clearcolumns
			@matrix = []
			@matrix[0] = ["_", "_", "_", "_", "_", "_"]
			@matrix[1] = ["_", "_", "_", "_", "_", "_"]
			@matrix[2] = ["_", "_", "_", "_", "_", "_"]
			@matrix[3] = ["_", "_", "_", "_", "_", "_"]
			@matrix[4] = ["_", "_", "_", "_", "_", "_"]
			@matrix[5] = ["_", "_", "_", "_", "_", "_"]
			@matrix[6] = ["_", "_", "_", "_", "_", "_"]
		end
		
		#Fulfills 23rd test. Returns the value at a given position in the matrix.
		def getcolumnvalue(r,c)
			value = @matrix[r][c]
			return value
		end
		
		#Fulfills 24-27 tests. Fills given position in matrix with given value if it is an empty space.
		def setmatrixcolumnvalue(c,i,val)
			if @matrix[c][i]=='_'
				@matrix[c][i] = val
			end
		end
		
		#Fulfills 28 test. Fills output with an empty matrix
		def displayemptyframe
			@matrix = []
			@matrix[0] = ["_", "_", "_", "_", "_", "_"]
			@matrix[1] = ["_", "_", "_", "_", "_", "_"]
			@matrix[2] = ["_", "_", "_", "_", "_", "_"]
			@matrix[3] = ["_", "_", "_", "_", "_", "_"]
			@matrix[4] = ["_", "_", "_", "_", "_", "_"]
			@matrix[5] = ["_", "_", "_", "_", "_", "_"]
			@matrix[6] = ["_", "_", "_", "_", "_", "_"]
			title = " 1 2 3 4 5 6 7 "
			rowdivider = "+-+-+-+-+-+-+-+"
			rowempty = "|_|_|_|_|_|_|_|"
			@output.puts("#{title}")
			for i in 1..7
				@output.puts("#{rowdivider}")
			end
			for i in 1..6
				@output.puts("#{rowempty}")
			end
		end
		
		#Applies to the 29th-42nd tests. Simply fills the output with the current state of the matrix
		def displayframecolumnvalues
			@matrix.each do |row|
				new_row=row.join(',')
				@output.puts(new_row)
			end
		end
		
		#Applies to the 29th-42nd tests. Checks to see which is the winner of connect four either horizontally, vertically, or diagonally for both players.
		def checkwinner
			# check columns for player 1 win
			i = 0
			while i < 7 do
				if @matrix[i][0] == "O" && @matrix[i][1] == "O" && @matrix[i][2] == "O"  && @matrix[i][3] == "O" then
					@winner = 1
				elsif @matrix[i][1] == "O" && @matrix[i][2] == "O" && @matrix[i][3] == "O"  && @matrix[i][4] == "O" then
					@winner = 1			
				elsif @matrix[i][2] == "O" && @matrix[i][3] == "O" && @matrix[i][4] == "O"  && @matrix[i][5] == "O" then
					@winner = 1
				elsif @matrix[i][3] == "O" && @matrix[i][4] == "O" && @matrix[i][5] == "O"  && @matrix[i][6] == "O" then
					@winner = 1
				end
				i = i + 1
			end
			# check columns for player 2 win
			i= 0
			while i < 7 do
				if @matrix[i][0] == "X" && @matrix[i][1] == "X" && @matrix[i][2] == "X"  && @matrix[i][3] == "X" then
					@winner = 2
				elsif @matrix[i][1] == "X" && @matrix[i][2] == "X" && @matrix[i][3] == "X"  && @matrix[i][4] == "X" then
					@winner = 2
				elsif @matrix[i][2] == "X" && @matrix[i][3] == "X" && @matrix[i][4] == "X"  && @matrix[i][5] == "X" then
					@winner = 2
				elsif @matrix[i][3] == "X" && @matrix[i][4] == "X" && @matrix[i][5] == "X"  && @matrix[i][6] == "X" then
					@winner = 2
				end
				i = i + 1
			end
			# check rows for player 1 win
			i = 0
			while i < 6 do
				if @matrix[0][i] == "O" && @matrix[1][i] == "O" && @matrix[2][i] == "O"  && @matrix[3][i] == "O" then
					@winner = 1
				elsif @matrix[1][i] == "O" && @matrix[2][i] == "O" && @matrix[3][i] == "O"  && @matrix[4][i] == "O" then
					@winner = 1			
				elsif @matrix[2][i] == "O" && @matrix[3][i] == "O" && @matrix[4][i] == "O"  && @matrix[5][i] == "O" then
					@winner = 1
				elsif @matrix[3][i] == "O" && @matrix[4][i] == "O" && @matrix[5][i] == "O"  && @matrix[6][i] == "O" then
					@winner = 1
				end
				i = i + 1
			end
			# check rows for player 2 win
			i = 0
			while i < 6 do
				if @matrix[0][i] == "X" && @matrix[1][i] == "X" && @matrix[2][i] == "X"  && @matrix[3][i] == "X" then
					@winner = 2
				elsif @matrix[1][i] == "X" && @matrix[2][i] == "X" && @matrix[3][i] == "X"  && @matrix[4][i] == "X" then
					@winner = 2			
				elsif @matrix[2][i] == "X" && @matrix[3][i] == "X" && @matrix[4][i] == "X"  && @matrix[5][i] == "X" then
					@winner = 2
				elsif @matrix[3][i] == "X" && @matrix[4][i] == "X" && @matrix[5][i] == "X"  && @matrix[6][i] == "X" then
					@winner = 2
				end
				i = i + 1
			end
			# check diagonals left to right for player 1 win
			i = 0
			while i < 4 do
				if @matrix[i][0] == "O" && @matrix[i+1][1] == "O" && @matrix[i+2][2] == "O"  && @matrix[i+3][3] == "O" then
					@winner = 1
				elsif @matrix[i+1][0] == "O" && @matrix[i+2][1] == "O" && @matrix[i+3][2] == "O"  && @matrix[i+4][3] == "O" then
					@winner = 1			
				elsif @matrix[i+2][0] == "O" && @matrix[i+3][1] == "O" && @matrix[i+4][2] == "O"  && @matrix[i+5][3] == "O" then
					@winner = 1
				elsif @matrix[i][1] == "O" && @matrix[i+1][2] == "O" && @matrix[i+2][3] == "O"  && @matrix[i+3][4] == "O" then
					@winner = 1
				elsif @matrix[i+1][1] == "O" && @matrix[i+2][2] == "O" && @matrix[i+3][3] == "O"  && @matrix[i+4][4] == "O" then
					@winner = 1			
				elsif @matrix[i+2][1] == "O" && @matrix[i+3][2] == "O" && @matrix[i+4][3] == "O"  && @matrix[i+5][4] == "O" then
					@winner = 1		
				elsif @matrix[i][2] == "O" && @matrix[i+1][3] == "O" && @matrix[i+2][4] == "O"  && @matrix[i+3][5] == "O" then
					@winner = 1
				elsif @matrix[i+1][2] == "O" && @matrix[i+2][3] == "O" && @matrix[i+3][4] == "O"  && @matrix[i+4][5] == "O" then
					@winner = 1			
				elsif @matrix[i+2][2] == "O" && @matrix[i+3][3] == "O" && @matrix[i+4][4] == "O"  && @matrix[i+5][5] == "O" then
					@winner = 1
				elsif @matrix[i][3] == "O" && @matrix[i+1][4] == "O" && @matrix[i+2][5] == "O"  && @matrix[i+3][6] == "O" then
					@winner = 1
				elsif @matrix[i+1][3] == "O" && @matrix[i+2][4] == "O" && @matrix[i+3][5] == "O"  && @matrix[i+4][6] == "O" then
					@winner = 1			
				elsif @matrix[i+2][3] == "O" && @matrix[i+3][4] == "O" && @matrix[i+4][5] == "O"  && @matrix[i+5][6] == "O" then
					@winner = 1
				end
				i = i + 1
			end
			# check diagonals left to right for player 2 win
			i= 0
			while i < 4 do
				if @matrix[i][0] == "X" && @matrix[i+1][1] == "X" && @matrix[i+2][2] == "X"  && @matrix[i+3][3] == "X" then
					@winner = 2
				elsif @matrix[i+1][0] == "X" && @matrix[i+2][1] == "X" && @matrix[i+3][2] == "X"  && @matrix[i+4][3] == "X" then
					@winner = 2
				elsif @matrix[i+2][0] == "X" && @matrix[i+3][1] == "X" && @matrix[i+4][2] == "X"  && @matrix[i+5][3] == "X" then
					@winner = 2			
				elsif @matrix[i][1] == "X" && @matrix[i+1][2] == "X" && @matrix[i+2][3] == "X"  && @matrix[i+3][4] == "X" then
					@winner = 2
				elsif @matrix[i+1][1] == "X" && @matrix[i+2][2] == "X" && @matrix[i+3][3] == "X"  && @matrix[i+4][4] == "X" then
					@winner = 2			
				elsif @matrix[i+2][1] == "X" && @matrix[i+3][2] == "X" && @matrix[i+4][3] == "X"  && @matrix[i+5][4] == "X" then
					@winner = 2		
				elsif @matrix[i][2] == "X" && @matrix[i+1][3] == "X" && @matrix[i+2][4] == "X"  && @matrix[i+3][5] == "X" then
					@winner = 2
				elsif @matrix[i+1][2] == "X" && @matrix[i+2][3] == "X" && @matrix[i+3][4] == "X"  && @matrix[i+4][5] == "X" then
					@winner = 2			
				elsif @matrix[i+2][2] == "X" && @matrix[i+3][3] == "X" && @matrix[i+4][4] == "X"  && @matrix[i+5][5] == "X" then
					@winner = 2
				elsif @matrix[i][3] == "X" && @matrix[i+1][4] == "X" && @matrix[i+2][5] == "X"  && @matrix[i+3][6] == "X" then
					@winner = 2
				elsif @matrix[i+1][3] == "X" && @matrix[i+2][4] == "X" && @matrix[i+3][5] == "X"  && @matrix[i+4][6] == "X" then
					@winner = 2			
				elsif @matrix[i+2][3] == "X" && @matrix[i+3][4] == "X" && @matrix[i+4][5] == "X"  && @matrix[i+5][6] == "X" then
					@winner = 2			
				end
				i = i + 1
			end
			
			return @winner
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
