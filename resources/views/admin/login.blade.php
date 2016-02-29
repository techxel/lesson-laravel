@extends('admin.master')

@section('content')
  <link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />

  <input type="hidden" id="TenantId" name="TenantId" value="" />
  <div class="">
    <div id="loginform" class="loginBox">
      <form class="form form-horizontal" action="/admin/service/login" method="post">
        {{ csrf_field() }}
        <div class="row cl">
          <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
          <div class="formControls col-8">
            <input id="" name="username" type="text" placeholder="账户" class="input-text size-L">
          </div>
        </div>
        <div class="row cl">
          <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
          <div class="formControls col-8">
            <input id="" name="password" type="password" placeholder="密码" class="input-text size-L">
          </div>
        </div>
        <div class="row">
          <div class="formControls col-8 col-offset-3">
            <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
            <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="footer">Copyright 凯恩书店有限公司</div>
@endsection
