local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

local function showScene(event)
	txfText2:addEventListener("userInput",comparePassw)
	txfText3:addEventListener("userInput",comparePassw)

	local comp = comparePassw(txfText2.text,txfText3.text)

	if(event.phase == "ended")then
		if(comp == true)then
		composer.gotoScene("regis2")
	end
end	
end

local function backscene( event )
	if(event.phase == "ended")then
	composer.gotoScene("standard")
end
end

function comparePassw(text,text2)

	text = txfText2.text
	text2 = txfText3.text

	if ((text ~= nil or text2 ~= nil) and (text == text2))then
		return true
		else
			errorshow.text = "password not same or blank"
	end
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")

		display.setDefault("background",153/255,217/255,234/255)


		myText = display.newText("Register",cx,140-50,"Arial",60)
		myText:setTextColor(0/255,0/255,0/255)
		myText1 = display.newText("Email",50,220,"Arial",20)
		myText1:setTextColor(0/255,0/255,0/255)
		myText2 = display.newText("Password",47,265,"Arial",20)
		myText2:setTextColor(0/255,0/255,0/255)
		myText3 = display.newText("Confirm",50,310,"Arial",20)
		myText3:setTextColor(0/255,0/255,0/255)
		errorshow = display.newText("",cx,370,"Arial",20)

		txfText = native.newTextField(202,220 ,220, 30)
		txfText2 = native.newTextField(202,265 ,220, 30)
		txfText2.isSecure = true
		txfText3 = native.newTextField(202,310 ,220, 30)
		txfText3.isSecure = true

		nextbtn = widget.newButton(
				{x = cx+100, y = cy+230, 
    			onEvent = showScene,
    			defaultFile = "next.png" ,
    			width = 80,
    			height = 60}
    		)

		backbtn = widget.newButton(
				{x = cx-100, y = cy+230, 
    			onEvent = backscene,
    			defaultFile = "back.png" ,
    			width = 80,
    			height = 60}
    		)
		txfText.text = composer.getVariable("mail")
		txfText2.text = composer.getVariable("pass")
		
	elseif(phase == "did") then
		print("Scene #1 : show (did)")
		
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		composer.setVariable("mail",txfText.text)
		composer.setVariable("pass",txfText2.text)
		nextbtn:removeEventListener("touch",showScene)
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		txfText:removeSelf()
		txfText2:removeSelf()
		txfText3:removeSelf()
		nextbtn:removeSelf()
		backbtn:removeSelf()
		errorshow:removeSelf()
		errorshow = nil
		backbtn = nil
		nextbtn = nil
		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		txfText = nil
		txfText5 = nil
		txfText3 = nil
		

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