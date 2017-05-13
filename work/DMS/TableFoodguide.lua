sqlite = require("sqlite3")
local widget = require("widget")
local composer = require("composer")

function categoryListener(event)
    print(event.x)
    if (event.phase == "ended") then
        view = view % 3 + 1
        createTableView()
    end
end
function rowRender(event)
    local row, rowHeight, rowWidth, rowTitle1, rowTitle2, fontSize
    local rowString1, rowString2

    row = event.row
    fontSize = 20
    rowHeight = row.contentHeight
    rowWidth = row.contentWidth

    if (row.index == 1) then
        rowTitle1 = display.newText(row, "ค่าดัชนีน้ำตาล/1ชิ้น", 0, 0, "Quark-Bold", fontSize + 15)    
        rowTitle1:setFillColor(1, 1, 1)
        rowTitle1.x = display.contentCenterX
        rowTitle1.y = rowHeight * 0.5
        rowTitle1:addEventListener("touch", categoryListener)
        return
    end

    rowString1 =food[row.index]
    
    rowString2 = string.format("%3d",GI[row.index])
    
    rowTitle1 = display.newText(row,rowString1, 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle1:setFillColor(0)
    rowTitle1.anchorX = 0
    rowTitle1.x = 10
    rowTitle1.y = rowHeight * 0.5

    myRectangle = display.newRect(row, rowWidth - 85, rowHeight * 0.47, 84, 39)
    myRectangle.strokeWidth = 1
    myRectangle:setFillColor(0.1, 1, 0.1)
    myRectangle:setStrokeColor(0.5, 0.5, 0.5)
    myRectangle.alpha = 1
    myRectangle.anchorX = 0

    rowTitle2 = display.newText(row,rowString2, 0, 0, "Quark-Bold.otf", fontSize + 10)
    rowTitle2:setFillColor( 77/255,86/255,200/255)
    rowTitle2.anchorX = 1
    rowTitle2.x = rowWidth - 5
    rowTitle2.y = rowHeight * 0.55

end


function createTableView(filter)
    local sqlCommand, sqlFilter, nameNoWB

    tableView:deleteAllRows()

    
    food = {""}
    GI = {0}

    tableView:insertRow(
        {
            isCategory = true, rowHeight = 60,
            rowColor = {default = { 77/255,86/255,200/255}}
        }
    )

   

    if (view == 1) then
        sqlCommand = "SELECT * FROM Glycemic  ORDER BY food;"
    elseif (view == 2) then
        sqlCommand = "SELECT * FROM Glycemic  ORDER BY Glycemic;"
    else
        sqlCommand = "SELECT * FROM Glycemic  ORDER BY Glycemic DESC;"
    end
    print(sqlCommand)
    
    
    for row in db:nrows(sqlCommand) do
       
        
        table.insert(food,row.Food)
        
        table.insert(GI,row.Glycemic)
        tableView:insertRow(
            {
                isCategory = false, rowHeight = 40,
                rowColor = {default = {1, 1, 1}, over = {1, 0.7, 0.5}},
            }
        )
    end
end




function database()
	path = system.pathForFile("food.db", system.ResourceDirectory)
		db = sqlite.open(path)

		display.setDefault("background",  77/255,86/255,200/255)
		display.setStatusBar(display.HiddenStatusBar)

		tableView = widget.newTableView {
		    left = 0, top = 0,
		    height = display.contentHeight-25,
		    width = display.contentWidth,
		    onRowRender = rowRender,
		    onRowTouch = rowTouch
		}

		view = 1
		
		createTableView()

end


function deletedatabase()
	if(tableView) then
	tableView:removeSelf()
	tableView=nil
end

end
