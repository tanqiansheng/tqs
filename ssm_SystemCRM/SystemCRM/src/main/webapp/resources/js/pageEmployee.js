/**
 * Created by Administrator on 2018/11/7.
 */

//全局基基础数据
var educationData;
var departmentData;
var positionData;
var statusData;
var sexData = [{ "name": "女" }, { "name": "男" }];

//强制同步执行
$.ajaxSettings.async = false;
//同步读取jsono文件数据
$.getJSON("jsondata/educationData.json", function(d) {
	educationData = d;
});
$.getJSON("/SystemCRM/department/list", function(d) {
	departmentData = d;
});
$.getJSON("jsondata/positionData.json", function(d) {
	positionData = d;
});
$.getJSON("jsondata/statusData.json", function(d) {
	statusData = d;
});
$.ajaxSettings.async = true;


$(function() {

	// 初始化分页表格
	$('#dg').datagrid({
		url: '/SystemCRM/employee/list?',
		//读取本地json文件，必须使用设置为get请求模式,
		method: 'get', //这个是最重要的，不写这个table加载不出来
		// title : '用户表',
		fitColumns: true,

		//对返回的数据进行预处理
		loadFilter: function(data) {
			return loadFilter(data); //自定义过滤方法
		},
		columns: [
			[{
				field: 'employeeId',
				title: 'id',
				width: 100,
				checkbox: true,
			}, {
				field: 'departmentId',
				title: '部门',
				width: 100,

			}, {
				field: 'positionId',
				title: '职位',
				width: 100,

			}, {
				field: 'sex',
				title: '性别',
				width: 100,

			}, {
				field: 'name',
				title: '姓名',
				width: 100,

			}, {
				field: 'married',
				title: '婚否',
				width: 100,

			},
			{
				field: 'education',
				title: '学历',
				width: 100,
			},
			{
				field: 'tel',
				title: '电话',
				width: 150,

			},
			{
				field: 'email',
				title: 'Email',
				width: 150,
			},
			{
				field: 'sid',
				title: '身份证号',
				width: 150,

			},
			{
				field: 'adders',
				title: '家庭地址',
				width: 150,

			},
			{
				field: 'hireDate',
				title: '入职时间',
				width: 100,

			},
			{
				field: 'termDate',
				title: '离职时间',
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



//过滤后端传递到前端的值 
function loadFilter(data) {



	for (i = 0; i < data.rows.length; i++) {
		//处理部门 
		if (data.rows[i].departmentId != null) {
			data.rows[i].departmentId = departmentData[data.rows[i].departmentId - 1].name;
		}
		//处理职位
		if (data.rows[i].positionId != null) {
			data.rows[i].positionId = positionData[data.rows[i].positionId - 1].name;
		}
		//处理性别
		if (data.rows[i].sex != null) {
			data.rows[i].sex = sexData[data.rows[i].sex].name;
		}

		// 预处理婚否
		if (data.rows[i].married) {
			data.rows[i].married = "已婚";
		} else {
			data.rows[i].married = "未婚";
		}

		//处理学历
		if (data.rows[i].education != null) {
			data.rows[i].education = educationData[data.rows[i].education - 1].name;
		}
		//处理入职时间
		if (data.rows[i].hireDate != null) {
			// 对于json格式的日期的转换 1446393600000 
			var date = new Date(data.rows[i].hireDate);
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			// 转换成String类型的yyyy-MM-dd
			var time = y + '-' + m + '-' + d;
			data.rows[i].hireDate = time;

		}
		// 离职时间
		if (data.rows[i].termDate != null) {
			// 对于json格式的日期的转换 1446393600000 
			var date = new Date(data.rows[i].termDate);
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			// 转换成String类型的yyyy-MM-dd
			var time = y + '-' + m + '-' + d;
			data.rows[i].termDate = time;

		}

		//预处理状态
		if (data.rows[i].status != null) {
			data.rows[i].status = statusData[data.rows[i].status - 1].name;
		}


	}


	return data;
}



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

				$.post('/SystemCRM/employee/' + operation, {

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
