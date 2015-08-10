<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="http://static.workflow.com/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap-table -->
	<link rel="stylesheet" href="http://static.workflow.com/bootstrap-table/bootstrap-table.css"  type="text/css">
	<!-- datetimepicker -->
	<link rel="stylesheet" href="http://static.workflow.com/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"  type="text/css">
    <!-- Theme style -->
    <link href="http://static.workflow.com/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="http://static.workflow.com/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<!--  -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue sidebar-mini">
   
    <div class="wrapper">
      
	<jsp:include page="/header.jsp"></jsp:include>
      <!-- Left side column. contains the logo and sidebar -->
      <jsp:include page="/menu.jsp"></jsp:include>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            系统管理
          </h1>
          <ol class="breadcrumb">
          </ol>
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
					<nav class="navbar navbar-default" role="navigation">
					   <div>
					      <ul class="nav navbar-nav">
					         <li class="active"><a href="view" name="tab">查看系统</a></li>
					         <li><a href="add" name="tab">新增系统</a></li>
					      </ul>
					   </div>
					</nav>
                </div><!-- /.box-header -->
                <div class="box-body">
				 <div class="tab-content"> 
					<div class="tab-pane active" id="view">				
					<div id="custom-toolbar">
					    <div class="form-inline" role="form">
					        <div class="form-group">
					            <div class="input-group">
					                <input class="form-control" type="text" placeholder="名称" name="name">
					            </div>
					        </div>
					        <div class="form-group">
					            <div class="input-group">
					                <input class="form-control" type="date" placeholder="创建时间(开始)" name="createTimeStart">
					            </div>
					        	<div class="input-group">
					                <input class="form-control" type="date" placeholder="创建时间(结束)" name="createTimeEnd">
					            </div>
					        </div>
					        <button type="submit" class="btn btn-default" name="querySearch">搜索</button>
					    </div>
					</div>
					<table id="data-table" data-url="findXf9SystemJson.do" data-height="555" data-method="post" data-show-refresh="true" 
					data-side-pagination="server" data-pagination="true" data-page-list="[10, 20, 50]" data-search="false">
						   <thead>
						    <tr>
						    
						    <th data-field="systemCode" data-align="center" >系统code</th>
					        <th data-field="name" data-align="center" >名称</th>
					        <th data-field="userName" data-align="center" >登陆用户名</th>
					        <th data-field="userCode" data-align="center" >登陆用户code</th>
					        <th data-field=description data-align="center" >描述</th>
					        <th data-field="statusName" data-align="center" class="col-md-1 status">是否可用</th>
					        <th data-field="createTimeName" data-align="center" >创建时间</th>
					        <th data-field="updateTimeName" data-align="center" >最近修改时间</th>
					        <th data-field="operation" data-align="center" class="col-md-2">操作</th>
   						 	</tr>	
   						 	</thead>
					</table>
					</div>
						              <!--view  -->
	              <div class="tab-pane" id="add">
	             		<div class="col-md-6">
              			<!-- general form elements -->
			              <div class="box box-primary">
			                <div class="box-header">
			                  <h3 class="box-title">新增系统</h3>
			                </div><!-- /.box-header -->
			                <!-- form start -->
			                <form role="form" action="/xf9System/register.do" method="post">
			                  <div class="box-body">
			                    <div class="form-group">
			                      <label for="">系统名称</label>
			                      <input type="text" class="form-control" name="systemCode" placeholder="系统code">
			                    </div>
			                    <div class="form-group">
			                      <label for="">系统名称</label>
			                      <input type="text" class="form-control" name="name" placeholder="系统名称">
			                    </div>
			                    <div class="form-group">
			                      <label for="">登陆用户名</label>
			                      <input type="text" class="form-control" name="userName" placeholder="登陆用户名">
			                    </div>
			                    <div class="form-group">
			                      <label for="">登陆用户code</label>
			                      <input type="text" class="form-control" name="userCode" placeholder="登陆用户code">
			                    </div>
			                    <div class="form-group">
			                      <label for="">登陆用户密码</label>
			                      <input type="password" class="form-control" name="userPwd" placeholder="登陆用户密码">
			                    </div>
			                    <div class="form-group">
			                      <label for="">描述</label>
			                      <input type="text" class="form-control" name="description" placeholder="描述">
			                    </div>					                    				                    			                    			                    			                    
			                  </div><!-- /.box-body -->
			
			                  <div class="box-footer">
			                    <button type="button" name="submit" class="btn btn-primary">保存</button>
			                  </div>
			                </form>
			              </div><!-- /.box -->
              
	            	</div>
	              </div>
					</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
		<jsp:include page="/footer.jsp"></jsp:include>
    </div><!-- ./wrapper -->

</body>
 <!-- jQuery 2.1.4 -->
 <script src="http://static.workflow.com/plugins/jQuery/jQuery-2.1.4.min.js"></script>
 <!-- Bootstrap 3.3.2 JS -->
 <script src="http://static.workflow.com/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <!-- DATA TABES SCRIPT -->
 <script src="http://static.workflow.com/bootstrap-table/bootstrap-table.js"></script>
 <script src="http://static.workflow.com/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
 <!-- datetimepicker -->
 <script src="http://static.workflow.com/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
 <script src="http://static.workflow.com/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
 <!-- SlimScroll -->
 <script src="http://static.workflow.com/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
 <!-- FastClick -->
 <script src='http://static.workflow.com/plugins/fastclick/fastclick.min.js'></script>
 <!-- AdminLTE App -->
 <script src="http://static.workflow.com/dist/js/app.min.js" type="text/javascript"></script>
 <!-- page script -->
   <script src="http://static.vacn.com/layer/layer.js"></script>
<script type="text/javascript" src="/init.js"></script>
	
</html>

