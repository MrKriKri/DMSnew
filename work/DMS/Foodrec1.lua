local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
require("RecordMeal")

Mealarr = {"Breakfast","Lunch","Dinner","Snack"}
amountarr={"ladle","glass","bowl","cubes"}

function gotoMenuuu(event)
	composer.gotoScene("menu2")
end

function gotoHistory(event)
	composer.gotoScene("Foodrec2")
end

function gotoConFirm(event)
	if not(composer.getVariable("Meal")==nil) then
		local datee =txfTextYear3.text.."-"..txfTextMouth2.text.."-"..txfTextDate1.text
		RecordMeal(composer.getVariable("nowuser"),composer.getVariable("Meal"),datee,"20:00:00",txfText3.text,txfText4.text..""..composer.getVariable("amountt"))
	else
		native.showAlert("fail","Plase select Meal","OK")
	end
end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

function rowRender(event)
	row = event.row
	fontSize = 10
	rowTitle1 = display.newText(row,Mealarr[row.index], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle1:setFillColor(0)
    rowTitle1.anchorX = 0
    rowTitle1.x = 10
    rowTitle1.y = row.contentHeight * 0.5
end

function rowRender1(event)
	row = event.row
	fontSize = 10
	rowTitle1 = display.newText(row,amountarr[row.index], 0, 0, "Quark-Bold.otf", fontSize)    
    rowTitle1:setFillColor(0)
    rowTitle1.anchorX = 0
    rowTitle1.x = 10
    rowTitle1.y = row.contentHeight * 0.5
end

function rowTouch(event)
	if not(myText15==nil)then
		myText15:removeSelf()
		myText15=nil
	end
	myText15 = display.newText(Mealarr[event.row.index],130,230,"Arial",18)
	composer.setVariable("Meal",Mealarr[event.row.index])
end

function rowTouch1(event)
	if not(myText5==nil)then
		myText5:removeSelf()
		myText5=nil
	end
	myText5 = display.newText(amountarr[event.row.index],225,335,"Arial",20)
	composer.setVariable("amountt",amountarr[event.row.index])
end
function createTableView()
	for i=1,4 do
    
        tableView:insertRow(
            {
                isCategory = false, rowHeight = 30,
                rowColor = {default = {1, 1, 1}, over = {1, 0.7, 0.5}},
            }
        )
    end
end

function createTableView1()
	for i=1,4 do
    
        tableView1:insertRow(
            {
                isCategory = false, rowHeight = 30,
                rowColor = {default = {1, 1, 1}, over = {1, 0.7, 0.5}},
            }
        )
    end
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		display.setDefault("background",0.2,0.2,0.2)

--		ground = display.newRect(cx,50,cw,100)
--		ground:setFillColor(0.4,0.4,0.4)

		myText0 = display.newText("Time",50,150,"Arial",20)
		myText = display.newText("Food Record",cx,140-80,"Arial",50)
		myText1 = display.newText("Date",50,170,"Arial",20)
		myText2 = display.newText("Meal",48,225,"Arial",20)
		myText3 = display.newText("Food",50,280,"Arial",20)
		myText4 = display.newText("Amount",50,335,"Arial",20)
		
		myText6 = display.newText("Y",167,170,"Arial",18)
		myText7 = display.newText("M",232,170,"Arial",18)
		myText8 = display.newText("D",296,170,"Arial",18)

		txfTextDate1 = native.newTextField(125,170 ,60, 30)
--		txfTextDate1.isSecure = true
		txfTextMouth2 = native.newTextField(200,170 ,40, 30)
--		txfTextMouth2.isSecure = true
		txfTextYear3 = native.newTextField(265,170 ,40, 30)
--		txfTextYear3.isSecure = true
		
		txfText3 = native.newTextField(195,280 ,200, 30)
--		txfText3.isSecure = true
		txfText4 = native.newTextField(145,335 ,100, 30)
--		txfText4.isSecure = true


		myText9 = display.newText("Confirm",cx,400,"Arial",30)
		myText10 = display.newText("Back",30,500,"Arial",20)
		myText11 = display.newText("History",280,500,"Arial",20)

--Logo = widget.newButton(
--		   {
--		    x = 50, y = 50, 
--		    
--		    defaultFile = "logo.png" ,
--		    width = 80,
--		    height = 80
--		  }
--		)
		tableView = widget.newTableView {
            left = 180, top =210,
            height = 35,
            width = display.contentWidth/4,
            onRowRender = rowRender,
            onRowTouch = rowTouch
        }
        createTableView()

        tableView1= widget.newTableView {
            left = 260, top =315,
            height = 35,
            width = display.contentWidth/6,
            onRowRender = rowRender1,
            onRowTouch = rowTouch1
        }
        createTableView1()

		
myText9:addEventListener("touch",gotoConFirm)
myText10:addEventListener("touch",gotoMenuuu)
myText11:addEventListener("touch",gotoHistory)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		if not(myText15==nil) then
			myText15:removeSelf()
			myText15 = nil
		end
		if not(myText5==nil) then
			myText5:removeSelf()
			myText5 = nil
		end
		tableView1:removeSelf()
		tableView:removeSelf()
		tableView=nil
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()
		myText0:removeSelf()
		myText6:removeSelf()
		myText7:removeSelf()
		myText8:removeSelf()
		myText9:removeSelf()
		myText10:removeSelf()
		myText11:removeSelf()


		txfTextDate1:removeSelf()
		txfTextMouth2:removeSelf()
		txfTextYear3:removeSelf()
		
		txfText3:removeSelf()
		txfText4:removeSelf()

--		ground:removeSelf()
--		Logo:removeSelf()
--		Logotext:removeSelf()

--		ground = nil

		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil
		myText0 = nil
		myText6 = nil
		myText7 = nil
		myText8 = nil
		myText9 = nil
		myText10 = nil
		myText11 = nil


		txfTextDate1 = nil 
		txfTextMouth2 = nil 
		txfTextYear3 = nil 
		
		txfText3 = nil
		txfText4 = nil

	
--		Logo = nil
--		Logotext = nil

		Runtime:removeEventListener("touch", screenTouched)
		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end

cx = display.contentCenterX
cy = display.contentCenterY
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene