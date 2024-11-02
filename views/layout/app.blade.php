<!doctype html>
<html lang="ru" data-bs-theme="dark" prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb#">

@include('parts.head')

<body>
    @include('parts.nav')
    @yield('content')


    @include('parts.footer')
    @include('parts.modals')
    
    {!! evo()->getConfig('client_footer_codes') !!}
</body>

</html>