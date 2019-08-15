json = require("rxi-json-lua")
inspect = require("inspect")

dataset = {}
dict = {}
isTrained = false

attemptTrain = () ->

return (...) ->
  if select(2, ...)[1] == nil
    select(1,...).channel\send("train/post")    
    return
  switch select(2, ...)[1]
    when "train"
      select(1,...).channel\send("Training!")
      select(1,...).channel\send("Parsing data.json")
      f = assert(io.open("data.json", "rb"))
      content = f\read("*all")
      f\close()
      content = json.decode(content)

      select(1,...).channel\send("Attempting to train...")
      -- make an empty dict
      -- for word in collection
      -- if word not in dict
      -- add word to dict as key
      -- value is a dict
      -- that has the following word
      -- and set value to 1

      -- if word in dict
      -- if following word in that word's dict
      -- value ++
      -- else
      -- add word to that words dict
      -- value = 1

      for _, line in ipairs(content) do
        s = {"START_TOKEN"}
        for word in line\gmatch("[^ ]+") do
          s[#s+1] = word

        for key, word in ipairs(s) do
          nextWord = ""
          z = s[key+1]
          if z == nil then
            nextWord = "END_TOKEN"
          else
            nextWord = tostring(s[key+1])
          if not dataset[word] then
            dataset[word] = {}
            if nextWord != nil then
              dataset[word][nextWord] = 1
          else -- word in dict
            if nextWord != nil then
              if dataset[word][nextWord] then
                dataset[word][nextWord] += 1
              else
                dataset[word][nextWord] = 1

      isTrained = true
      select(1,...).channel\send("Training complete.")
      return
    when "post"
      if isTrained
        -- To find the probability of the following word
        -- take each word's occurrence
        -- and divide by total nums in the dict
        -- the  use that probability to semi-randomly choose the next word based on the last
        -- continue until the token that's chosen is a period
        myStr = {}
        currentWord = "START_TOKEN" 
        mod = 15
        while currentWord != "END_TOKEN"
          map = {}
          for k, v in pairs(dataset[currentWord]) do
            -- fill map with values 'value' times
            for i=1, tonumber(v) do
              table.insert(map, k)

          -- randomly pick one, more values in map == greater prob
          -- of selecting it
          table.insert(myStr, map[math.random(#map)])

          -- let it talk a bit more than just 5 words
          if mod > 0
            if myStr[#myStr] == "END_TOKEN"
              mod -= 1
              table.remove(myStr, #myStr)

          currentWord = tostring(myStr[#myStr])

        s = ""
        table.remove(myStr, #myStr)
        for _, v in pairs(myStr) do
          s = s .. " ".. v
        select(1,...).channel\send(s)
      else
        select(1,...).channel\send("Cass not trained!")











