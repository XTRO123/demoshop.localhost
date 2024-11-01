@extends('layout.app')

@section('content')
<div class="container my-5">
    {!! $crumbs !!}
    <div class="col-lg-12 col-12 px-0">
        <h1>{{$pagetitle}}</h1>

        <div>
            {!! $efilterForm !!}
        </div>
        <div class="mt-5 position-relative" id="eFiltr_results_wrapper">
            <div class="eFiltr_loader spinner-border text-body-emphasis"></div>
            <div class="catalog row" id="eFiltr_results">
                @if (!@empty($products))
                @foreach ($products as $product)
                @include('parts.product_in_feed', $product)
                @endforeach
                <div class="row">
                    {!! $pages ?? '' !!}
                </div> @endif
            </div>
        </div>
    </div>
</div>
@endsection