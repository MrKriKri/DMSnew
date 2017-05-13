local composer = require("composer")
JSON = require("json")
local user,username

function  loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)

		--print("ID : "..resp[1]["ID"]..", Email : "..resp[1]["E-mail"])

		user = resp[1]["ID"]
		username = resp[1]["E-mail"]
		name = resp[1]["Name"]
		lname = resp[1]["Surname"]
		idcard = resp[1]["IDcard"]
		birthdate = resp[1]["DOB"]
		tel = resp[1]["Tel."]
		docID = resp[1]["DoctorID"]
		--print(user.." "..username)
		composer.setVariable("nowuser",user)
		composer.setVariable("username",username)
		composer.setVariable("UserIDLine",resp[1]["UserIDLine"])

		composer.setVariable("name",name)
		composer.setVariable("lname",lname)
		composer.setVariable("idcard",idcard)
		composer.setVariable("birthdate",birthdate)
		composer.setVariable("tel",tel)

		composer.setVariable("docID",docID)
		composer.setVariable("docname",resp[1]["DocName"])
		composer.setVariable("docline",resp[1]["LineID"])
		composer.setVariable("doctel",resp[1]["Tel"])

	
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
