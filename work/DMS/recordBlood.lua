

function  loadJSONListenerBloodrate(event)
	if not(event.isError)then
		print("record success")

	else 
		print("fail record")
end 

end 

function RecordSugarBloodRate(ID,sugar)
    local url = "http://localhost/record.php?ID="..ID.."&sugar="..sugar
    print(url)
    network.request(
        url,
        "GET",
        loadJSONListenerBloodrate,
        {}
    )
end
