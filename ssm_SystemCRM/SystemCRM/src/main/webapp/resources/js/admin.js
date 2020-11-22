$(function() {

   //初始化选项卡面板
	$('#tabs').tabs({
		fit : true,
		border : false,
		onSelect : function(title) {
			// alert(title + ' is selected');
		}
	});

});

function addtabPane(e) {
	// alert(e.text);
	// console.log(e);
	// console.log(e.getAttribute('url'));
	if ($('#tabs').tabs('exists',e.text)) {
		$('#tabs').tabs('select', e.text);
	} else {
		var content = '<iframe scrolling="no" frameborder="0"  src="'+e.getAttribute('url')+'" style="width:100%;height:100%;"></iframe>';
	
		$('#tabs').tabs('add', {
			title : e.text,
			//iconCls : 'icon-reload',
			//动态的得到图标
			iconCls : e.getAttribute('iconCls'),
			closable : true,
			content:content
			//href : e.getAttribute('url')+'.jsp',
		});
	}

}