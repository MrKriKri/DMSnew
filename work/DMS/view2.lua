local composer = require("composer")
local scene = composer.newScene()

local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart)
	if(phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		if(xStart > xEnd and swipeLength > 50) then
			composer.gotoScene("view3")
		elseif(xStart < xEnd and swipeLength > 50) then
			composer.gotoScene("view1")
		end
	end
end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #2 : create")
end

local function showScene()
	composer.gotoScene("view3",{effect = "fade",time = 500})
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #2 : show (will)")
		display.setDefault("background",0,0,1)
		myText = display.newText("view #2",160,140-50,"Arial",50)
	elseif(phase == "did") then
		print("Scene #2 : show (did)")
		--timer.performWithDelay(3000, showScene)
		Runtime:addEventListener("touch",screenTouched)
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		myText:removeSelf()
		myText = nil
		Runtime:removeEventListener("touch", screenTouched)
		print("Scene #2 : hide (will)")
	elseif(phase == "did") then
		print("Scene #2 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene