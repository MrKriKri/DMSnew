local composer = require("composer")
JSON = require("json")
local user,username

function  loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)

		--print("ID : "..resp[1]["ID"]..", Email : "..resp[1]["E-mail"])

		user = resp[1]["ID"]
		username = resp[1]["E-mail"]
		--print(user.." "..username)
		composer.setVariable("nowuser",user)
		composer.setVariable("username",username)
		composer.setVariable("UserIDLine",resp[1]["UserIDLine"])

	
		checklogin = true

		checkLogin(checklogin)
		return checklogin

	else 
		print("login fail")
		checklogin = false
		checkLogin(checklogin)
		return checklogin

end -- end if!error

end -- end of function


function checkLogin(checklogin)

	if(checklogin == true)then
		composer.gotoScene("menu1")

end
end

function LogOut(checklogin)
	if(checklogin == true)then
		composer.gotoScene("standard")
	end
end

function Login(mail,pass)
    network.request(
        "http://localhost/welcome.php?name="..mail.."&age="..pass,
        "GET",
        loadJSONListener,
        {}
    )
end
