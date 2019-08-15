# shortbread
Just a little experiment.

All commands are contained within `commands/` and follow the following structure:

```bash
luarocks install moonscript
luarocks install rxi-json-lua
brew install luvit
lit install SinisterRectus/discordia

```

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
SB.commands = {
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

## casspost

`data.json`

```json
[
	"some message",
	"that i wrote a long time ago",
	":("
]
```

`casspost train`
`casspost post