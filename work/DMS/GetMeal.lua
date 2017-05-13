JSON = require("json")
widget = require("widget")
composer = require("composer")
resp = {}


local function rowRenderMeal(event)
    local row, rowHeight, rowWidth, rowTitle1, rowTitle2, fontSize
    local rowString1, rowString2

    row = event.row

    fontSize = 15
    rowHeight = row.contentHeight
    rowWidth = row.contentWidth

    if (event.row.index == 1) then
        rowTitle1 = display.newText(row, "History", 0, 0, "Quark-Bold", fontSize + 15)    
        rowTitle1:setFillColor(1, 1, 1)
        rowTitle1.x = display.contentCenterX
        rowTitle1.y = rowHeight * 0.5
       
        return
    end
   
   print(resp[row.index-1]["Meal"])

    
    rowTitle1 = display.newText(row,resp[row.index-1]["Meal"], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle1:setFillColor(0)
    rowTitle1.anchorX = 0
    rowTitle1.x = 10
    rowTitle1.y = rowHeight * 0.5

    myRectangle3 = display.newRect(row,100, rowHeight * 0.47,0.5, 39)
    myRectangle3.strokeWidth = 1
    myRectangle3:setFillColor(0,0, 0)
    myRectangle3:setStrokeColor(0.5, 0.5, 0.5)
    myRectangle3.alpha = 1
    myRectangle3.anchorX = 0

    rowTitle3 = display.newText(row,resp[row.index-1]["Meal_date"], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle3:setFillColor(0)
    rowTitle3.anchorX = 0
    rowTitle3.x = 100+10
    rowTitle3.y = rowHeight * 0.5

    myRectangle4 = display.newRect(row,200, rowHeight * 0.47,0.5, 39)
    myRectangle4.strokeWidth = 1
    myRectangle4:setFillColor(0,0, 0)
    myRectangle4:setStrokeColor(0.5, 0.5, 0.5)
    myRectangle4.alpha = 1
    myRectangle4.anchorX = 0

    rowTitle4 = display.newText(row,resp[row.index-1]["Food"], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle4:setFillColor(0)
    rowTitle4.anchorX = 0
    rowTitle4.x = 200+10
    rowTitle4.y = rowHeight * 0.5
   
    

end
local function rowTouchMeal(event)    
    if (event.phase == "press") then
    if not(textMeal==nil) then
        textMeal:removeSelf()
        textFood:removeSelf()
        texttime:removeSelf()
        textdate:removeSelf()
        textamount:removeSelf()
        textMeal = nil
        textamount = nil
        textFood = nil
        texttime = nil
        textdate = nil
        end
        
        textMeal = display.newText("Meal : "..resp[event.row.index-1]["Meal"],cx,320+20,"Arial",20)
        textFood = display.newText("Food : "..resp[event.row.index-1]["Food"],cx,350+20,"Arial",20)
        texttime = display.newText("Time : "..resp[event.row.index-1]["Meal_time"],cx,380+20,"Arial",20)
        textdate = display.newText("Date : "..resp[event.row.index-1]["Meal_date"],cx,410+20,"Arial",20)
        textamount = display.newText("Amount : "..resp[event.row.index-1]["Amount"],cx,440+20,"Arial",20)
        
    end
    
    
end


function createTableView()
    

    tableViewMeal:deleteAllRows()

   
   

    tableViewMeal:insertRow(
        {
            isCategory = true, rowHeight = 60,
            rowColor = {default = {77 / 255, 86 / 255, 86 / 255}}
        }
    )
    
   for i=1,table.getn(resp) do
    
        tableViewMeal:insertRow(
            {
                isCategory = false, rowHeight = 40,
                rowColor = {default = {1, 1, 1}, over = {1, 0.7, 0.5}},
            }
        )
    end
end

function  loadJSONListenerMeal(event)
	if not(event.isError)then
		print("success")
        resp = JSON.decode(event.response)
        tableViewMeal = widget.newTableView {
            left = 0, top =120,
            height = 200,
            width = display.contentWidth,
            onRowRender = rowRenderMeal,
            onRowTouch = rowTouchMeal
        }
        createTableView()
	else 
		print("fail connect")
end 

end 

function GetMeal(ID)
    local url ="http://localhost/getallMeal.php?ID="..ID
    print(url)
    network.request(
        url,
        "GET",
        loadJSONListenerMeal,
        {}
    )
end
