{
if (typeof AUIPlugin === "undefined") window.AUIPlugin = {};


AUIPlugin.AUIGridCutImageDialog = JavaScript.Class(undefined, {
	HideDialog : function() {
		if (this._dialog !== undefined) {
			this._dialog.visible = false;
		}
	},
	ShowDialog : function(path) {
		if (this._dialog === undefined) {
			this._dialog = AUIPlugin.g_Control.CreateControl("aui_image_grid_cut_dialog", this);
			A_LayerManager.AddToModal(this._dialog);
			this._cut_width.text = 32;
			this._cut_height.text = 32;
			this._name_prefix.text = "cut_";
		}
		this._image_path = path;
		this._dialog.visible = true;
	},
	Shutdown : function() {
		if (this._dialog !== undefined) {
			A_LayerManager.RemoveFromModal(this._dialog);
			this._dialog = undefined;
		}
	},
	HandleSelectSaveClick : function(event) {
		if (event.path === undefined || event.path === "") {
			return;
		}
		this._save_path.text = event.path;
	},
	HandleCancelClick : function(event) {
		this.HideDialog();
	},
	HandleConfirmClick : function(event) {
		let width = ALittle.Math_ToInt(this._cut_width.text);
		let height = ALittle.Math_ToInt(this._cut_height.text);
		if (width === undefined || height <= 0 || height === undefined || height <= 0) {
			g_AUITool.ShowNotice("提示", "请输入有效的宽和高");
			return;
		}
		let attr = ALittle.File_GetFileAttr(this._save_path.text);
		if (attr === undefined || !attr.directory) {
			g_AUITool.ShowNotice("提示", "请输入有效的保存路径");
			return;
		}
		let save_path = ALittle.File_PathEndWithSplit(this._save_path.text);
		let name_prefix = this._name_prefix.text;
		let surface = carp.LoadCarpSurface(this._image_path);
		if (surface === undefined) {
			g_AUITool.ShowNotice("提示", "图片加载失败");
			return;
		}
		let total_width = carp.GetCarpSurfaceWidth(surface);
		let total_height = carp.GetCarpSurfaceHeight(surface);
		let index = 0;
		let offset_y = 0;
		while (offset_y < total_height) {
			let real_height = total_height - offset_y;
			if (real_height > height) {
				real_height = height;
			}
			let offset_x = 0;
			while (offset_x < total_width) {
				let real_width = total_width - offset_x;
				if (real_width > width) {
					real_width = width;
				}
				let sub_surface = carp.CreateCarpSurface(real_width, real_height);
				if (sub_surface !== undefined) {
					carp.CutBlitCarpSurface(surface, sub_surface, offset_x + "," + offset_y + "," + real_width + "," + real_height, "0,0," + real_width + "," + real_height);
					carp.SaveCarpSurface(sub_surface, save_path + name_prefix + index + ".png");
					carp.FreeCarpSurface(sub_surface);
					++ index;
				}
				offset_x = offset_x + (real_width);
			}
			offset_y = offset_y + (real_height);
		}
		carp.FreeCarpSurface(surface);
		this.HideDialog();
	},
}, "AUIPlugin.AUIGridCutImageDialog");

}