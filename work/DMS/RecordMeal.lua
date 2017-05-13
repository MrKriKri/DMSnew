

function  loadJSONListenerMealrecord(event)
	if not(event.isError)then
		print("record success")
		native.showAlert("Success","Success Record","OK")

	else 
		print("fail record")
end 

end 

function RecordMeal(ID,Meal,dat,tim,Food,Amount)
    local url ="http://localhost/record_Meal.php?ID="..ID.."&Meal="..Meal.."&DATE="..dat.."&TIME="..tim.."&Food="..Food.."&Amount="..Amount
    print(url)
    network.request(
        url,
        "GET",
        loadJSONListenerMealrecord,
        {}
    )
end
