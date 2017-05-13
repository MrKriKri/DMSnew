JSON = require("json")
local widget = require("widget")
filename = ""
function saveGraph(event)
	if not(event.isError)then
		GraphImage = display.newImage(filename..".PNG",system.TemporaryDirectory)
		GraphImage.x = GraphImage.width/4
		GraphImage.y = GraphImage.height/2
		GraphImage:scale(0.5,0.7)
		scrollView = widget.newScrollView(
		{
			top = 50,
			lelf = 0,
			width = display.contentWidth,
			height = 300,
			scrollWidth = GraphImage.width/4,
			scrollHeight = GraphImage.height,
			listener = scrollEvent
			}
		)
		scrollView:insert(GraphImage)
	else
		print("fail save pic")
	end
end
function setname(name)
	tostring(name)
	filename=name

end

function getname()
	return filename
end
function SendparamGraph(event)

	if not(event.isError)then
		resp=JSON.decode(event.response)
			print(resp[1])
			print(resp[2])
		URL="https://chart.googleapis.com/chart?chxt=x,y&chxr=1,10,300&cht=lc&&chs=1000x300&chd=t:"..resp[1].."|200&chds=0,300&chl="..resp[2].."&chm=s,000000,0,-1,5|H,FF0000,1,18,2"
		print(URL)
		network.download(URL,"GET",saveGraph,getname()..".PNG",system.TemporaryDirectory)
		print(getname()..".PNG")
	else 
		print("fail Data GenGraph") 
	end
end

function CreatDataGraph(ID,Begin,ddd)
	
		if not(GraphImage==nil)then
			scrollView:removeSelf()
			scrollView=nil
			GraphImage:removeSelf()
			GraphImage=nil
		end

	setname(math.random(0,500))
	URLL="http://localhost/getRecbyDate.php?ID="..ID.."&Begin="..ddd.."&End="..Begin
	print(URLL)
	network.request(URLL,"GET",SendparamGraph)


end