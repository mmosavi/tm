local function history(extra, suc, result) 
  for i=1, #result do 
    delete_msg(result[i].id, ok_cb, false) 
  end 
  if tonumber(extra.con) == #result then 
    send_msg(extra.chatid, '"'..#result..'" last msgs cleaned!', ok_cb, false) 
  else 
    send_msg(extra.chatid, 'پیام های گروه پاکسازی شد!', ok_cb, false) 
  end 
end 
local function run(msg, matches) 
  if matches[1] == 'rm' and is_owner(msg) then 
    if msg.to.type == 'channel' then 
      if tonumber(matches[2]) > 10000 or tonumber(matches[2]) < 1 then 
        return "Erorr!!" 
      end 
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]}) 
    else 
      return "فقط در سوپرگروه ها امکان پذیر است!" 
    end 
  else 
    return "متاسفانه از شما دستور نمی گیرم!" 
  end 
end 

return { 
    patterns = { 
        '^[!/#](rm) (%d*)$' 
    }, 
    run = run 
} 
