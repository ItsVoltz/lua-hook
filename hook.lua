local Hook = {}

Hook.__index = Hook

function Hook:__call(...)
  return self.hook(self.fn, ...)
end

function Hook:New(original, hook)
  local self = setmetatable({}, Hook)
  
  self.fn = original
  self.hook = hook
  
  return self
end

return Hook
