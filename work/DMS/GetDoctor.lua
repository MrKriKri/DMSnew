JSON = require("json")
widget = require("widget")
composer = require("composer")
resp = {}
local max



local function rowRender(event)
    local row, rowHeight, rowWidth, rowTitle1, rowTitle2, fontSize
    local rowString1, rowString2

    row = event.row
    
    fontSize = 15
    rowHeight = row.contentHeight
    rowWidth = row.contentWidth
    print(rowHeight)
    print(rowWidth)
    if (event.row.index == 1) then
        rowTitle1 = display.newText(row, "Doctor", 0, 0, "Quark-Bold", fontSize + 15)    
        rowTitle1:setFillColor(1, 1, 1)
        rowTitle1.x = display.contentCenterX
        rowTitle1.y = rowHeight * 0.5
       
        return
    end
   
   print(resp[row.index-1]["DoctorID"])

    
    rowTitle1 = display.newText(row,resp[row.index-1]["DoctorID"], 0, 0, "Quark-Bold.otf", fontSize)    
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

    rowTitle3 = display.newText(row,resp[row.index-1]["DocName"], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle3:setFillColor(0)
    rowTitle3.anchorX = 0
    rowTitle3.x = 100+10
    rowTitle3.y = rowHeight * 0.5
   
    

end
local function rowTouch(event)    
    local e = event.row 

    if (event.phase == "press") then
    if not(mytextDocname==nil) then
        mytextDocname:removeSelf()
        mytextDocname = nil
        mytextDocID:removeSelf()
        mytextDocID = nil
        
    end
        
        mytextDocID = display.newText("Doctor ID : "..resp[event.row.index-1]["DoctorID"],cx,320,"Arial",20)
        mytextDocname = display.newText("Doctor Name : "..resp[event.row.index-1]["DocName"],cx,360,"Arial",20)
        composer.setVariable("docIDD",resp[event.row.index-1]["DoctorID"])
    end
    
    
end

function createTableView()
    

    tableView:deleteAllRows()

   
   

    tableView:insertRow(
        {
            isCategory = true, rowHeight = 60,
            rowColor = {default = {77 / 255, 86 / 255, 86 / 255}}
        }
    )
    
   for i=1,table.getn(resp) do
    
        tableView:insertRow(
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
        resp=JSON.decode(event.response)
        tableView = widget.newTableView {
            left = 0, top =160,
            height = 135,
            width = display.contentWidth,
            onRowRender = rowRender,
            onRowTouch = rowTouch
        }
        print(table.getn(resp))
        createTableView()
        
	else 
		print("fail connect")
end 

end 

function GetDoctor()
    url = "http://localhost/GetInfoDoctor.php"
    network.request(
        url,
        "GET",
        loadJSONListenerMeal,
        {}
    )
end
