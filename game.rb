# Input and screen clearing things!
require "io/console"
input = ""
Empty = 0 
User = 1
Island = 2
Waterfall = 3
bullShark = 4
message = "Water is all around!"
counter = 0
shark_x = 5
shark_y = 5
krakenA_x = 14
krakenB_x = 14
krakenB_y = 9
krakenA_y = 7
Kraken = 8
KrakenOG = 9
gridSize = 20
grid = Array.new(gridSize){ Array.new(gridSize){ Empty } }
row_position = 0
col_position = 0

grid[14][8] = KrakenOG

grid[2][4] = Waterfall
grid[3][5] = Waterfall
grid[2][7] = Waterfall
grid[2][3] = Island
grid[1][3] = Island
grid[3][3] = Island
grid[4][4] = Island
grid[4][3] = Island
grid[4][5] = Island
grid[1][4] = Island
grid[1][5] = Island
grid[1][6] = Island
grid[1][7] = Island
grid[1][8] = Island
grid[1][9] = Island
grid[2][9] = Island
grid[3][9] = Island
grid[4][9] = Island
#%x ( say 'today you wont be sticking to the rivers and the lakes that youre used to' )
loading_message = "Today you wont be sticking to the rivers & lakes that you're used to...Go chasing waterfalls!!"
loading_message.each_char do |i|
    print i
    sleep(0.1)
end
sleep(2)
system "cls"

while input != "q" 
   
    (0...gridSize).each do |i|
        (0...gridSize).each do |j|
            if row_position == i && col_position == j
                print "Ω "
            elsif shark_x == i && shark_y == j
                print "┴ "
            elsif krakenA_x == i && krakenA_y == j
                print "÷ "
            elsif krakenB_x == i && krakenB_y == j
                print "÷ "
            else
                if grid[i][j] == Empty
                    print "≈ "    
                end
                if grid[i][j] == User
                    print "Ω "
                end
                if grid[i][j] == KrakenOG
                    print "Ô "
                end
                if grid[i][j] == Waterfall
                    print "▓ "
                end
                if grid[i][j] == Island
                    print "ö "
                end
                if grid[i][j] == bullShark
                    print "┴ "
                end
            end
           
        end
        puts #print one array, hits enter, prints next array
    end
    puts message
    
        counter += 1
        if counter > 20
            counter = 0
        end
        if counter.between?(0, 5) 
            shark_y += 1
            krakenA_x += 1
            krakenB_x -= 1
        end
        if counter.between?(5, 10)
            shark_x += 1
            krakenA_x -= 1
            krakenB_x += 1
        end
        if counter.between?(10, 15)
            shark_y -= 1
            krakenA_x += 1
            krakenB_x -= 1
        end
        if counter.between?(15, 20)
            shark_x -= 1
            krakenA_x -= 1
            krakenB_x += 1
        end

      
        
        

       
    
    # get single character input
    input = STDIN.getch
    # character doesn't get typed when a person types it
   
    if row_position > 0 && grid[row_position - 1][col_position] != Island && grid[row_position - 1][col_position] != KrakenOG
        if input == 'w' 
            if row_position - 1 == shark_x && col_position == shark_y || row_position - 1 == krakenA_x && col_position == krakenA_y || row_position - 1 == krakenB_x && col_position == krakenB_y
                message = "You are dead!"
                
                #input = "q"

            elsif grid[row_position - 1][col_position] == Waterfall
                message = "You found a waterfall!!!"  
                            
            else
                message = "Water is all around!"     
            end     
            row_position = row_position - 1   
            grid[row_position - 1][col_position] = Empty   
        end
    end
    if col_position > 0 && grid[row_position][col_position - 1] != Island && grid[row_position][col_position - 1] != KrakenOG
        if input == 'a'
            if row_position == shark_x && col_position - 1 == shark_y || row_position == krakenA_x && col_position - 1 == krakenA_y || row_position == krakenB_x && col_position - 1 == krakenB_y 
                message = "You are dead!"
                
                #input = "q"
            elsif grid[row_position][col_position - 1] == Waterfall
                message = "You found a waterfall!!!" 
                
            else
                message = "Water is all around!"     
            end
            col_position = col_position - 1
            grid[row_position][col_position] = Empty
        end
    end
    if row_position < gridSize - 1 && grid[row_position + 1][col_position] != Island && grid[row_position + 1][col_position] != KrakenOG
        if input == 's'
            if row_position + 1 == shark_x && col_position == shark_y || row_position + 1 == krakenA_x && col_position == krakenA_y || row_position + 1 == krakenB_x && col_position == krakenB_y
                message = "You are dead!"
               
                #input = "q"
            elsif grid[row_position + 1][col_position] == Waterfall
                message = "You found a waterfall!!!"  
              
            else
                message = "Water is all around!"     
            end
            row_position = row_position + 1
            grid[row_position][col_position] = Empty
        end
    end
    if col_position < gridSize - 1 && grid[row_position][col_position + 1] != Island && grid[row_position][col_position + 1] != KrakenOG
        if input == 'd'
            if row_position == shark_x && col_position + 1 == shark_y || row_position == krakenA_x && col_position + 1 == krakenA_y || row_position == krakenB_x && col_position + 1 == krakenB_y
                message = "You are dead!"
                
                #input = "q" 
            elsif grid[row_position][col_position + 1] == Waterfall
                message = "You found a waterfall!!!"  
                  
            else
                message = "Water is all around!" 
            end
            col_position = col_position + 1
            grid[row_position][col_position] = Empty
        end
    end
    still_searching = false
    (0...gridSize).each do |i|
        (0...gridSize).each do |j|
            if grid[i][j] == Waterfall
                still_searching = true
            end
        end
    end
    if still_searching == false
        message = "You have found all waterfalls! You don't want no scrubs!"
    end
    # clear screen for windows
    system "cls"
end