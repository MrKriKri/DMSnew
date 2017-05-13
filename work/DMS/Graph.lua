local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local datenow = os.date("*t")
require("GenGraph")
function CreaterGraph(event)
	if(event.phase=="ended")then
		--filename=math.random(0,500)
		--print(filename)
		CreatDataGraph(composer.getVariable("nowuser"),txtBeginfld.text,txtEndfld.text)
		--[[
		name=tostring(filename)..".PNG"
		print(type(name))
		print(name)
		GraphImage = display.newImage(name,system.TemporaryDirectory)
		GraphImage.x = GraphImage.width/4
		GraphImage.y = GraphImage.height/2
		GraphImage:scale(0.5,0.7)
		scrollView = widget.newScrollView(
		{
			top = 50,
			lelf = 0,
			width = display.contentWidth,
			height = 300,
			scrollWidth = GraphImage.width/4,
			scrollHeight = GraphImage.height,
			listener = scrollEvent
			}
		)
		scrollView:insert(GraphImage)
]]
	end
end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

function gotoMenuG(event)
	composer.gotoScene("menu1")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")

		display.setDefault("background",0.2,0.2,0.2)
		ground = display.newRect(cx,15,cw,60)
		ground:setFillColor(0.4,0.4,0.4)


		myText11 = display.newText("Back",30,500,"Arial",20)

		ProFile = widget.newButton(
		   {
		    x = 280, y = 15, 
		    --onEvent = ,
		    defaultFile = "iconProfile.png" ,
		    width = 50,
		    height = 50
		  }
		)
		now = datenow.year.."-"..datenow.month.."-"..datenow.day
		CreatDataGraph(composer.getVariable("nowuser"),now,now)
		myText = display.newText(composer.getVariable("username"),215,15,"Arial",20)
		txtBeginfld = native.newTextField(240,400,100, 30)
		txtEndfld = native.newTextField(75,400,100, 30)

		ShowGraph = widget.newButton(
		   {
		    x = cx, y = 450, 
		    --onEvent = ,
		    defaultFile = "show.png" ,
		    width = 120,
		    height = 40
		  }
		)
		ShowGraph:addEventListener("touch",CreaterGraph)
		myText11:addEventListener("touch",gotoMenuG)
	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		myText11:removeSelf()
		ShowGraph:removeSelf()
		ground:removeSelf()
		ProFile:removeSelf()
		myText:removeSelf()
		txtBeginfld:removeSelf()
		txtEndfld:removeSelf()

		if not(GraphImage==nil)then
			scrollView:removeSelf()
			scrollView=nil
			GraphImage:removeSelf()
			GraphImage=nil
		end

		
		ground  = nil
		ProFile = nil
		myText = nil
		txtBeginfld = nil
		txtEndfld = nil
		ShowGraph = nil
		myText11 = nil

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