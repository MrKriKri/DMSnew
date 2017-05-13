JSON = require("json")
composer = require("composer")

function loadJSONListenerRegis(event)
	if not(event.isError)then
		print("success1232132")
		native.showAlert("Complete","Success Regiter")
		composer.gotoScene("standard")
	else 
		print("fail Register") 
	end
end

function doRegister(mail,pass,name,surname,idcard,dob,tel,docid)
	local url = "http://localhost/ws.php?E-mail="..mail.."&Password="..pass.."&Name="..name.."&Surname="..surname.."&IDcard="..idcard.."&DOB="..dob.."&Tel="..tel.."&DoctorID="..docid
    print(url)
    network.request(
       url,
        "GET",
        loadJSONListenerRegis,
        {}
    )
end