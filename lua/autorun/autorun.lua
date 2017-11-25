if CLIENT then
    
    AddCSLuaFile('vgui/cl_main.lua')
    AddCSLuaFile('vgui/cl_config.lua')
    
end

if SERVER then
    
    include('vgui/cl_main.lua.lua')
    include('vgui/cl_config.lua')
    
end
