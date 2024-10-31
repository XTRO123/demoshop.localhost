@extends('layout.app')

@section('content')
<div class="container my-5">
    {!! $crumbs !!}
    <div class="col-lg-12 col-12 px-0">
        <h1>{{$pagetitle}}</h1>

        <div class="row mt-5">
            @foreach ($articles as $article)
            @include('parts.article_in_feed')
            @endforeach
        </div>
    </div>
</div>
@endsection