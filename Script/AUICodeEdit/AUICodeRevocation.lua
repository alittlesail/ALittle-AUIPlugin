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
ALittle.RegStruct(958494922, "ALittle.UIChangedEvent", {
name = "ALittle.UIChangedEvent", ns_name = "ALittle", rl_name = "UIChangedEvent", hash_code = 958494922,
name_list = {"target"},
type_list = {"ALittle.DisplayObject"},
option_map = {}
})

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeDeleteLeftRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeDeleteLeftRevoke")

function AUIPlugin.AUICodeDeleteLeftRevoke:Ctor(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line", old_it_line)
	___rawset(self, "_old_it_char", old_it_char)
	___rawset(self, "_new_it_line", new_it_line)
	___rawset(self, "_new_it_char", new_it_char)
	___rawset(self, "_content", content)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeDeleteLeftRevoke:Forward()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._old_it_line, self._old_it_char)
	self._edit.cursor:DeleteLeft(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeDeleteLeftRevoke:Back()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._new_it_line, self._new_it_char)
	self._edit:InsertText(self._content, false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeDeleteRightRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeDeleteRightRevoke")

function AUIPlugin.AUICodeDeleteRightRevoke:Ctor(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line", old_it_line)
	___rawset(self, "_old_it_char", old_it_char)
	___rawset(self, "_new_it_line", new_it_line)
	___rawset(self, "_new_it_char", new_it_char)
	___rawset(self, "_content", content)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeDeleteRightRevoke:Forward()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._old_it_line, self._old_it_char)
	self._edit.cursor:DeleteRight(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeDeleteRightRevoke:Back()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._new_it_line, self._new_it_char)
	self._edit:InsertText(self._content, false)
	self._edit.cursor:SetLineChar(self._new_it_line, self._new_it_char)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeInsertTextRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeInsertTextRevoke")

function AUIPlugin.AUICodeInsertTextRevoke:Ctor(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line", old_it_line)
	___rawset(self, "_old_it_char", old_it_char)
	___rawset(self, "_new_it_line", new_it_line)
	___rawset(self, "_new_it_char", new_it_char)
	___rawset(self, "_content", content)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeInsertTextRevoke:Forward()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._old_it_line, self._old_it_char)
	self._edit:InsertText(self._content, false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeInsertTextRevoke:Back()
	self._edit.select_cursor:StartLineChar(self._old_it_line, self._old_it_char)
	self._edit.select_cursor:UpdateLineChar(self._new_it_line, self._new_it_char)
	self._edit.select_cursor:DeleteSelect(false)
	self._edit.cursor:SetLineChar(self._old_it_line, self._old_it_char)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeDeleteSelectRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeDeleteSelectRevoke")

function AUIPlugin.AUICodeDeleteSelectRevoke:Ctor(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line, new_it_char, content, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line_start", old_it_line_start)
	___rawset(self, "_old_it_char_start", old_it_char_start)
	___rawset(self, "_old_it_line_end", old_it_line_end)
	___rawset(self, "_old_it_char_end", old_it_char_end)
	___rawset(self, "_new_it_line", new_it_line)
	___rawset(self, "_new_it_char", new_it_char)
	___rawset(self, "_content", content)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeDeleteSelectRevoke:Forward()
	self._edit.select_cursor:StartLineChar(self._old_it_line_start, self._old_it_char_start)
	self._edit.select_cursor:UpdateLineChar(self._old_it_line_end, self._old_it_char_end)
	self._edit.select_cursor:DeleteSelect(false)
	self._edit.cursor:SetLineChar(self._new_it_line, self._new_it_char)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeDeleteSelectRevoke:Back()
	self._edit.select_cursor:Hide()
	self._edit.cursor:SetLineChar(self._new_it_line, self._new_it_char)
	self._edit:InsertText(self._content, false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeMultiTabInsertRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeMultiTabInsertRevoke")

function AUIPlugin.AUICodeMultiTabInsertRevoke:Ctor(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line_start, new_it_char_start, new_it_line_end, new_it_char_end, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line_start", old_it_line_start)
	___rawset(self, "_old_it_char_start", old_it_char_start)
	___rawset(self, "_old_it_line_end", old_it_line_end)
	___rawset(self, "_old_it_char_end", old_it_char_end)
	___rawset(self, "_new_it_line_start", new_it_line_start)
	___rawset(self, "_new_it_char_start", new_it_char_start)
	___rawset(self, "_new_it_line_end", new_it_line_end)
	___rawset(self, "_new_it_char_end", new_it_char_end)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeMultiTabInsertRevoke:Forward()
	self._edit.select_cursor:StartLineChar(self._old_it_line_start, self._old_it_char_start)
	self._edit.select_cursor:UpdateLineChar(self._old_it_line_end, self._old_it_char_end)
	self._edit:MultiTabInsert(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeMultiTabInsertRevoke:Back()
	self._edit.select_cursor:StartLineChar(self._new_it_line_start, self._new_it_char_start)
	self._edit.select_cursor:UpdateLineChar(self._new_it_line_end, self._new_it_char_end)
	self._edit:MultiTabDelete(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
AUIPlugin.AUICodeMultiTabDeleteRevoke = Lua.Class(ALittle.RevokeObject, "AUIPlugin.AUICodeMultiTabDeleteRevoke")

function AUIPlugin.AUICodeMultiTabDeleteRevoke:Ctor(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line_start, new_it_char_start, new_it_line_end, new_it_char_end, dispatch_event)
	___rawset(self, "_edit", edit)
	___rawset(self, "_old_it_line_start", old_it_line_start)
	___rawset(self, "_old_it_char_start", old_it_char_start)
	___rawset(self, "_old_it_line_end", old_it_line_end)
	___rawset(self, "_old_it_char_end", old_it_char_end)
	___rawset(self, "_new_it_line_start", new_it_line_start)
	___rawset(self, "_new_it_char_start", new_it_char_start)
	___rawset(self, "_new_it_line_end", new_it_line_end)
	___rawset(self, "_new_it_char_end", new_it_char_end)
	___rawset(self, "_dispatch_event", dispatch_event)
end

function AUIPlugin.AUICodeMultiTabDeleteRevoke:Forward()
	self._edit.select_cursor:StartLineChar(self._old_it_line_start, self._old_it_char_start)
	self._edit.select_cursor:UpdateLineChar(self._old_it_line_end, self._old_it_char_end)
	self._edit:MultiTabDelete(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

function AUIPlugin.AUICodeMultiTabDeleteRevoke:Back()
	self._edit.select_cursor:StartLineChar(self._new_it_line_start, self._new_it_char_start)
	self._edit.select_cursor:UpdateLineChar(self._new_it_line_end, self._new_it_char_end)
	self._edit:MultiTabInsert(false)
	if self._dispatch_event then
		self._edit:DispatchEvent(___all_struct[958494922], {})
	end
	self._edit:FocusLineCharToCenter(self._edit.cursor.line, self._edit.cursor.char)
end

end