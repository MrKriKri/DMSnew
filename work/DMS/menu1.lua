local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

function gotoProfile(event)
	composer.gotoScene("menu2")
end

function gotoCalculate(event)
	composer.gotoScene("calculatesugar")
end

function gotoGraph(event)
	composer.gotoScene("Graph")
end

function gotoInformation(event)
	composer.gotoScene("Information")
end
function gotoFood(event)
	composer.gotoScene("foodguide")
end


function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		display.setDefault("background",14/255,4/255,193/255)

		ground = display.newRect(cx,15,cw,60)
		ground:setFillColor(0.4,0.4,0.4)

		myText = display.newText(composer.getVariable("username"),215,15,"Arial",20)
		myText1 = display.newText("Analysis",185,120,"Arial",30)
		myText2 = display.newText("Graphs",180,230,"Arial",30)
		myText3 = display.newText("Food Guides",220,340,"Arial",30)
		myText4 = display.newText("Information",210,450,"Arial",30)

ProFile = widget.newButton(
		   {
		    x = 280, y = 15, 
		    --onEvent = ,
		    defaultFile = "iconProfile.png" ,
		    width = 50,
		    height = 50
		  }
		)
		
		
Analysis = widget.newButton(
		   {
		    x = 75, y = 120, 
		    --onEvent = ,
		    defaultFile = "iconAnaly.png" ,
		    width = 110,
		    height = 110
		  }
		)

Graphs = widget.newButton(
		   {
		    x = 75, y = 230, 
		    --onEvent = ,
		    defaultFile = "iconGrahp.png" ,
		    width = 90,
		    height = 90
		  }
		)

Foodguide = widget.newButton(
		   {
		    x = 75, y = 340, 
		    --onEvent = ,
		    defaultFile = "iconFood.png" ,
		    width = 90,
		    height = 90
		  }
		)

Information = widget.newButton(
		   {
		    x = 75, y = 450, 
		    --onEvent = ,
		    defaultFile = "iconInfor.png" ,
		    width = 90,
		    height = 90
		  }
		)

Foodguide:addEventListener("touch",gotoFood)
Graphs:addEventListener("touch",gotoGraph)		
ProFile:addEventListener("touch",gotoProfile)
Analysis:addEventListener("touch",gotoCalculate)
Information:addEventListener("touch",gotoInformation)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		Analysis:removeSelf()
		Graphs:removeSelf()
		Foodguide:removeSelf()
		Information:removeSelf()
		ProFile:removeSelf()
		ground:removeSelf()
		
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()

		Analysis = nil
		Graphs = nil
		Foodguide = nil
		Information = nil
		ProFile = nil
		ground = nil

		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil

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

cw,ch = display.contentWidth, display.contentHeight
cx = display.contentCenterX
cy = display.contentCenterY
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene