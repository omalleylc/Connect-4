# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_cf_gen_01"

# Main program
module CF_Game
	@input = STDIN
	@output = STDOUT
	g = Game.new(@input, @output)
	playing = true
	input = ""
	option = 0
	turn = 0
	placed = nil
		
	@output.puts 'Enter "1" runs game in command-line window or "2" runs it in web browser.'
	game = g.getinput
	if game == "1"
		@output.puts "Command line game"
	elsif game == "2"
		@output.puts "Web-based game"
	else
		@output.puts "Invalid input! No game selected."
		exit
	end
		
	if game == "1"
		
	# Any code added to command line game should be added below.
	
		
		g.start
		g.displaymenu
		input = gets.chomp.to_i
		if input==1
			g.displaybegingame
			g.displaynewgamecreated
			g.displayemptyframe
		elsif input==2
			g.displaybegingame
			g.displaynewgamecreated
			g.displayemptyframe
		elsif input==9
			g.finish
			playing = false
		else
			g.displayinvalidinputerror
		end
		
		while playing==true
			
			
			if turn == 0
				g.displayplayer1prompt
			elsif turn == 1
				g.displayplayer2prompt
			else
				g.displayinvalidinputerror
			end
			
			#get user input
			num = gets.chomp.to_i
			col_num = 0
			loop do
				if num==0
					puts 'Game paused. Choose start to continue current game.'
					g.displaymenu
					input = gets.chomp.to_i
					if input==1
						g.displaybegingame
					elsif input==2
						g.displaynewgamecreated
						g.displayemptyframe
					elsif input==9
						g.finish
						playing = false
					else
						g.displayinvalidinputerror
					end
					break
				elsif num > 7
					g.displayinvalidinputerror
					puts 'Enter a number 1 through 7'
					num = gets.chomp.to_i
				else
					col_num = num - 1
					break
				end
			end
			
			#looping through matrix to place column
			row = 6
			loop do
				
				puts 'VALUE: '+ g.getcolumnvalue(5,6).to_s
				if g.getcolumnvalue(row,col_num)=="_"
					if turn == 0
						g.setmatrixcolumnvalue(row,col_num,'O')
						g.displayframecolumnvalues
						turn = 1
					else
						g.setmatrixcolumnvalue(row,col_num,'X')
						g.displayframecolumnvalues
						turn = 0
					end
					if g.checkwinner == 1 || g.checkwinner == 2
						g.displaywinner(g.checkwinner)
						playing = false
					end
					break
				else
					row = row - 1
				end
				
				if row==(-1)
					g.displaynomoreroomerror
					row=5
					break
				end
				
			end
			
		end
	# Any code added to output the activity messages to the command line window should be added above.
	
		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.



	# Any code added to output the activity messages to a browser should be added above.

# End program