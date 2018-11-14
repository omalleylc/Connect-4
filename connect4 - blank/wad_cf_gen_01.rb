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
			@matrix[0] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[1] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[2] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[3] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[4] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[5] = ["_", "_", "_", "_", "_", "_", "_"]
		end
		
		#Fulfills 23rd test. Returns the value at a given position in the matrix.
		def getcolumnvalue(r,c)
			value = @matrix[r][c]
			return value
		end
		
		#Fulfills 24-27 tests. Fills given position in matrix with given value if it is an empty space.
		def setmatrixcolumnvalue(c,i,val)
			if @matrix[c][i]=="_"
				@matrix[c][i] = val
			end
		end
		
		#Fulfills 28 test. Fills output with an empty matrix
		def displayemptyframe
			@matrix = []
			@matrix[0] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[1] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[2] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[3] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[4] = ["_", "_", "_", "_", "_", "_", "_"]
			@matrix[5] = ["_", "_", "_", "_", "_", "_", "_"]
			title = " 1 2 3 4 5 6 7 "
			rowdivider = "+-+-+-+-+-+-+-+"
			rowempty = "|_|_|_|_|_|_|_|"
			@output.puts("#{title}")
			@output.puts("#{rowdivider}")
			
			for i in 1..6
				@output.puts("#{rowempty}")
			end
		end
		
		#Applies to the 29th-42nd tests. Simply fills the output with the current state of the matrix
		def displayframecolumnvalues
			title = " 1 2 3 4 5 6 7"
			@output.puts("#{title}")
			@matrix.each do |row|
				new_row='|'+row.join('|')+'|'
				@output.puts(new_row)
			end
		end
		
		#Applies to the 29th-42nd tests. Checks to see which is the winner of connect four either horizontally, vertically, or diagonally for both players.
		def checkwinner
			
			@matrix.each do |row|
				row.join.gsub("|","")
			end
			
			#check horizontal winners
			@matrix.each do |row|
			  if row.join.include? "XXXX"
				@winner = 2	
			  elsif row.join.include? "OOOO"
				@winner = 1
			  end
			end

			#check vertical winners
			@matrix.transpose.each do |row|
			  if row.join.include? "XXXX"
				@winner = 2	
			  elsif row.join.include? "OOOO"
				@winner = 1
			  end
			end
			
			for row_nr in 0..@matrix.count-4
			  for col_nr in 0..@matrix[0].count-4
				el_1 = @matrix[row_nr]  [col_nr]
				el_2 = @matrix[row_nr+1][col_nr+1]
				el_3 = @matrix[row_nr+2][col_nr+2]
				el_4 = @matrix[row_nr+3][col_nr+3]

				if el_1 + el_2 + el_3 + el_4 == 'XXXX'
				  @winner = 2	
				elsif el_1 + el_2 + el_3 + el_4 == 'OOOO'
				  @winner = 1
				end
			  end
			end
			#right to left
			for row_nr in 0..@matrix.count-4
			  for col_nr in 0..@matrix[0].count-4
				el_1 = @matrix.reverse[row_nr]  [col_nr]
				el_2 = @matrix.reverse[row_nr+1][col_nr+1]
				el_3 = @matrix.reverse[row_nr+2][col_nr+2]
				el_4 = @matrix.reverse[row_nr+3][col_nr+3]

				if el_1 + el_2 + el_3 + el_4 == 'XXXX'
				  @winner = 2 
				elsif el_1 + el_2 + el_3 + el_4 == 'OOOO'
				  @winner = 1
				end
			  end
			end
	
			return @winner
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
