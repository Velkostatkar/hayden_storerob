function Draw3DText(coords,textInput,fontId,scaleX,scaleY)
    local pCoords = GetGameplayCamCoords()
    local npcCoords = coords
    local dist = #(pCoords - npcCoords) 
    local scale = (1/dist)*10
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(npcCoords[1],npcCoords[2],npcCoords[3]+2.3, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end