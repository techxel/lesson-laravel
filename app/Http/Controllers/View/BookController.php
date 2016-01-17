<?php

namespace App\Http\Controllers\View;

use App\Http\Controllers\Controller;
use App\Entity\Category;
use App\Entity\Product;
use App\Entity\PdtContent;
use App\Entity\PdtImages;
use Log;

class BookController extends Controller
{
  public function toCategory($value='')
  {
    Log::info("进入书籍类别");
    $categorys = Category::whereNull('parent_id')->get();
    return view('category')->with('categorys', $categorys);
  }

  public function toProduct($category_id)
  {
    $products = Product::where('category_id', $category_id)->get();
    return view('product')->with('products', $products);
  }

  public function toPdtContent($product_id)
  {
    $product = Product::find($product_id);
    $pdt_content = PdtContent::where('product_id', $product_id)->first();
    $pdt_images = PdtImages::where('product_id', $product_id)->get();
    return view('pdt_content')->with('product', $product)
                              ->with('pdt_content', $pdt_content)
                              ->with('pdt_images', $pdt_images);
  }
}
