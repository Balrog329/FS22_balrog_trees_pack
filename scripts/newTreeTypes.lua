-- LP and BMP

addTreeTypes = {}

local modDir = g_currentModDirectory
local modName = g_currentModName

function addTreeTypes.loadDefaultTypes(self, superFunc, missionInfo, baseDirectory)
    -- Call the original function to load default tree types
    superFunc(self, missionInfo, baseDirectory)

    -- Load the custom tree types XML file
    local xmlFile = loadXMLFile("treeTypes", modDir .. "maps_treeTypes.xml")
    g_treePlantManager:loadTreeTypes(xmlFile, missionInfo, modDir, false)

    -- Clean up
    delete(xmlFile)
end

TreePlantManager.loadDefaultTypes = Utils.overwrittenFunction(TreePlantManager.loadDefaultTypes, addTreeTypes.loadDefaultTypes)