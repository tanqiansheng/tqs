/**
 * Created by Administrator on 2018/11/7.
 */

$(function() {
	reloadUser('/SystemCRM/getPageUsers')


});




// 修改用户
function updateUser() {
	var rows = $('#dg').datagrid('getSelections');
	//得到要修改的一行
	var row = $('#dg').datagrid('getSelected');
	if(rows.length !=1){
		layer.msg("请只选择一个进行操作！");
		return false;
	}
		
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '编辑');
		//把选中的一行加载到
		$('#fm').form('load', row);
	}

}





// 添加用户
function addUser() {
	//编号设置不可修改
//	$('#txtid').attr('disabled', false);
	$('#dlg').dialog('open').dialog('setTitle', '新增');
	$('#fm').form('clear');
	
}

// 保存按钮的动作
function saveUser() {
	var operation = '';
	// console.log($('#dlg').panel('options'));
	if (($('#dlg').panel('options').title) == '编辑') {
		operation = 'updateUser';
		
	} else {
		operation = 'addUser';
	}

	$('#fm').form('submit', {
		url: '/SystemCRM/user/' + operation,
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(res) {
			var res = eval("(" + res +")");
			//JSON.parse()
			if (res.message) {
				$.messager.show({
					title: 'Error',
					msg: res.message
				});
			} else {
				layer.msg("操作成功");
				$('#dlg').dialog('close'); // close the dialog
				$('#dg').datagrid('reload'); // reload the user data
			}
		}
	});

}





function deleteUser() {
	var rows = $('#dg').datagrid('getSelections');
	if( rows.length==0){
		layer.msg("请至少选择一个进行操作！");
		return false;
	}
	if (rows.length > 0) {
		$.messager.confirm('确认操作', '你真的要删除当前选中的条记录吗?', function(r) {
			if (r) {
				// 得到删除的的记录id
				var ids = [];
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].uid);
				}
		
				// Ajax请求
				$.post('/SystemCRM/user/deleteUser',
					{"ids":ids
				},
					//operation: 'delete'
				
				function(res) {
					/*var res = ++("(" + res +")");*/
					//var res=JSON.parse(res);
					console.log(res);
					if (res.result=="SUCCESS") {
						layer.msg("操作成功");
						$('#dlg').dialog('close'); // close the dialog
						$('#dg').datagrid('reload'); // reload the user data
					} else {
						$.messager.show({ // show error message
							title: 'Error',
							msg: res.message
						});
					}
				});
			}
		});
	}
}

// 查询
function findPage() {
	// 添加多项查询条件选项
	//var p = new Object();
	var keyWord="";
	if ($.trim($('input[name="keyWord1"]').val()) != "") {
		//p['name'] = $.trim($('input[name="userName"]').val());
		keyWord = $.trim($("input[name='keyWord1']").val());
		
		var url='/SystemCRM//user/findByCombination?keyWord='+keyWord ;
		reloadUser(url);
		/*$.get(url,{'keyWord':keyWord},function(result){}
				)*/
	}

//	$('#dg').datagrid('load', keyWord);

	
	
}
function reloadUser(url) {
	// 初始化分页表格
	$('#dg').datagrid({
		//url: '/SystemCRM/getPageUsers',
		url: url,
		//读取本地json文件，必须使用设置为get请求模式,
		method: 'get', //这个是最重要的，不写这个table加载不出来
		// title : '用户表',
		fitColumns: true,
		columns: [
			[{
					field: 'uid',
					title: 'uid',
					width: 100,
					checkbox: true,
				}, {
					field: 'depId',
					title: '所属部门',
					width: 100,

				},
				{
					field: 'employeeId',
					title: '员工ID',
					width: 100,
				},
				{
					field: 'userName',
					title: '姓名',
					width: 100,

				},
				{
					field: 'userPwd',
					title: '密码',
					width: 100,
				},
				{
					field: 'createDate',
					title: '创建时间',
					width: 100,
				},
			
				{
					field: 'status',
					title: '状态',
					width: 100,
				}
			]
		],
		pagination: true,
		rownumbers: true,
		toolbar: '#tb',

	});

	// 初始化对话窗口
	$('#dlg').dialog({
		title: '用户窗口',
		closed: true,
		buttons: '#dlg-buttons',
		modal: true,
	});

	// 重新加载对话窗口
	$.parser.parse($("#dlg").parent());
	$('#txtid').attr('disabled', true);
	
	
};
