@extends('layout.app')


@section('content')
<div class="container my-5">
    {!! $crumbs !!}
    <div class="col-lg-8 col-12 px-0">
        <h1>{{$pagetitle}}</h1>
        <div class="row mt-5">
            {!! $cart !!}

        </div>

    </div>
</div>
@endsection