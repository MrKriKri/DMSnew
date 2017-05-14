local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local function gotoMenu(event)
	composer.gotoScene("menu1")
end

local function gotoInfor1(event)
	composer.gotoScene("infor1")
end

local function gotoInfor2(event)
	composer.gotoScene("Infor2")
end

local function gotoInfor3(event)
	composer.gotoScene("Infor3")
end

local function gotoInfor4(event)
	composer.gotoScene("Infor4")
end

local function gotoInfor5(event)
	composer.gotoScene("Infor5")
end

local function gotoInfor6(event)
	composer.gotoScene("Infor6")
end

local function gotoInfor7(event)
	composer.gotoScene("Infor7")
end

local function gotoInfor8(event)
	composer.gotoScene("Infor8")
end

local function gotoInfor9(event)
	composer.gotoScene("Infor9")
end

local function gotoInfor10(event)
	composer.gotoScene("Infor10")
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

--		ground = display.newRect(cx,50,cw,100)
--		ground:setFillColor(0.4,0.4,0.4)


		myText1 = display.newText("โรคเบาหวาน คือ อะไร",cx,80,"Arial",30)
		myText2 = display.newText("อาการของผู้ป่วย",cx,115,"Arial",30)
		myText3 = display.newText("การวินิจฉัย",cx,150,"Arial",30)
		myText4 = display.newText("ชนิดของโรคเบาหวาน",cx,185,"Arial",30)
		myText5 = display.newText("โรคแทรกซ้อน",cx,220,"Arial",30)
		myText6 = display.newText("หลักการรักษา",cx,255,"Arial",30)
		myText7 = display.newText("การป้องกัน",cx,290,"Arial",30)
		myText8 = display.newText("อาหารที่ไม่ควรรับประทาน",cx,325,"Arial",30)
		myText9 = display.newText("แหล่งข้อมูลอ้างอิง",cx,360,"Arial",30)
		myText10 = display.newText("ข้อมูลผู้จัดทำ",cx,395,"Arial",30)

		
		myText11 = display.newText("Back",30,5,"Arial",20)

--Logo = widget.newButton(
--		   {
--		    x = 50, y = 50, 
--		    
--		    defaultFile = "logo.png" ,
--		    width = 80,
--		    height = 80
--		  }
--		)

--Logotext = widget.newButton(
--		   {
--		    x = 202, y = 58, 
--		    
--		    defaultFile = "logotextt.png" ,
--		    width = 245,
--		    height = 315
--		  }
--		)


		
myText1:addEventListener("touch",gotoInfor1)
myText2:addEventListener("touch",gotoInfor2)
myText3:addEventListener("touch",gotoInfor3)
myText4:addEventListener("touch",gotoInfor4)
myText5:addEventListener("touch",gotoInfor5)
myText6:addEventListener("touch",gotoInfor6)
myText7:addEventListener("touch",gotoInfor7)
myText8:addEventListener("touch",gotoInfor8)
myText9:addEventListener("touch",gotoInfor9)
myText10:addEventListener("touch",gotoInfor10)	
myText11:addEventListener("touch",gotoMenu)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

		myText1:removeEventListener("touch",gotoInfor1)
		myText2:removeEventListener("touch",gotoInfor2)
		myText3:removeEventListener("touch",gotoInfor3)
		myText4:removeEventListener("touch",gotoInfor4)
		myText5:removeEventListener("touch",gotoInfor5)
		myText6:removeEventListener("touch",gotoInfor6)
		myText7:removeEventListener("touch",gotoInfor7)
		myText8:removeEventListener("touch",gotoInfor8)
		myText9:removeEventListener("touch",gotoInfor9)
		myText10:removeEventListener("touch",gotoInfor10)	
		myText11:removeEventListener("touch",gotoMenu)

	
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()
		myText5:removeSelf()
		myText6:removeSelf()
		myText7:removeSelf()
		myText8:removeSelf()
		myText9:removeSelf()
		myText10:removeSelf()
		myText11:removeSelf()
--		ground:removeSelf()
--		Logo:removeSelf()
--		Logotext:removeSelf()

--		ground = nil

		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil
		myText5 = nil
		myText6 = nil
		myText7 = nil
		myText8 = nil
		myText9 = nil
		myText10 = nil
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
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene