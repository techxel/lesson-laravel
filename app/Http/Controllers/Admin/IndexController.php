<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

class IndexController extends Controller
{
  public function login()
  {
    return redirect('admin/index');
  }

  public function toLogin()
  {
    return view('admin.login');
  }

  public function toIndex()
  {
    return view('admin.index');
  }

}
