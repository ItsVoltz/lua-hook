# lua-hook
Class for easily hooking functions in lua

Example:

```lua
-- Print hook
_G.print = Hook:New(_G.print, function(fn, ...)
  fn('pre print!') -- before original is called
  local ret = fn(...)
  fn('post print') -- after if we dont need after we can just call return fn(...)
  return ret
end)

print('Hello, World!')
```
