local function hud_main()

    local config = hud_main_config()

    local client = LocalPlayer()
    
    if !client:Alive() then
        return
    end

    local x = ScrW()
    local y = ScrH()

    local HP = LocalPlayer():Health()
    local AR = LocalPlayer():Armor()

    draw.RoundedBox( 0, x - 1275, y - 44, 300, 18, config.basecolor )
    draw.RoundedBox( 0, x - 1275, y - 44, HP * 3.0, 18, config.health )
    surface.SetDrawColor( config.text )
    surface.DrawOutlinedRect( x - 1275, y - 44, 300, 18 )

    draw.SimpleText( config.health_text, 'ui.40', x - 1270, y - 43, config.text )
    draw.SimpleText( HP .. '%', 'ui.40', x - 1012, y - 43, config.text )
    
    draw.RoundedBox( 0, x - 1275, y - 22, 300, 18, config.basecolor )
    draw.RoundedBox( 0, x - 1275, y - 22, AR * 3.0, 18, config.armor )
    surface.SetDrawColor( config.text )
    surface.DrawOutlinedRect( x - 1275, y - 22, 300, 18 )

    draw.SimpleText( config.armor_text , 'ui.40', x - 1270, y - 21, config.text )
    draw.SimpleText( AR .. '%', 'ui.40', x - 1012, y - 21, config.text )    

    draw.SimpleText( LocalPlayer():getDarkRPVar( 'job' ) .. ' ( $' .. LocalPlayer():getDarkRPVar( 'money' ) .. ' + $' .. LocalPlayer():getDarkRPVar( 'salary' ) .. ' )' , 'ui.39', x - 1275, y - 65, config.text )
    
    sin = (math.sin(CurTime()) + 1) / 2
    if GetGlobalBool("DarkRP_LockDown") then

        draw.RoundedBox( 0, x - 820, y - 790, 300, 18, config.basecolor )
        surface.SetDrawColor( Color( 255, sin * 255, sin * 255 ) )
        surface.DrawOutlinedRect( x - 820, y - 790, 300, 18 ) 
        draw.SimpleText( config.lockdown_text ,"ui.39", x - 800, y - 790, Color( 255, sin * 255, sin * 255 ) )       

    end

    if (client:GetActiveWeapon():Clip1() != -1) then
        draw.RoundedBox( 0, x - 970, y - 39, 120, 35, config.basecolor )
        surface.SetDrawColor( config.text )
        surface.DrawOutlinedRect( x - 970, y - 39, 120, 35 )
		draw.SimpleText( client:GetActiveWeapon():Clip1() .. ' / ' .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 'ui.38', x - 950, y - 32, config.text, 0 , 0 )
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