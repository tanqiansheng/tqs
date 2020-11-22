/**
 * Created by Administrator on 2018/11/7.
 */

$(function() {

	// 初始化分页表格
	$('#dg').datagrid({
		url: 'jsondata/userData.json',
		//读取本地json文件，必须使用设置为get请求模式,
		method: 'get', //这个是最重要的，不写这个table加载不出来
		// title : '用户表',
		fitColumns: true,
		columns: [
			[
				{
					field: 'id',
					title: 'id',
					width: 100,
					checkbox: true,
				}, 
				{
					field: 'cid',
					title: '客户id',
					width: 100,
					checkbox: true,
				}, 
				{
					field: 'uid',
					title: '用户id',
					width: 100,
					checkbox: true,
				}, 
				{
					field: 'name',
					title: '姓名',
					width: 100,
					checkbox: true,
				}, 
				
				{
					field: 'country',
					title: '国家',
					width: 100,

				},
				{
					field: 'url',
					title: '地址',
					width: 100,
				},
				{
					field: 'email',
					title: '邮箱',
					width: 100,

				},
				{
					field: 'phone',
					title: '电话',
					width: 100,
				},
				{
					field: 'fax',
					title: '传真',
					width: 100,
				},
				{
					field: 'other',
					title: '其他联系方式',
					width: 100,
				},
				{
					field: 'remark1',
					title: '备注1',
					width: 100,

				},{
					field: 'remark1',
					title: '备注1',
					width: 100,

				},
				{
					field: 'remark2',
					title: '备注2',
					width: 100,
				
				},	
				{
					field: 'remark3',
					title: '备注3',
					width: 100,

				},
				{
					field: 'createdate',
					title: '最近更近时间',
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
});





// 修改用户
function updateUser() {
	//得到要修改的一行
	var row = $('#dg').datagrid('getSelected');
	if (row) {
		$('#dlg').dialog('open').dialog('setTitle', '编辑');
		//把选中的一行加载到
		$('#fm').form('load', row);
	}

}





// 添加用户
function addUser() {
	//编号设置不可修改
	$('#txtid').attr('disabled', false);
	$('#dlg').dialog('open').dialog('setTitle', '新增');
	$('#fm').form('clear');


}

// 保存按钮 动作
function saveUser() {
	var operation = '';
	// console.log($('#dlg').panel('options'));
	if (($('#dlg').panel('options').title) == '编辑') {
		operation = 'update';
	} else {
		operation = 'add';
	}

	$('#fm').form('submit', {
		url: 'UserServlet?operation=' + operation,
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(result) {
			var result = eval('(' + result + ')');
			if (result.errorMsg) {
				$.messager.show({
					title: 'Error',
					msg: result.errorMsg
				});
			} else {
				$('#dlg').dialog('close'); // close the dialog
				$('#dg').datagrid('reload'); // reload the user data
			}
		}
	});

}





function deleteUser() {
	var rows = $('#dg').datagrid('getSelections');
	if (rows.length > 0) {
		$.messager.confirm('确认操作', '你真的要删除当前选中的条记录吗?', function(r) {
			if (r) {
				// 得到删除的的记录id
				var ids = [];
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].tid);
				}
				// Ajax请求
				$.post('UserAction', {
					operation: 'delete',
					ids: ids.join(','),
				}, function(result) {
					console.log(result);
					if (result.success) {
						$('#dg').datagrid('reload'); // reload the
						// user data
					} else {
						$.messager.show({ // show error message
							title: 'Error',
							msg: result.errorMsg
						});
					}
				}, 'json');
			}
		});
	}
}

// 查询
function findPage() {
	// 添加多项查询条件选项
	var p = new Object();
	if ($.trim($('input[name="userName"]').val()) != "") {
		p['name'] = $.trim($('input[name="userName"]').val());
	}

	alert(p);
	$('#dg').datagrid('load', p);

}
