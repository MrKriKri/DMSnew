local composer = require("composer")
local widget = require("widget")
require("login")
local scene = composer.newScene()
local loinstatus




--------------------------------------------------------------------
function gotoRegis(event)
	composer.gotoScene("regis1")
end
--------------------------------------------------------------------
function gotoInside(event)
  if(event.phase=="ended") then

  	composer.setVariable("checklogin",true)
  
    Login(txfText.text,txfText2.text)
    
  end
end
----------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end
-----------------------------------------------------------------------------
function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		
		display.setDefault("background",0/255,0/255,0/255)
		cw,ch = display.contentWidth, display.contentHeight
		cx = display.contentCenterX
		cy = display.contentCenterY

	Logo = widget.newButton(
		   {
		    x = cx, y = cy, 
		    
		    defaultFile = "Wall4.jpg" ,
		    width = cw	,
		    height = 600
		  }
		)
		--ground = display.newRect(cx,70,cw,100)
		--ground:setFillColor(0/255,162/255,232/255)
		TextEmail = display.newText("Email",55,220,"Cloud-Bold",22)
		TextEmail:setTextColor(0/255,0/255,0/255)
		TextPass = display.newText("Password",55,265,"Cloud-Bold",21)
		TextPass:setTextColor(0/255,0/255,0/255)
		Text1 = display.newText("New to account",155,cy +250,"Cloud-Bold",20)
		Text1:setTextColor(0/255,0/255,0/255)
		txfText = native.newTextField(210,220 ,200, 30)
		txfText2 = native.newTextField(210,265 ,200, 30)
		txfText2.isSecure = true



--		Logotext = widget.newButton(
--		   {
--		    x = 202, y = 78, 
--		    
--		    defaultFile = "logotextt.png" ,
--		    width = 245,
--		    height = 315
--		  }
--		)
--
		btnLogin = widget.newButton(
		   {
		    x = cx, y = cy +80, 
		    --onEvent = gotoInside,
		    defaultFile = "login1.png" ,
		    width = 122,
		    height = 47
		  }
		)

		btnRegis = widget.newButton(
		   {
		    x = 270, y = cy +230, 
		    --onEvent = gotoRegis,
		    defaultFile = "Register.png" ,
		    width = 80,
		    height = 80
		  }
		)
		btnLogin:addEventListener("touch",gotoInside)
		btnRegis:addEventListener("touch",gotoRegis)
	elseif(phase == "did") then
		print("Scene #1 : show (did)")
		
	end
end
---------------------------------------------------------------
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		btnLogin:removeEventListener("touch",gotoInside)
	    btnRegis:removeEventListener("touch",gotoRegis)
		txfText2:removeSelf()
		txfText:removeSelf()
		Logo:removeSelf()
		--ground:removeSelf()
		TextEmail:removeSelf()
		TextPass:removeSelf()
		Text1:removeSelf()
		btnLogin:removeSelf()
		btnRegis:removeSelf()
		--Logotext:removeSelf()
		--Logotext=nil
		txfText=nil
		txfText2=nil
		Logo=nil
		btnRegis=nil
		btnLogin=nil
		--ground=nil
		TextEmail=nil
		TextPass=nil
		Text1=nil
		
		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
	end
end
-------------------------------------------------------
function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end
--------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene