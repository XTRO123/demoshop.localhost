@extends('layout.app')

@section('content')
<div class="container my-5">
    {!! $crumbs !!}
    <div class="offset-lg-2 col-lg-8 col-12 mt-5">
        <h1>{{$pagetitle}}</h1>

        <div class="mt-5">

            @evoParser($content)
        </div>
    </div>
</div>
@endsection