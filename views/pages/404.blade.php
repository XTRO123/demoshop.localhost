@extends('layout.app')

@section('content')
<div class="container my-5">
    <div class="col-lg-12 col-12 px-0">
        <h1>{{$pagetitle}}</h1>

        <div class="row">

            @evoParser($content)
        </div>
    </div>
</div>
@endsection