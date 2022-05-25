--sample boards
board = {{1,0,0},
{0,1,0},
{0,0,1}}

rboard = {{1,0,1},
{0,1,0},
{1,0,0}}

row = {{1,1,1},
{0,1,0},
{1,0,0}}

row2 = {{0,0,0},
{1,1,1},
{1,0,0}}

row3 = {{0,0,0},
{0,1,1},
{1,1,1}}

column = {{1,0,0},
{1,1,1},
{1,1,1}}

empty_board = {{nil,nil,nil},
{nil,nil,nil},
{nil,nil,nil}}

function checkDiagonal(term, table)
    for k,v in ipairs(table) do
        if (table[k][k]~=term) then
            return false
        end
    end
    return true
end


function checkRDiagonal(term, table)
    for k,v in ipairs(table) do
        if (table[(#table+1)-k][k]~=term) then
            return false
        end
    end
    return true
end


function checkAll(term, table)
    for k,v in ipairs(table) do
        for i,v in ipairs(table) do
            if (table[k][i]~=term) then
                return false
            end
        end
    end
    return true
end


function checkRow(term, table)
    t = 0
        for k,v in ipairs(table) do
            for i,v in ipairs(table) do
                if (table[k][i]==term) then
                    t = t+1
                end
            end
        if (t == #table) then
            return true
        else
            t=0
        end
    end
    return false
end


function checkColumn(term, table)
    t = 0
        for k,v in ipairs(table) do
            for i,v in ipairs(table) do
                if (table[i][k]==term) then
                    t = t+1
                end
            end
        if (t == #table) then
            return true
        else
            t=0
        end
    end
    return false
end

function DisplayTable(table)
    for k,v in ipairs(table) do
        for i,v in ipairs(table) do
            print(table[v][v]) break
        end
    end
end

function AIorPI(isEnabled, table, term)
    if (isEnabled == true) then
         table[math.random(#table)][math.random(#table)] = term
    else
        print("Choose your position")
        x = io.read("*n")
        y = io.read("*n")
        if(table[x][y]~=nil) then
            print("Location is occupied, try again")
        else if ((x>#table or x<1) and (y>#table or y<1)) then
            print("Location is less or above the current dimensions of the board, try again")
        else
            table[x][y]=term
        end
    end
end
end

function checkWin(table, term)
    if (checkColumn(term,table) or checkRow(term,table) or checkDiagonal(term, table) or checkRDiagonal(term,table)) then
        print (term.." wins!")
    else
        print("Continue on...")
    end

end



--game logic
function tictactoeSettings(table)
    
isRunning = true
aiEnabled = false
P1term =1
P2term =0
    while (isRunning == true) do
        print ("Do you want to play? Y/N")
        answer = io.read("*l")

        if (string.lower(answer) =="y") then
            --Modes
            print("Mode Select:")
            print("1. P1 vs P2")
            print("2. P1 vs COM")
            mode = io.read("*n")
            if (mode == 1) then
                aiEnabled = false
                for i=1, #table,1 do
                    AIorPI(aiEnabled, table, P1Term)
                    checkWin(table,P1Term)
                    AIorPI(aiEnabled, table, P2Term)
                    checkWin(table,P2Term)
                end
                
            else if (mode ==2) then
                aiEnabled =true
                for i=1, #table,1 do
                    AIorPI(aiEnabled, table, P1Term)
                    checkWin(table,P1Term)
                    AIorPI(aiEnabled, table, P2Term)
                    checkWin(table,P2Term)
                end
            else
                print("Please Re-enter the proper values")
            end
            
        end
        else if (string.lower(answer)=="n") then
            isRunning = false
        else
            print("try again")
        
        end
    end

end

end

tictactoeSettings(empty_board)
--tictactoe()

--print(checkDiagonal(1, board))

--print(checkRDiagonal(1, rboard))


--print(checkRDiagonal(1, board))

--print(checkRow(1,row))
--print(checkRow(1,board))
--print(checkRow(1,row2))

--print(checkRow(1,row3))

--print(checkColumn(1,board))
--print(checkColumn(1,column))--]