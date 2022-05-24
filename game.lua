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



function tictactoe()
isRunning= true

while (isRunning == true) do
print ("Do you want to play? Y/N")
answer = io.read("*n")

    if (string.lower(answer) =="y") then
        while(checkAll(nil,table) == false) do
        

        end
    
    else if (string.lower(answer)=="n") then
        isRunning = false
    
        
    else
        print("try again")
    end
    end

end

end
print(DisplayTable(row))
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