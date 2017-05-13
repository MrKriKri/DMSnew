local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local cx, cy, cw, ch
local scrollView, bodyText, contents
local path, file
local imgLogo, imgBurger, p



function gotoInformation(event)
	composer.gotoScene("Information")
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
		display.setDefault("background", 0.2, 0.2, 0.2)

path = system.pathForFile("information/แหล่งอ้างอิง.txt", system.ResourceDirectory)
file, err = io.open(path, "r")

if(file) then
	contents = file:read("*a")
	io.close(file)
	file = nil
else
	contents = "* ERROR *"
end

scrollView = widget.newScrollView(
{
	top = 130,
	left = 0,
	width = cw,
	height = ch,
	topPadding = 0,
	bottomPadding = 0,
	horizontalScrollDisabled = true,
	hideBackground = true
	}
)


bodyText = display.newText(contents, cx, 10, cw - 20, 3000, "Cloud-Light", 25)
bodyText.anchorY = 0
bodyText:setTextColor(1, 1, 1)

imgLogo = widget.newButton(
		   {
		    x = cx, 
		    y = 70, 
		    
		    defaultFile = "logodiabetes.png" ,
		    width = 320,
		    height = 100
		  }
		)	
		
myText11 = display.newText("Back",30,1,"Arial",20)
myText11:setTextColor(1,1,1)





scrollView:insert(bodyText)		

myText11:addEventListener("touch",gotoInformation)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		imgLogo:removeSelf() 
		bodyText:removeSelf()
		myText11:removeSelf()
--		ground:removeSelf()
--		Logo:removeSelf()
--		Logotext:removeSelf()

--		ground = nil
		imgLogo = nil 
		bodyText = nil
		myText11 = nil
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
cw = display.contentWidth
ch = display.contentHeight



scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)




return scene