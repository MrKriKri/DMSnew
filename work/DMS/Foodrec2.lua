local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
require("GetMeal")

function gotoMenuuu(event)
	if(event.phase=="ended")then
	composer.gotoScene("menu2")
end
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
		display.setDefault("background",0.2,0.2,0.2)


		myText = display.newText("Food Record",cx,140-80,"Arial",50)
		


		
		myText6 = display.newText("Back",30,500,"Arial",20)
		

		GetMeal(composer.getVariable("nowuser"))
		

		myText6:addEventListener("touch",gotoMenuuu)


	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		if not(textMeal==nil) then
		myText6:removeEventListener("touch",gotoMenuuu)

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
		myText:removeSelf()
		myText6:removeSelf()
		myText = nil
		myText6 = nil
		tableViewMeal:removeSelf()
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