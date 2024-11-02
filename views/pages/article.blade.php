@extends('layout.app')

@section('content')

<div class="container my-5">
    {!! $crumbs !!}
    <div class="col">
        <div class="row mt-5">
            <div class="col-md-8 offset-md-2" itemscope="" itemtype="https://schema.org/BlogPosting">
                <!-- text -->
                <div class="mb-5">
                    <h1 class="fw-bold text-center" itemprop="headline">{{$pagetitle}}</h1>
                    <div class="d-flex justify-content-center text-muted mt-4">
                        <span class="me-2">
                            <small itemprop="datePublished" content="{{$date_rfc}}">{{$date_formatted}}</small>
                        </span>
                        <meta itemprop="dateModified" content="{{$date_rfc}}">
                    </div>
                </div>

                <div class="mb-5">
                    <img id="main_image" data-src="@phpthumb($article_photo,'w=900')"
                        src="@phpthumb($article_photo,'w=900')" loading="lazy" class="img-thumbnail"
                        alt="{{$pagetitle}}" itemprop="image" width="900" height="300">
                </div>
                <div>
                    <div class="mb-4" itemprop="articleBody">
                        @evoParser($content)
                    </div>
                </div>

                <hr class="mt-8 mb-5">

                <div class="d-flex justify-content-between align-items-center mb-5">
                    <div class="d-flex align-items-center" itemprop="author" itemscope=""
                        itemtype="https://schema.org/Person">
                        <img src="@config('client_site_logo')" alt="@config('site_name')"
                            class="rounded-circle avatar-md">
                        <div class="ms-2 lh-1">
                            <h5 class="mb-0" itemprop="name">@config('site_name')</h5>
                            <meta itemprop="url" content="@config('site_url')">
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
@endsection