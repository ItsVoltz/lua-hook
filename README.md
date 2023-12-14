#lua-hook
Class for easily hooking functions in lua

Example:

```lua
local hook = require('hook')

-- Print hook
_G.print = Hook:New(_G.print, function(fn, ...)
  fn('pre print') -- before original is called
  local ret = fn(...) -- call original and extract its return value(s) so we can run a poost hook before returning the results
  fn('post print') -- after if we dont need after we can just call return fn(...)
  return ret
end)

print('Hello, World!')

--[[
Output:
pre print
Hello, World!
post print
]--
```
