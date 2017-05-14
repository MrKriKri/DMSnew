local composer = require("composer")
local widget = require("widget")
require("recordBlood")
require("login")
require("sendLine")
local sugarblood = 0
local scene = composer.newScene()
local titleText, hTextField, wTextField, bmiText,login

function gotoMenu(event)
	composer.gotoScene("menu1")
end

function gotoAddtoRec(event)
	sugarblood = tonumber(wTextField.text)
	if(event.phase == "ended")then
	login = composer.getVariable("nowuser")
	print(login)
	if(sugarblood>180) then
	sendLine(composer.getVariable("UserIDLine"),login,composer.getVariable("username"),wTextField.text)
	end
	RecordSugarBloodRate(login,wTextField.text)
	composer.setVariable("sugar",nil)
end
end

local function calculateSugar(event)
	--local h = tonumber(hTextField.text)
	local w = tonumber(wTextField.text)
if( w == nil ) then
		bmiText.text=""
	else
		if(w<=70)then
				bmiText.text ="ต่ำ"
				display.setDefault("background", 77 / 255, 0, 86 / 255)
			elseif(w>70 and w<=100)then
				bmiText.text = "ปกติ"
				display.setDefault("background", 0, 86 / 255, 0)
				
			elseif(w>=100 and w<=125)then
				bmiText.text="ค่อนข้างสูง"
				display.setDefault("background", 177/ 255, 86 / 255, 0)
			elseif(w>=126 and w<=180) then 
				bmiText.text ="สูงมาก"
				display.setDefault("background", 50 / 255, 0, 0)
			elseif(w>180)then
				bmiText.text="อันตราย"
				display.setDefault("background", 160/255,0, 0)

		end	
end
end


local function textFieldHandler(event)
	calculateSugar(event)
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	local cx, cy
	cx = display.contentCenterX
	cy = display.contentCenterY
	if (phase == "will") then
		--display.setDefault("background", 77 / 255, 86 / 255, 86 / 255)

		titleText = display.newText("Blood sugar", cx, 100, "Quark-Bold", 40)
		--titleText1=display.newText("AGE",50, 180, "Quark-Bold",40)
		titleText2=display.newText("SUGAR",70, 230, "Quark-Bold",25)
		--titleText3=display.newText("year",250, 180, "Quark-Bold",20)
		titleText4=display.newText(" mg/dl",270,230, "Quark-Bold",20)


		myText = display.newText("Back",35,500,"Arial",20)
		myText1 = display.newText("Add to record",250,500,"Arial",20)

		--hTextField = native.newTextField(cx, 180, 130, 40)
		wTextField = native.newTextField(cx+20, 230, 130, 40)
		--hTextField.inputType = "number"
		wTextField.inputType = "number"
		--hTextField.align = "center"
		wTextField.align = "center"
		bmiText = display.newText(" ", cx, 300, "Quark-Bold", 40)
		sceneGroup:insert(titleText)
		sceneGroup:insert(bmiText)
		--hTextField.text = composer.getVariable("age")
		wTextField.text = composer.getVariable("sugar")

		

		myText:addEventListener("touch",gotoMenu)
		myText1:addEventListener("touch",gotoAddtoRec)
			
		--calculateSugar()		
	elseif (phase == "did") then	
		--hTextField:addEventListener("userInput", textFieldHandler)	
		wTextField:addEventListener("userInput", textFieldHandler)	
		
	end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		--composer.setVariable("age", hTextField.text)
		--composer.setVariable("sugar", wTextField.text)
		--hTextField:removeEventListener("userInput", textFieldHandler)	
		wTextField:removeEventListener("userInput", textFieldHandler)	
		titleText:removeSelf()
		--titleText1:removeSelf()
		titleText2:removeSelf()
		--titleText3:removeSelf()
		titleText4:removeSelf()
		--hTextField:removeSelf()
		wTextField:removeSelf()
		myText:removeSelf()
		myText1:removeSelf()
		bmiText:removeSelf()
	
		titleText = nil
		--titleText1 = nil
		titleText2 = nil
		--titleText3 = nil
		titleText4 = nil
		--hTextField = nil
		
		wTextField = nil
		calButton = nil
		bmiText = nil
		myText = nil
		myText1 = nil
		Runtime:removeEventListener("touch", screenTouched)
	elseif (phase == "did") then
	end
end

function scene:destroy(event)
	local sceneGroup = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene