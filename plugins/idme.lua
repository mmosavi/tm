
do

function run(msg, matches)
	if msg.to.type == 'chat' or msg.to.type == 'channel' then
  return "نام شما: "..msg.from.first_name.."\n آیدی شما: "..msg.from.id.."\n---------------------------------------\nلینک دسترسی به شما: telegram.me/"..(msg.from.username or '').."\n---------------------------------------\nنام گروه: "..msg.to.title.."\nآیدی گروه: "..msg.to.id
end
end
return {
  description = "Info Group And User", 
  usage = "id: Information",
  patterns = {
    "^[#!/]idme$"
    }, 
  run = run 
}

end
