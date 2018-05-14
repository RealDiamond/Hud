--[[----------------------------------------------------------------------------------------------------
Author: Rudy
My contact

    Steam = http://steamcommunity.com/id/id187393908/
    Web = https://realdiamond.github.io/
    Twiter = https://twitter.com/RudyRansone

Version: 1.1.0
--------------------------------------------------------------------------------------------------------
13:20 03.11.2017 | Добавлен | HUDConfig.
-------------------------------------------------------------------------------------------------------]]
local config = {}
--============================Font==============================--
if CLIENT then
    
    surface.CreateFont("ui.40", { font = "Arial", size = 17.800, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.39", { font = "Arial", size = 18, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.38", { font = "Arial", size = 21, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.37", { font = "Arial", size = 18, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.36", { font = "Arial", size = 17, weight = 2500, outline = false, }) 
        
end      
--===========================Config==============================--
config.Radius    = 0                          -- Radius (0 |max 4)
config.basecolor = Color( 40,40,40,220 )      -- basecolor     : |40,40,40,220|120,120,120,220|0,0,0,220|
config.Outlined  = Color( 255,255,255,255 )   -- outlined      : |255,255,255,255|0,0,0,255|
config.laws      = Color( 120,120,120,120 )   -- Color laws    : |40,40,40,120|120,120,120,120|
config.health    = Color( 255,10,10,220 )     -- Color healrh  : |255,10,10,220|
config.armor     = Color( 10,10,255,220 )     -- Color armor   : |10,10,255,220|120,120,120,220|
config.text      = Color( 255,255,255,220 )   -- Color text    : |255,255,255,220|
config.icon      = Color( 255,255,255,255 )   -- Color icon    : |255,255,255,255|
--============================language============================--
config.lockdown_text = "Мэр объявил комендантский час!"
config.health_text   = "Здоровье"
config.armor_text    = "Броня"
config.laws_text     = "*Законы города*"
--============================End Config============================--

--========НЕ ТРОГАТЬ!========--
function hud_main_config()
    return config
end 
-------------------------------
