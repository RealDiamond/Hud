--[[----------------------------------------------------------------------------------------------------
Author: Rudy
My contact

    Steam = http://steamcommunity.com/id/id187393908/
    Mail = rudyransone@gmail.com
    Web = https://realdiamond.github.io/
    Twiter = https://twitter.com/RudyRansone

Version: 1.1.0
--------------------------------------------------------------------------------------------------------
13:20 03.11.2017 | Добавлен | HUDConfig.
-------------------------------------------------------------------------------------------------------]]

local config = {}

if CLIENT then
    
    surface.CreateFont("ui.40", { font = "Arial", size = 17.800, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.39", { font = "Arial", size = 18, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.38", { font = "Arial", size = 21, weight = 2500, outline = false, }) 
    surface.CreateFont("ui.37", { font = "Arial", size = 18, weight = 2500, outline = false, }) 
        
end      

config.Radius = 0

config.basecolor = Color( 40,40,40,220 )
config.Outlined = Color( 255,255,255,255 )

config.health = Color( 255,10,10,220 )
config.armor = Color( 10,10,255,220 )

config.text = Color( 255,255,255,220 )

config.icon = Color( 255,255,255,255 )

config.lockdown_text = "Мэр объявил комендантский час!"
config.health_text = "Здоровья"
config.armor_text = "Броня"

--НЕ трогать!--
function hud_main_config()
	return config
end
