-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.AUIPlugin == nil then _G.AUIPlugin = {} end
local AUIPlugin = AUIPlugin
local Lua = Lua
local ALittle = ALittle
local ___rawset = rawset
local ___pairs = pairs
local ___ipairs = ipairs
local ___all_struct = ALittle.GetAllStruct()

ALittle.RegStruct(-1479093282, "ALittle.UIEvent", {
name = "ALittle.UIEvent", ns_name = "ALittle", rl_name = "UIEvent", hash_code = -1479093282,
name_list = {"target"},
type_list = {"ALittle.DisplayObject"},
option_map = {}
})
ALittle.RegStruct(1094428778, "AUIPlugin.AUIFileRemoteSelectItemInfo", {
name = "AUIPlugin.AUIFileRemoteSelectItemInfo", ns_name = "AUIPlugin", rl_name = "AUIFileRemoteSelectItemInfo", hash_code = 1094428778,
name_list = {"name","frame","file","dir","button"},
type_list = {"ALittle.DisplayObject","ALittle.DisplayObject","ALittle.Image","ALittle.Image","ALittle.TextRadioButton"},
option_map = {}
})
ALittle.RegStruct(-1017774550, "AUIPlugin.AUIFileRemoteSelectItemUserData", {
name = "AUIPlugin.AUIFileRemoteSelectItemUserData", ns_name = "AUIPlugin", rl_name = "AUIFileRemoteSelectItemUserData", hash_code = -1017774550,
name_list = {"path","directory"},
type_list = {"string","bool"},
option_map = {}
})
ALittle.RegStruct(-449066808, "ALittle.UIClickEvent", {
name = "ALittle.UIClickEvent", ns_name = "ALittle", rl_name = "UIClickEvent", hash_code = -449066808,
name_list = {"target","is_drag","count"},
type_list = {"ALittle.DisplayObject","bool","int"},
option_map = {}
})

assert(ALittle.DisplayLayout, " extends class:ALittle.DisplayLayout is nil")
AUIPlugin.AUIFileRemoteSelectLayout = Lua.Class(ALittle.DisplayLayout, "AUIPlugin.AUIFileRemoteSelectLayout")

function AUIPlugin.AUIFileRemoteSelectLayout:Ctor()
	___rawset(self, "_group", {})
end

function AUIPlugin.AUIFileRemoteSelectLayout:Init(ext_list)
	self._real_size = 100
	self._thread = nil
	self._base_path = nil
	self._real_path = nil
	if ext_list ~= nil then
		self._ext_map = {}
		for index, ext in ___ipairs(ext_list) do
			self._ext_map[ALittle.String_Upper(ext)] = true
		end
	end
end

function AUIPlugin.AUIFileRemoteSelectLayout:Release()
	if self._thread ~= nil then
		ALittle.Coroutine.Resume(self._thread, nil)
		self._thread = nil
	end
end

function AUIPlugin.AUIFileRemoteSelectLayout.__getter:base_path()
	return self._base_path
end

function AUIPlugin.AUIFileRemoteSelectLayout:ShowSelect()
	local ___COROUTINE = coroutine.running()
	self._thread = ___COROUTINE
	return coroutine.yield()
end

function AUIPlugin.AUIFileRemoteSelectLayout:System_SetVDragCursor(event)
	ALittle.System_SetVDragCursor()
end

function AUIPlugin.AUIFileRemoteSelectLayout:System_SetNormalCursor(event)
	ALittle.System_SetNormalCursor()
end

function AUIPlugin.AUIFileRemoteSelectLayout:System_SetHDragCursor(event)
	ALittle.System_SetHDragCursor()
end

function AUIPlugin.AUIFileRemoteSelectLayout:System_SetHVDragCursor(event)
	ALittle.System_SetHVDragCursor()
end

function AUIPlugin.AUIFileRemoteSelectLayout:CreateFileItem(file_name, rel_path, abs_path)
	local ext = ALittle.File_GetFileExtByPath(file_name)
	if self._ext_map ~= nil then
		ext = ALittle.String_Upper(ext)
		if self._ext_map[ext] == nil then
			return nil
		end
	end
	local info = {}
	local item = AUIPlugin.g_Control:CreateControl("file_remote_select_item", info)
	info.name.text = file_name
	info.dir.visible = false
	info.file.visible = true
	info.button.drag_trans_target = self._scroll_list
	info.button:AddEventListener(___all_struct[-449066808], self, self.HandleItemClick)
	info.button.group = self._group
	local user_data = {}
	user_data.path = rel_path
	user_data.directory = false
	info.button._user_data = user_data
	item._user_data = user_data
	return item
end

function AUIPlugin.AUIFileRemoteSelectLayout:CreateDirItem(file_name, rel_path, abs_path)
	local info = {}
	local item = AUIPlugin.g_Control:CreateControl("file_remote_select_item", info)
	info.name.text = file_name
	info.file.visible = false
	info.dir.visible = true
	info.button.drag_trans_target = self._scroll_list
	info.button:AddEventListener(___all_struct[-449066808], self, self.HandleItemClick)
	info.button.group = self._group
	local user_data = {}
	user_data.path = rel_path
	user_data.directory = true
	info.button._user_data = user_data
	item._user_data = user_data
	return item
end

function AUIPlugin.AUIFileRemoteSelectLayout:GetNameListByDir(browser_path)
	local ___COROUTINE = coroutine.running()
	return {}
end

function AUIPlugin.AUIFileRemoteSelectLayout:BrowserCollect(browser_path)
	local ___COROUTINE = coroutine.running()
	local item_list_dir = {}
	local item_list_img = {}
	local file_map = self:GetNameListByDir(browser_path)
	for file, info in ___pairs(file_map) do
		local path = browser_path .. "/" .. file
		local rel_path = ALittle.String_Sub(path, ALittle.String_Len(self._base_path) + 2)
		local attr = ALittle.File_GetFileAttr(path)
		if attr.directory then
			local item = self:CreateDirItem(file, rel_path, path)
			if item ~= nil then
				ALittle.List_Push(item_list_dir, item)
			end
		else
			local item = self:CreateFileItem(file, rel_path, path)
			if item ~= nil then
				ALittle.List_Push(item_list_img, item)
			end
		end
	end
	return item_list_dir, item_list_img
end

function AUIPlugin.AUIFileRemoteSelectLayout.ItemListCmp(a, b)
	local a_user_data = a._user_data
	local b_user_data = b._user_data
	return a_user_data.path < b_user_data.path
end

function AUIPlugin.AUIFileRemoteSelectLayout:CreateItemAndAddToList(item_list_dir, item_list_img)
	ALittle.List_Sort(item_list_dir, AUIPlugin.AUIFileRemoteSelectLayout.ItemListCmp)
	ALittle.List_Sort(item_list_img, AUIPlugin.AUIFileRemoteSelectLayout.ItemListCmp)
	local item_list = {}
	for index, item in ___ipairs(item_list_dir) do
		ALittle.List_Push(item_list, item)
	end
	for index, item in ___ipairs(item_list_img) do
		ALittle.List_Push(item_list, item)
	end
	local col_count = ALittle.Math_Floor(self._scroll_list.width / self._real_size)
	local remain_count = 0
	local container = nil
	for index, item in ___ipairs(item_list) do
		if remain_count == 0 then
			container = ALittle.Linear(AUIPlugin.g_Control)
			container.type = 1
			container.height = item.height
			self._scroll_list:AddChild(container)
			container:AddChild(item)
			remain_count = col_count - 1
		else
			remain_count = remain_count - 1
			container:AddChild(item)
		end
	end
end

function AUIPlugin.AUIFileRemoteSelectLayout:Refresh()
	self._scroll_list:RemoveAllChild()
	self._path_input.text = ALittle.String_Sub(self._real_path, ALittle.String_Len(self._base_path) + 2)
	local item_list_dir, item_list_img = self:BrowserCollect(self._real_path)
	self:CreateItemAndAddToList(item_list_dir, item_list_img)
end
AUIPlugin.AUIFileRemoteSelectLayout.Refresh = Lua.CoWrap(AUIPlugin.AUIFileRemoteSelectLayout.Refresh)

function AUIPlugin.AUIFileRemoteSelectLayout:SetPath(base_path, rel_path)
	if base_path ~= nil and rel_path ~= nil then
		local attr = ALittle.File_GetFileAttr(base_path .. "/" .. rel_path)
		if attr == nil or attr.directory ~= true then
			g_AUITool:ShowNotice("错误", "无效路径")
			return false
		end
	end
	self._base_path = base_path
	self._real_path = base_path
	if rel_path ~= nil and rel_path ~= "" then
		self._real_path = self._real_path .. "/" .. rel_path
	end
	if self._base_path ~= nil then
		self:Refresh()
	else
		self._scroll_list:RemoveAllChild()
	end
	return true
end

function AUIPlugin.AUIFileRemoteSelectLayout:SetBasePath(base_path)
	if self._base_path == base_path then
		return true
	end
	return self:SetPath(base_path, "")
end

function AUIPlugin.AUIFileRemoteSelectLayout:HandleSetPathClick(event)
	self:SetPath(self._base_path, self._path_input.text)
end

function AUIPlugin.AUIFileRemoteSelectLayout:HandleSetPrePathClick(event)
	local rel_path = ALittle.String_Sub(self._real_path, ALittle.String_Len(self._base_path) + 2)
	if rel_path == "" then
		return
	end
	self:SetPath(self._base_path, ALittle.File_GetFilePathByPath(rel_path))
end

function AUIPlugin.AUIFileRemoteSelectLayout:HandleItemClick(event)
	local user_data = event.target._user_data
	if user_data.directory then
		self._real_path = self._base_path .. "/" .. user_data.path
		self:Refresh()
	end
end

function AUIPlugin.AUIFileRemoteSelectLayout:CheckResourceName(name)
	local len = ALittle.String_Len(name)
	if len == 0 then
		return false, "命名只能支持字母数字下划线"
	end
	local i = 1
	while true do
		if not(i <= len) then break end
		local byte = ALittle.String_Byte(name, i)
		local check_all = byte >= 65 and byte <= 90 or byte >= 97 and byte <= 122 or byte >= 48 and byte <= 57 or byte == 95
		if check_all == false then
			return false, "命名只能支持字母数字下划线"
		end
		i = i+(1)
	end
	return true, nil
end

end