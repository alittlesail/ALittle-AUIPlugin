-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.AUIPlugin == nil then _G.AUIPlugin = {} end
local AUIPlugin = AUIPlugin
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


function AUIPlugin.__Browser_Setup(layer_group, control, module_base_path, script_base_path, debug)
end
AUIPlugin.__Browser_Setup = Lua.CoWrap(AUIPlugin.__Browser_Setup)

function AUIPlugin.__Browser_AddModule(module_name, layer_group, module_info)
end

function AUIPlugin.__Browser_Shutdown()
end

AUIPlugin.g_Control = nil
AUIPlugin.g_ModuleBasePath = nil
AUIPlugin.g_ScriptBasePath = nil
function AUIPlugin.__Module_Setup(layer_group, control, module_base_path, script_base_path, debug)
end
AUIPlugin.__Module_Setup = Lua.CoWrap(AUIPlugin.__Module_Setup)

function AUIPlugin.__Module_Shutdown()
end

function AUIPlugin.__Module_GetInfo(control, module_base_path, script_base_path)
	return nil
end

function AUIPlugin.__Plugin_Setup(control, module_base_path, script_base_path)
	local ___COROUTINE = coroutine.running()
	AUIPlugin.g_Control = control
	AUIPlugin.g_ModuleBasePath = module_base_path
	AUIPlugin.g_ScriptBasePath = script_base_path
	if ALittle.System_GetPlatform() == "Windows" then
		package.cpath = package.cpath .. ";./" .. module_base_path .. "Other/?.dll"
		require("alanguage")
		require("abnf")
		require("alittlescript")
		require("memory")
		require("protobuf")
		require("socket")
	end
	local require = ALittle.Require()
	require:AddPaths(script_base_path, "Protobuf/", {{"Lua/ISocket"}
		,{"Lua/LuaProtobufSchedule"}})
	require:AddPaths(script_base_path, "AUI/", {{"AUIDrawingBoard"}
		,{"AUIEditImageDialog"}
		,{"AUIFileRemoteSelectLayout"}
		,{"AUIFileSelectDialog"}
		,{"AUIFileSelectLayout"}
		,{"AUIFileTreeLayout"}
		,{"AUIGridCutImageDialog"}
		,{"AUIIMEManager"}
		,{"AUIImageCutPlugin"}
		,{"AUIRightMenu"}
		,{"AUIStatLayout"}
		,{"AUITool"}
		,{"AUIVersionManager"}
		,{"AUIWebLoginManager"}})
	require:AddPaths(script_base_path, "AUICodeEdit/", {{"ABnf/AUICodeABnf","AUICodeLanguage","AUICodeProject"}
		,{"ABnf/AUICodeALittleScript","AUICodeLanguage","AUICodeProject"}
		,{"ABnf/AUICodeCommon","AUICodeLanguage","AUICodeProject"}
		,{"AUICodeCompleteScreen"}
		,{"AUICodeComponent"}
		,{"AUICodeCursor"}
		,{"AUICodeDefine"}
		,{"AUICodeEdit"}
		,{"AUICodeFilterScreen"}
		,{"AUICodeLanguage"}
		,{"AUICodeLineContainer"}
		,{"AUICodeLineNumber"}
		,{"AUICodeParamList"}
		,{"AUICodeProject"}
		,{"AUICodeRevocation"}
		,{"AUICodeSelectCursor"}})
	require:Start()
	AUIPlugin.g_AUIIMEManager:Setup()
end

function AUIPlugin.__Plugin_Shutdown()
	AUIPlugin.g_AUIIMEManager:Shutdown()
	g_AUITool:Shutdown()
	g_AUICodeFilterScreen:Shutdown()
	AUIPlugin.AUICodeProject.Shutdown()
end

end