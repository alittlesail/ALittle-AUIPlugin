{
if (typeof AUIPlugin === "undefined") window.AUIPlugin = {};
let ___all_struct = ALittle.GetAllStruct();

ALittle.RegStruct(-1479093282, "ALittle.UIEvent", {
name : "ALittle.UIEvent", ns_name : "ALittle", rl_name : "UIEvent", hash_code : -1479093282,
name_list : ["target"],
type_list : ["ALittle.DisplayObject"],
option_map : {}
})
ALittle.RegStruct(958494922, "ALittle.UIChangedEvent", {
name : "ALittle.UIChangedEvent", ns_name : "ALittle", rl_name : "UIChangedEvent", hash_code : 958494922,
name_list : ["target"],
type_list : ["ALittle.DisplayObject"],
option_map : {}
})

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeDeleteLeftRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event) {
		this._edit = edit;
		this._old_it_line = old_it_line;
		this._old_it_char = old_it_char;
		this._new_it_line = new_it_line;
		this._new_it_char = new_it_char;
		this._content = content;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._old_it_line, this._old_it_char);
		this._edit.cursor.DeleteLeft(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._new_it_line, this._new_it_char);
		this._edit.InsertText(this._content, false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeDeleteLeftRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeDeleteRightRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event) {
		this._edit = edit;
		this._old_it_line = old_it_line;
		this._old_it_char = old_it_char;
		this._new_it_line = new_it_line;
		this._new_it_char = new_it_char;
		this._content = content;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._old_it_line, this._old_it_char);
		this._edit.cursor.DeleteRight(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._new_it_line, this._new_it_char);
		this._edit.InsertText(this._content, false);
		this._edit.cursor.SetLineChar(this._new_it_line, this._new_it_char);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeDeleteRightRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeInsertTextRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line, old_it_char, new_it_line, new_it_char, content, dispatch_event) {
		this._edit = edit;
		this._old_it_line = old_it_line;
		this._old_it_char = old_it_char;
		this._new_it_line = new_it_line;
		this._new_it_char = new_it_char;
		this._content = content;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._old_it_line, this._old_it_char);
		this._edit.InsertText(this._content, false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.StartLineChar(this._old_it_line, this._old_it_char);
		this._edit.select_cursor.UpdateLineChar(this._new_it_line, this._new_it_char);
		this._edit.select_cursor.DeleteSelect(false);
		this._edit.cursor.SetLineChar(this._old_it_line, this._old_it_char);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeInsertTextRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeDeleteSelectRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line, new_it_char, content, dispatch_event) {
		this._edit = edit;
		this._old_it_line_start = old_it_line_start;
		this._old_it_char_start = old_it_char_start;
		this._old_it_line_end = old_it_line_end;
		this._old_it_char_end = old_it_char_end;
		this._new_it_line = new_it_line;
		this._new_it_char = new_it_char;
		this._content = content;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.StartLineChar(this._old_it_line_start, this._old_it_char_start);
		this._edit.select_cursor.UpdateLineChar(this._old_it_line_end, this._old_it_char_end);
		this._edit.select_cursor.DeleteSelect(false);
		this._edit.cursor.SetLineChar(this._new_it_line, this._new_it_char);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.Hide();
		this._edit.cursor.SetLineChar(this._new_it_line, this._new_it_char);
		this._edit.InsertText(this._content, false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeDeleteSelectRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeMultiTabInsertRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line_start, new_it_char_start, new_it_line_end, new_it_char_end, dispatch_event) {
		this._edit = edit;
		this._old_it_line_start = old_it_line_start;
		this._old_it_char_start = old_it_char_start;
		this._old_it_line_end = old_it_line_end;
		this._old_it_char_end = old_it_char_end;
		this._new_it_line_start = new_it_line_start;
		this._new_it_char_start = new_it_char_start;
		this._new_it_line_end = new_it_line_end;
		this._new_it_char_end = new_it_char_end;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.StartLineChar(this._old_it_line_start, this._old_it_char_start);
		this._edit.select_cursor.UpdateLineChar(this._old_it_line_end, this._old_it_char_end);
		this._edit.MultiTabInsert(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.StartLineChar(this._new_it_line_start, this._new_it_char_start);
		this._edit.select_cursor.UpdateLineChar(this._new_it_line_end, this._new_it_char_end);
		this._edit.MultiTabDelete(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeMultiTabInsertRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
AUIPlugin.AUICodeMultiTabDeleteRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(edit, old_it_line_start, old_it_char_start, old_it_line_end, old_it_char_end, new_it_line_start, new_it_char_start, new_it_line_end, new_it_char_end, dispatch_event) {
		this._edit = edit;
		this._old_it_line_start = old_it_line_start;
		this._old_it_char_start = old_it_char_start;
		this._old_it_line_end = old_it_line_end;
		this._old_it_char_end = old_it_char_end;
		this._new_it_line_start = new_it_line_start;
		this._new_it_char_start = new_it_char_start;
		this._new_it_line_end = new_it_line_end;
		this._new_it_char_end = new_it_char_end;
		this._dispatch_event = dispatch_event;
	},
	Forward : function() {
		this._edit.select_cursor.StartLineChar(this._old_it_line_start, this._old_it_char_start);
		this._edit.select_cursor.UpdateLineChar(this._old_it_line_end, this._old_it_char_end);
		this._edit.MultiTabDelete(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
	Back : function() {
		this._edit.select_cursor.StartLineChar(this._new_it_line_start, this._new_it_char_start);
		this._edit.select_cursor.UpdateLineChar(this._new_it_line_end, this._new_it_char_end);
		this._edit.MultiTabInsert(false);
		if (this._dispatch_event) {
			this._edit.DispatchEvent(___all_struct.get(958494922), {});
		}
		this._edit.FocusLineCharToCenter(this._edit.cursor.line, this._edit.cursor.char);
	},
}, "AUIPlugin.AUICodeMultiTabDeleteRevoke");

}