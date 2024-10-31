@extends('layout.app')

@section('content')
<div class="container my-5">
    <section class="col-lg-12 col-12 px-0">
        <h1>Products</h1>
        @if ($products)
        <section class="row mt-3">
            @foreach ($products as $product)
            @include('parts.product_in_feed')
            @endforeach
        </section>
        @endif
    </section>
    <section class="col-lg-12 col-12 px-0">
        <h1>Articles</h1>
        <div class="row mt-3">
            @foreach ($articles as $article)
            @include('parts.article_in_feed')
            @endforeach
        </div>
    </section>
</div>
@endsection