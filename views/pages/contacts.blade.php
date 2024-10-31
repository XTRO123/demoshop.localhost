@extends('layout.app')

@section('content')
<div class="container my-5">
    {!! $crumbs !!}
    <div class="offset-lg-2 col-lg-8 col-12 mt-5">
        <h1>{{$pagetitle}}</h1>

        <div class="row mt-5">
            <div itemscope itemtype="https://schema.org/Organization">
                <div itemprop="name">@config('client_company_name')</div>
                <div itemprop="address" itemscope itemtype="https://schema.org/PostalAddress">
                    <span itemprop="streetAddress">@config('client_company_address')</span>,
                    <span itemprop="addressLocality">@config('client_company_city')</span>,
                    <span itemprop="postalCode">@config('client_company_zip')</span>
                </div>
                <div itemprop="telephone">@config('client_company_phone')</div>
                <div>
                    <a href="mailto:@config('client_company_email')"
                        itemprop="email">@config('client_company_email')</a>
                </div>
                <div>
                    <a href="@config('site_url')" itemprop="url">@config('site_url')</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection