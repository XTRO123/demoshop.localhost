<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="@config('site_url')">

    <title>{{ $metatitle }}</title>
    @if($noIndex == 1)
    <meta name="robots" content="noindex, nofollow">
    @endif
    <meta property="og:title" content="{{ $metatitle }}" />
    <meta property="og:description" content="{{ $metadescription }}">
    <meta name="Description" content="{{ $metadescription }}">
    @if (isset($ogImage) && !empty($ogImage ))
    <meta property="og:image" content="{{$ogImage}}">
    @endif
    @if (isset($ogType) && !empty($ogType ))
    <meta property="og:type" content="{{$ogType ?? 'website'}}">
    @endif

 
    <meta name="twitter:card" content="summary_large_image">
    <meta property="twitter:domain" content="@config('site_hostnames')">
    <meta property="twitter:url" content="@config('site_url')">
    <meta name="twitter:title" content="{{$metatitle}}">
    <meta name="twitter:description" content="{{$metadescription}}">
    @if (isset($ogImage) && !empty($ogImage ))
    <meta name="twitter:image" content="{{$ogImage}}">
    @endif


    <link rel="canonical" href="{{urlProcessor::makeUrl($id,'','','full')}}">
    @if (!empty ($id))
    <meta property="og:url" content="{{ urlProcessor::makeUrl($id,'','','full') }}">
    @endif

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>
    <script src="https://smartcaptcha.yandexcloud.net/captcha.js" defer></script>
    {!! evo()->getConfig('client_code_head') !!}
    <script>
        /**
         *  капча Яндекс
         */
        window.sitekey = "{{evo()->getConfig('y-captcha-sitekey') ?? null}}";
    </script>
</head>