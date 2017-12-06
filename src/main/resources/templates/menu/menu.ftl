<#include "/layout/mainLayout.ftl" encoding="utf8">
<@base baseTitle="菜单管理" 
		baseCss=[
		"/lib/bootstrap/dist/css/bootstrap.min.css",
		"/lib/select2/dist/css/select2.min.css",
		"/lib/font-awesome/css/font-awesome.min.css",
		"/lib/Ionicons/css/ionicons.min.css",
		"/lib/admin-lte/dist/css/AdminLTE.min.css",
		"/lib/admin-lte/dist/css/skins/_all-skins.min.css",
		"/lib/morris.js/morris.css",
		"/lib/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css",
		"/lib/bootstrap-daterangepicker/daterangepicker.css",
		"/lib/bootstrap-wysihtml5/dist/bootstrap-wysihtml5-0.0.2.css",
		"/lib/formvalidation.io/dist/css/formValidation.min.css",
		"/lib/zTree/css/metroStyle/metroStyle.css"
		]
		baseJs=[
		"/lib/jquery/dist/jquery.min.js",
		"/lib/jquery-ui/jquery-ui.min.js",
		"/lib/bootstrap/dist/js/bootstrap.min.js",
		"/lib/raphael/raphael.min.js",
		"/lib/morris.js/morris.min.js",
		"/lib/jquery-sparkline/dist/jquery.sparkline.min.js",
		"/lib/jquery-knob/dist/jquery.knob.min.js",
		"/lib/moment/min/moment.min.js",
		"/lib/bootstrap-daterangepicker/daterangepicker.js",
		"/lib/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js",
		"/lib/bootstrap-wysihtml5/dist/bootstrap-wysihtml5-0.0.2.min.js",
		"/lib/select2/dist/js/select2.full.min.js",
		"/lib/jquery-slimscroll/jquery.slimscroll.min.js",
		"/lib/fastclick/lib/fastclick.js",
		"/lib/admin-lte/dist/js/adminlte.min.js",
		"/lib/zTree/js/jquery.ztree.core.js",
		"/lib/zTree/js/jquery.ztree.excheck.js",
		"/lib/zTree/js/jquery.ztree.exedit.js",
		"/lib/admin-lte/dist/js/demo.js",
		"/lib/admin-lte/dist/js/pages/dashboard.js",
		"/lib/formvalidation.io/dist/js/formValidation.min.js",
		"/lib/formvalidation.io/dist/js/framework/bootstrap.min.js",
		"/lib/formvalidation.io/dist/js/language/zh_CN.js",
		"/js/menu/menu.js"
		] 
		>
<style>
    /* FROM HTTP://WWW.GETBOOTSTRAP.COM
     * Glyphicons
     *
     * Special styles for displaying the icons and their classes in the docs.
     */

    .bs-glyphicons {
      padding-left: 0;
      padding-bottom: 1px;
      margin-bottom: 20px;
      list-style: none;
      overflow: hidden;
    }

    .bs-glyphicons li {
      float: left;
      width: 25%;
      height: 115px;
      padding: 10px;
      margin: 0 -1px -1px 0;
      font-size: 12px;
      line-height: 1.4;
      text-align: center;
      border: 1px solid #ddd;
    }

    .bs-glyphicons .glyphicon {
      margin-top: 5px;
      margin-bottom: 10px;
      font-size: 24px;
    }

    .bs-glyphicons .glyphicon-class {
      display: block;
      text-align: center;
      word-wrap: break-word; /* Help out IE10+ with class names */
    }

    .bs-glyphicons li:hover {
      background-color: rgba(86, 61, 124, .1);
    }

    @media (min-width: 768px) {
      .bs-glyphicons li {
        width: 12.5%;
      }
    }
  </style>
<div class="row">
	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">菜单树</h3>
			</div>
			<div class="box-body">
				<ul id="menuTree" class="ztree"></ul>
			</div>
			<div class="box-footer"></div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div id="dataPanel" class="box box-primary" style="display: none;">
			<div class="box-header with-border">
				<h3 class="box-title">基本信息</h3>
			</div>
			<div class="box-body">
				<form id="dataForm" class="form-horizontal" role="form" data-toggle="validator">
					<input type="hidden" id="id" name="id" value="" />
					<input type="hidden" id="parentId" name="parentId" value="" />
					<div class="form-group">
						<label class="col-sm-2 control-label">菜单名称</label>
						<div class="col-sm-10">
							<input id="name" name="name" class="form-control" placeholder="请输入...">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">菜单代码</label>
						<div class="col-sm-10">
							<input id="menuCode" name="menuCode" class="form-control" placeholder="请输入...">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图标类型</label>
						<div class="col-sm-10 form-inline">
							<input id="iconPath" type="text" name="iconPath" class="form-control" placeholder="请输入..." readonly="readonly" />
							<div class="input-group-btn">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">请选择</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<a href="javascript: void(0);" id="saveButton" class="btn btn-success btn-flat btn-sm" title="保存">
								<i class="glyphicon glyphicon-saved"></i>
							</a>
							<a href="javascript: void(0);" id="cancelButton" class="btn btn-danger btn-flat btn-sm" title="关闭">
								<i class="glyphicon glyphicon-remove"></i>
							</a>
						</div>
					</div>
				</form>
			</div>
			<div class="box-footer"></div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 80%">
		<div class="modal-content">
			<div class="modal-body">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#fa-icons" data-toggle="tab">Font Awesome</a></li>
						<li><a href="#glyphicons" data-toggle="tab">Glyphicons</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="fa-icons">
							<#if fontAwesomeMap??>
								<#list fontAwesomeMap?keys as key>
									<h4 class="page-header">${key}</h4>
									<div class="row fontawesome-icon-list">
									<#list fontAwesomeMap[key] as icon>
									<div class="col-md-3 col-sm-4">
										<input type="radio" name="optionsRadios" value="${icon.value}" />
										<i class="fa fa-fw ${icon.value}"></i> ${icon.name}
									</div>
									</#list>
									</div>
								</#list>
							</#if>
						</div>
						<div class="tab-pane" id="glyphicons">
							<ul class="bs-glyphicons">
								<#list glyphicons as glyphicon>
									<li>
										<span class="glyphicon ${glyphicon.value}"></span> 
										<span class="glyphicon-class">${glyphicon.name}</span>
										<input type="radio" name="optionsRadios" value="${glyphicon.value}" />
									</li>
								</#list>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button id="modalConfirm" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
		<!-- /.modal -->
	</div>
</div>


	</@base>