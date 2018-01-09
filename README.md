# shortbread
Moonscript Discord bot (with hashtables :3c)

All commands are contained within `commands/` and follow the following structure:

```moonscript
-- myCommand.moon
return (server, content) ->
  -- !command arg1 arg2 arg3
  -- content = {arg1, arg2, arg3}

  message = content[n]
  server\send(message)
```
and then in `shortbread.moon`
```moonscript
SB.hashtable = {
  ["myCommand"]: (...) -> require("commands.myCommand")(...),
  -- ...
```

```bash
moonc -t src .
luvit src/bot.lua
```

```moonscript
-- secrets.lua
secrets = { TOKEN: "your_token_here" }
return secrets
```