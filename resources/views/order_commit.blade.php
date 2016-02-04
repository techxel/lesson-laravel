@extends('master')

@section('title', '订单提交')

@section('content')
  <div class="page bk_content" style="top: 0;">
  <div class="weui_cells">
      @foreach($cart_items as $cart_item)
      <div class="weui_cell">
          <div class="weui_cell_hd">
            <img src="{{$cart_item->product->preview}}" alt="" class="bk_icon">
          </div>
          <div class="weui_cell_bd weui_cell_primary">
              <p class="bk_summary">{{$cart_item->product->name}}</p>
          </div>
          <div class="weui_cell_ft">
            <span class="bk_price">{{$cart_item->product->price}}</span>
            <span> x </span>
            <span class="bk_important">{{$cart_item->count}}</span>
          </div>
      </div>
      @endforeach
  </div>
  <div class="weui_cells_title">支付方式</div>
  <div class="weui_cells">
      <div class="weui_cell weui_cell_select">
          <div class="weui_cell_bd weui_cell_primary">
              <select class="weui_select" name="select1">
                  <option selected="" value="1">支付宝</option>
                  <option value="2">微信</option>
              </select>
          </div>
      </div>
  </div>

  <div class="weui_cells">
      <div class="weui_cell">
          <div class="weui_cell_bd weui_cell_primary">
              <p>总计:</p>
          </div>
          <div class="weui_cell_ft bk_price" style="font-size: 25px;">￥ {{$total_price}}</div>
      </div>
  </div>
  <div class="bk_fix_bottom">
    <div class="bk_btn_area">
      <button class="weui_btn weui_btn_primary" onclick="_onPay();">提交订单</button>
    </div>
  </div>
@endsection

@section('my-js')
<script type="text/javascript">

</script>
@endsection
