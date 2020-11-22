/**
 * Created by Administrator on 2018/11/7.
 */

$(function() {

	// 初始化分页表格
	$('#dg').datagrid({
		url: 'http://localhost:8080/SystemCRM/customer/list',
		//读取本地json文件，必须使用设置为get请求模式,
		method: 'get', //这个是最重要的，不写这个table加载不出来
		// title : '用户表',
		fitColumns: true,
		columns: [
			[{
				field: 'cid',
				title: '客户id',
				width: 100,
				checkbox: true,
			}, {
				field: 'uid',
				title: '用户_id',
				width: 100,

			}, {
				field: 'name',
				title: 'name',
				width: 100,

			}, {
				field: 'country',
				title: '国家',
				width: 100,

			}, {
				field: 'address',
				title: '客户地址',
				width: 100,

			}, {
				field: 'url',
				title: 'url',
				width: 100,

			},
			{
				field: 'email',
				title: '电子邮箱',
				width: 100,
			},
			{
				field: 'phone',
				title: '电话',
				width: 150,

			},
			{
				field: 'fax',
				title: '传真',
				width: 150,
			},
			{
				field: 'other',
				title: '其它联系方式',
				width: 150,

			},
			{
				field: 'industry',
				title: '行业',
				width: 150,

			},
			{
				field: 'annual_revenue',
				title: '年营业额',
				width: 100,

			},
			{
				field: 'bank_of_deposit',
				title: '开户银行',
				width: 100,

			},
			{
				field: 'bank_account',
				title: '银行帐号',
				width: 100,

			}
			,
			{
				field: 'create_time',
				title: '创建时间',
				width: 100,

			}
			,
			{
				field: 'update_time',
				title: '更新时间',
				width: 100,

			}
			,
			{
				field: 'last_time',
				title: '最近跟进时间',
				width: 100,

			}
			]
		],
		pagination: true,
		rownumbers: true,
		toolbar: '#tb',
		striped: true,
		loadMsg: "正在加载，请稍后",
		//pageSize: 5,
		//pageList: [5, 10, 15, 20]

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

// 修改
function update() {
	//得到要修改的一行
	var selectRows = $('#dg').datagrid('getSelected');

	// selectRows.sex 得到一个的某个值

	if (selectRows) {


		//员工号设置为只读，但又能提交到后台
		//$("#input_employeeId").attr("readonly",true);
		$('#input_employeeId').attr('disabled', false);
		//div隐藏
		$('#div_employeeId').show();

		//离职时间不可用
		$("#input_termDate").datebox({ disabled: false });
		$('#div_termDate').show();

		$('#dlg').dialog('open').dialog('setTitle', '编辑');






		//把选中的一行加载到
		$('#fm').form('load', selectRows);

		//处理加载下拉选项value

		//$('#input_departmentId').combobox('setValue',2);

		// var educationData;
		// var departmentData;
		// var positionData;
		// var statusData;
		// var sexData=[{"name":"女"},{"name":"男"}];

		//alert(   findFirstIndex( departmentData,selectRows.departmentId)  );

		// $('#input_departmentId').combobox('select',1)  ;


		$('#input_departmentId').combobox('select', findFirstIndex(departmentData, selectRows.departmentId));

		//$('#mname').combobox('setText', t.mname);


		// var xicx = $("#input_status").combobox("getValue");
		// 	var xicxt = $("#input_status").combobox("getText");
		// 	alert(xicx);
		// 	alert(xicxt);

	} else {
		$.messager.alert("系统提示", "请选择一条要修改的数据！");
	}

}





// 添加
function add() {
	//编号设置不可修改
	$('#input_employeeId').attr('disabled', true);
	//div隐藏
	//$('#div_employeeId').hide();

	//离职时间不可用
	$("#input_termDate").datebox({ disabled: true });
	//$('#div_termDate').hide();

	//$("#form_termDate").css("display","none");
	$('#dlg').dialog('open').dialog('setTitle', '新增');
	$('#fm').form('clear');
	$('#fm').form('resetDirty');

}

// 保存按钮的动作
function save() {
	var operation = '';
	// console.log($('#dlg').panel('options'));
	//新增还编辑
	if (($('#dlg').panel('options').title) == '编辑') {
		operation = 'update';
	} else {
		operation = 'add';
	}

	$('#fm').form('submit', {
		url: 'http://localhost:8080/SystemCRM/employee/' + operation,
		dirty: true,
		queryParams: { 'employeeId': $('#input_employeeId').textbox('getValue') },
		onSubmit: function(data) {
			//进行表单验证  如果返回false阻止提交  	

			/* 	$("#fm :input").change(
					function() {
						$("#fm").data("changed",true); 
						}
				); */

			//提交前判断 if ($("#myform").data("changed")) { // submit the form }


			//var data = $('#fm').serializeArray();//usingProdctMsgform   form表单id
			//alert(JSON.stringify(data));
			//	var json={};
			// for(var i=0;i<data.length;i++){
			// json[data[i]['name']]=data[i]['value'];

			//alert ( $("#fm :input[value!='']").serialize()  );

			// if(!$(this).form('enableValidation').form('validate'))
			//    return false;

			return $(this).form('validate');
		},
		success: function(res) {
			//对后端后回的结果处理
			try {
				//由JSON字符串转换为JSON对象
				var res = JSON.parse(res);
				if (res.result == "FAILED") {
					//处理后台返回错误信息
					$.messager.show({
						title: 'Error',
						msg: res.message
					});
				} else {
					//处理后台返回正确信息
					$.messager.show({
						title: 'OK',
						msg: res.message
					});
					$('#dlg').dialog('close');
					$('#dg').datagrid('reload');
				}
			} catch (err) {
				$.messager.show({
					title: 'Error',
					msg: "操作失败！ 数据非法错误"
				});
			}
		}
	});

}


//刷新
function reload() {
	$('#dg').datagrid('reload');
}




function del() {
	var operation = 'delete';
	var rows = $('#dg').datagrid('getSelections');

	if (rows.length > 0) {
		$.messager.confirm('确认操作', '你真的要删除当前选中的条记录吗?', function(r) {
			if (r) {
				// 得到删除的的记录id
				var ids = [];
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].employeeId);
				}
				// Ajax请求

				$.post('http://localhost:8080/SystemCRM/employee/' + operation, {

					ids: ids.join(','),
				}, function(res) {
					console.log(res);
					if (res.result == "SUCCESS") {
						$('#dg').datagrid('reload');
						$.messager.show({
							title: 'OK',
							msg: res.message
						});
					} else {
						$.messager.show({ // show error message
							title: 'Error',
							msg: res.message
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



//index查找
function findFirstIndex(arrjson, text) {
	// 若元素不存在在数组中返回-1
	let firstVal = -1;
	for (let i = 0; i < arrjson.length; i++) {

		if (arrjson[i].name == text) {
			firstVal = i + 1;
			return firstVal;
			break;
		}
	}
	return firstVal;
}
