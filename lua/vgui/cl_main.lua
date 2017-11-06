local Page = Material("icon16/page_white_text.png")
local function hud_main()

    local config = hud_main_config()

    local client = LocalPlayer()
    
    if !client:Alive() then
        return
    end

    local x = ScrW()
    local y = ScrH()

    local HP = LocalPlayer():Health()
    if HP < 0 then HP = 0 end
    if HP >100 then HP = 100 end

    local AR = LocalPlayer():Armor()
    if AR < 0 then AR = 0 end
    if AR >100 then AR = 100 end

    if LocalPlayer():getDarkRPVar("HasGunlicense") then
        surface.SetMaterial( Page )
        surface.SetDrawColor( config.icon )
        surface.DrawTexturedRect( x - 1275, y - 88, 21, 21 )
    end

    draw.RoundedBox( config.Radius, x - 1275, y - 44, 300, 18, config.basecolor )
    draw.RoundedBox( config.Radius, x - 1275, y - 44, HP * 3.0, 18, config.health )
    surface.SetDrawColor( config.Outlined )
    surface.DrawOutlinedRect( x - 1275, y - 44, 300, 18 )

    draw.SimpleText( config.health_text, 'ui.40', x - 1270, y - 43, config.text )
    draw.SimpleText( HP .. '%', 'ui.40', x - 1012, y - 43, config.text )
    
    draw.RoundedBox( config.Radius, x - 1275, y - 22, 300, 18, config.basecolor )
    draw.RoundedBox( config.Radius, x - 1275, y - 22, AR * 3.0, 18, config.armor )
    surface.SetDrawColor( config.Outlined )
    surface.DrawOutlinedRect( x - 1275, y - 22, 300, 18 )

    draw.SimpleText( config.armor_text , 'ui.40', x - 1270, y - 21, config.text )
    draw.SimpleText( AR .. '%', 'ui.40', x - 1012, y - 21, config.text )    

    draw.SimpleText( LocalPlayer():getDarkRPVar( 'job' ) .. ' ( $' .. LocalPlayer():getDarkRPVar( 'money' ) .. ' + $' .. LocalPlayer():getDarkRPVar( 'salary' ) .. ' )' , 'ui.39', x - 1275, y - 65, config.text )

    sin = (math.sin(CurTime()) + 1) / 2
    if GetGlobalBool("DarkRP_LockDown") then

        draw.RoundedBox( config.Radius, x - 820, y - 790, 300, 18, config.basecolor )
        surface.SetDrawColor( Color( 255, sin * 255, sin * 255 ) )
        surface.DrawOutlinedRect( x - 820, y - 790, 300, 18 ) 
        draw.SimpleText( config.lockdown_text ,"ui.39", x - 800, y - 790, Color( 255, sin * 255, sin * 255 ) )       

    end

    local ply = LocalPlayer()

    if ply:Alive() and IsValid(ply) then
        if ply:GetActiveWeapon():IsValid() then
            if (ply:GetActiveWeapon():Clip1() !=-1 and ply:GetActiveWeapon():GetClass() ~= "weapon_physcannon") then
   
                ammo1 = ply:GetActiveWeapon():Clip1()
                ammo2 = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())

                draw.RoundedBox( config.Radius, x - 970, y - 39, 105, 35, config.basecolor )
                surface.SetDrawColor( config.Outlined )
                surface.DrawOutlinedRect( x - 970, y - 39, 105, 35 )
                
                draw.SimpleText( ammo1 .. "/" .. ammo2, "ui.38", x - 950, y - 32, config.text )
            end
        end
    end

end

hook.Add( "HUDPaint", 'hud_main', hud_main )

local hidden = { "DarkRP_HUD", "DarkRP_Hungermod", "CHudHealth", "CHudAmmo", "DarkRP_Agenda" }

hook.Add("HUDShouldDraw", "CHUD_Hide", function(name)
    if table.HasValue(hidden, name) || name == "CHudAmmo" && Config.ShowAmmoCircle then return false end
end)

function hidehud(name)
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", })do
        if name == v then return false end
    end
end
hook.Add("HUDShouldDraw", "HideOurHud", hidehud)
