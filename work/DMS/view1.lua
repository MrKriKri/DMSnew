local composer = require("composer")
local scene = composer.newScene()



function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

local function Edit(event)
	if(event.phase=="ended")then
	composer.gotoScene("view2")
end
end

local function goback( event )
	if(event.phase=="ended")then
	composer.gotoScene("menu2")
end
	-- body
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		--display.setDefault("background",0,1,0)
		mail = display.newText("Email: "..composer.getVariable("username"),160,140-50,"Arial",20)
		name = display.newText("Name: "..composer.getVariable("name").."  "..composer.getVariable("lname"),160,140-30,"Arial",20)
		--name = display.newText(composer.getVariable("lname"),160,140-10,"Arial",20)
		birthdate = display.newText("Birthdate: "..composer.getVariable("birthdate"),160,150,"Arial",20)
		id = display.newText("IDcard: "..composer.getVariable("idcard"),160,170,"Arial",20)
		tel = display.newText("Tel: "..composer.getVariable("tel"),160,190,"Arial",20)
		--userline = display.newText("LineID: "..composer.getVariable("UserIDLine"),160,210,"Arial",20)
		docid = display.newText("Doctor ID: "..composer.getVariable("docID"),160,230,"Arial",20)
		docname = display.newText("Doctor name: "..composer.getVariable("docname"),160,250,"Arial",20)
		docline = display.newText("Doctor's Line: "..composer.getVariable("docline"),160,270,"Arial",20)
		doctel = display.newText("Tel: "..composer.getVariable("doctel"),160,290,"Arial",20)

		back = display.newText("Back",30,500,"Arial",20)
		back:addEventListener("touch",goback)

		editprofile = display.newText("Edit Profile",240,500,"Arial",20)
		editprofile:addEventListener("touch",Edit)



	elseif(phase == "did") then
		print("Scene #1 : show (did)")
		--timer.performWithDelay(3000, showScene)
		--Runtime:addEventListener("touch",screenTouched)
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		editprofile:removeEventListener("touch",Edit)
		back:removeEventListener("touch",goback)
		mail:removeSelf()
		name:removeSelf()
		birthdate:removeSelf()
		id:removeSelf()
		tel:removeSelf()
		docname:removeSelf()
		docid:removeSelf()
		docline:removeSelf()
		doctel:removeSelf()
		editprofile:removeSelf()
		back:removeSelf()
		back = nil
		editprofile = nil
		mail = nil
		name = nil
		birthdate = nil
		id = nil
		tel = nil
		doctel = nil
		docline = nil
		doctel = nil
		docid = nil
		--editprofile:removeEventListener("touch",Edit)
		--Runtime:removeEventListener("touch", screenTouched)
		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
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