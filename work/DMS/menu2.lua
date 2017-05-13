local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

function gotoMenu(event)
	composer.gotoScene("menu1")
end

function gotoProfile(event)
	composer.gotoScene("view1")	
end

--function gotoEdit(event)
	
--end

--function gotoReminder(event)
	
--end

function gotoFoodrec(event)
	composer.gotoScene("Foodrec1")
end

function gotoLogout(event)
	LogOut(checklogin)
	
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

		myText = display.newText(composer.getVariable("username"),105,15,"Arial",20)
		myText1 = display.newText("Profile",65,100,"Arial",30)
		myText2 = display.newText("Edit Profile",94,150,"Arial",30)
		myText3 = display.newText("Reminder",88,200,"Arial",30)
		myText4 = display.newText("Food Record",110,250,"Arial",30)
		myText5 = display.newText("Logout",280,500,"Arial",20)
		myText6 = display.newText("Back",30,500,"Arial",20)

ProFile = widget.newButton(
		   {
		    x = 40, y = 15, 
		    --onEvent = ,
		    defaultFile = "iconProfile.png" ,
		    width = 50,
		    height = 50
		  }
		)
		
myText1:addEventListener("touch",gotoProfile)
--myText2:addEventListener("touch",gotoEdit)
--myText3:addEventListener("touch",gotoReminder)
myText4:addEventListener("touch",gotoFoodrec)
myText5:addEventListener("touch",gotoLogout)	
myText6:addEventListener("touch",gotoMenu)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		ProFile:removeSelf()
		
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()
		myText5:removeSelf()
		myText6:removeSelf()
		ground:removeSelf()

		ProFile = nil
		ground = nil
		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil
		myText5 = nil
		myText6 = nil

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