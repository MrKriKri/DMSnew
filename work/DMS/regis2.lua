local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local id

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #2 : create")
end

local function showScene(event)
	if(event.phase=="ended") then
		composer.gotoScene("regis3")
	end
end

local function  showID(event)
	 id = event.target.id
	if(event.phase == "ended")then
		print(id)

		composer.gotoScene("regis3")
	end

	return id
end

local function backscene( event )
	if(event.phase == "ended")then
	composer.gotoScene("regis1")
end
	-- body
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #2 : show (will)")
		display.setDefault("background",153/255,217/255,234/255)
	
		myText = display.newText("Please Choose",cx,140-10,"Arial",30)
		myText:setTextColor(0/255,0/255,0/255)
		myText2 = display.newText("Men",cx-50,380,"Arial",20)
		myText2:setTextColor(0/255,0/255,0/255)
		myText3 = display.newText("Woman",cx+50,380,"Arial",20)
		myText3:setTextColor(0/255,0/255,0/255)

LogoMan = widget.newButton(
   {
    x = cx-50, y = cy+45, 
    id = 'man',
   onEvent = showID,
    defaultFile = "man.png" ,
    width = 130,
    height = 130
  }
)

LogoWomen = widget.newButton(
   {
    x = cx+50, y = cy+45, 
    id = 'woman',
    onEvent = showID,
    defaultFile = "Women.png" ,
    width = 70,
    height = 130
  }
)

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

	elseif(phase == "did") then
		print("Scene #2 : show (did)")
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		composer.setVariable("gender",id)
		myText:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		LogoMan:removeSelf()
		LogoWomen:removeSelf()
		nextbtn:removeSelf()
		backbtn:removeSelf()
		backbtn = nil
		nextbtn = nil
		LogoMan = nil
		LogoWomen = nil
		myText = nil
		myText2 = nil
		myText3 = nil
		
		print("Scene #2 : hide (will)")
	elseif(phase == "did") then
		print("Scene #2 : hide (did)")
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