local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
require("TableFoodguide")


function scene:create(event)
    local sceneGroup = self.view
    print("Scene #1 : create")
end

function gotoMenuG(event)
    composer.gotoScene("menu1")
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase
    if(phase == "will") then
        print("Scene #1 : show (will)")
        database()
        
    elseif(phase == "did") then
        print("Scene #1 : show (did)")
    
    end
end

myText1 = display.newText("Back",30,500,"Arial",20)
myText1:setTextColor(0,0,0)



myText1:addEventListener("touch",gotoMenuG)
function scene:hide(evevt)
    local sceneGroup = self.view
    local phase = evevt.phase
    if(phase == "will") then
        tableView:removeSelf()
        myText1:removeSelf()
        tableView=nil
        myText1=nil
     
        print("Scene #1 : hide (will)")
    elseif(phase == "did") then
        print("Scene #1 : hide (did)")
    end
end

function scene:destroy(evevt)
    local sceneGroup = self.view
    print("Scene #1 : destroy")
end

cw,ch = display.contentWidth, display.contentHeight
cx = display.contentCenterX
cy = display.contentCenterY
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene