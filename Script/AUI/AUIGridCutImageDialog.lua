-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.AUIPlugin == nil then _G.AUIPlugin = {} end
local AUIPlugin = AUIPlugin
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


AUIPlugin.AUIGridCutImageDialog = Lua.Class(nil, "AUIPlugin.AUIGridCutImageDialog")

function AUIPlugin.AUIGridCutImageDialog:HideDialog()
	if self._dialog ~= nil then
		self._dialog.visible = false
	end
end

function AUIPlugin.AUIGridCutImageDialog:ShowDialog(path)
	if self._dialog == nil then
		self._dialog = AUIPlugin.g_Control:CreateControl("aui_image_grid_cut_dialog", self)
		A_LayerManager:AddToModal(self._dialog)
		self._cut_width.text = 32
		self._cut_height.text = 32
		self._name_prefix.text = "cut_"
	end
	self._image_path = path
	self._dialog.visible = true
end

function AUIPlugin.AUIGridCutImageDialog:Shutdown()
	if self._dialog ~= nil then
		A_LayerManager:RemoveFromModal(self._dialog)
		self._dialog = nil
	end
end

function AUIPlugin.AUIGridCutImageDialog:HandleSelectSaveClick(event)
	if event.path == nil or event.path == "" then
		return
	end
	self._save_path.text = event.path
end

function AUIPlugin.AUIGridCutImageDialog:HandleCancelClick(event)
	self:HideDialog()
end

function AUIPlugin.AUIGridCutImageDialog:HandleConfirmClick(event)
	local width = ALittle.Math_ToInt(self._cut_width.text)
	local height = ALittle.Math_ToInt(self._cut_height.text)
	if width == nil or height <= 0 or height == nil or height <= 0 then
		g_AUITool:ShowNotice("提示", "请输入有效的宽和高")
		return
	end
	local attr = ALittle.File_GetFileAttr(self._save_path.text)
	if attr == nil or not attr.directory then
		g_AUITool:ShowNotice("提示", "请输入有效的保存路径")
		return
	end
	local save_path = ALittle.File_PathEndWithSplit(self._save_path.text)
	local name_prefix = self._name_prefix.text
	local surface = carp.LoadCarpSurface(self._image_path)
	if surface == nil then
		g_AUITool:ShowNotice("提示", "图片加载失败")
		return
	end
	local total_width = carp.GetCarpSurfaceWidth(surface)
	local total_height = carp.GetCarpSurfaceHeight(surface)
	local index = 0
	local offset_y = 0
	while offset_y < total_height do
		local real_height = total_height - offset_y
		if real_height > height then
			real_height = height
		end
		local offset_x = 0
		while offset_x < total_width do
			local real_width = total_width - offset_x
			if real_width > width then
				real_width = width
			end
			local sub_surface = carp.CreateCarpSurface(real_width, real_height)
			if sub_surface ~= nil then
				carp.CutBlitCarpSurface(surface, sub_surface, offset_x .. "," .. offset_y .. "," .. real_width .. "," .. real_height, "0,0," .. real_width .. "," .. real_height)
				carp.SaveCarpSurface(sub_surface, save_path .. name_prefix .. index .. ".png")
				carp.FreeCarpSurface(sub_surface)
				index = index + 1
			end
			offset_x = offset_x + (real_width)
		end
		offset_y = offset_y + (real_height)
	end
	carp.FreeCarpSurface(surface)
	self:HideDialog()
end

end