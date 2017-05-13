local composer = require("composer")
local widget = require("widget")
require("register")
require("Getdoctor")
local scene = composer.newScene()

local mail,pass,name,surname,idcard,dob,tel

function regis(event)


	if(event.phase == "ended")then
	if not(composer.getVariable("docID")==nil) then
				mail = composer.getVariable("mail")
				pass = composer.getVariable("pass")
				name = composer.getVariable("name")
				surname = composer.getVariable("lname")
				idcard = composer.getVariable("idcard")
				dob = composer.getVariable("birthdate")
				tel = composer.getVariable("tel")
				docid=composer.getVariable("docIDD")
				doRegister(mail,pass,name,surname,idcard,dob,tel,docid)
				
				
	else
		native.showAlert("Fail","Pleas!! Select Doctor","OK")
	end
end
end

local function showScene(event)
	composer.gotoScene("standard")
end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #4 : create")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #4 : show (will)")

		display.setDefault("background",153/255,217/255,234/255)



		myText = display.newText("Register",cx,70,"Arial",50)
		myText:setTextColor(0/255,0/255,0/255)
		myText1 = display.newText("Select Your Doctor",cx,120,"Arial",30)
		myText1:setTextColor(0/255,0/255,0/255)

		
		
		
		GetDoctor()
		
		

	LogoCon = widget.newButton(
   {
    x = cx-70, y = cy+250, 
    defaultFile = "Confirm.png" ,
    width = 129,
    height = 50
  }
)

LogoCan = widget.newButton(
   {
    x = cx+70, y = cy+250, 
    defaultFile = "Cancel.png" ,
    width = 119,
    height = 40
  }
)
	LogoCon:addEventListener("touch",regis)
	LogoCan:addEventListener("touch",showScene)

	elseif(phase == "did") then
		print("Scene #4 : show (did)")
		
	end
end
function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then

		LogoCon:removeEventListener("touch",regis)
		LogoCan:removeEventListener("touch",showScene)
		
		composer.setVariable("mail","")
		composer.setVariable("pass","")
		composer.setVariable("gender","")
		composer.setVariable("docname","")
		composer.setVariable("docline","")
		
		composer.setVariable("name","")
		composer.setVariable("lname","")
		composer.setVariable("idcard","")
		composer.setVariable("birthdate","")
		composer.setVariable("tel","")
		
		myText:removeSelf()
		myText1:removeSelf()
		if not(mytextDocID == nil) then
			mytextDocID:removeSelf()
			mytextDocname:removeSelf()
		end
		tableView:removeSelf()

		mytextDocname= nil
		mytextDocID = nil
		tableView = nil
	
		LogoCon:removeSelf()
		LogoCan:removeSelf()

		myText = nil
		myText1 = nil
	

	
		LogoCan = nil
		LogoCon =nil
		

		--Runtime:removeEventListener("touch", screenTouched)
		print("Scene #4 : hide (will)")
	elseif(phase == "did") then
		print("Scene #4 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #4 : destroy")
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene