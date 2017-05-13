function Sended(event)
	if(event.status==200)then
		print("complete")
	else 
		print("error send")
	end
end

function sendLine(use,id,name,bs)
		print(use)
		print(id)
		print(name)
		print(bs)
		URL = "http://shielded-plains-84224.herokuapp.com/notification.php?use="..use.."&ID="..id.."&name="..name.."&BS="..bs
		network.request(URL,"GET",Sended)
		print(URL)
end
