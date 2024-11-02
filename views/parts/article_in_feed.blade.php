<div class="col-12 col-md-6 col-lg-4 mb-5" itemscope="" itemtype="https://schema.org/BlogPosting">
    <div class="mb-4">
        <a href="@makeUrl($article['id'])" itemprop="url">
            <!-- img -->
            <div class="img-zoom">
                <img class="img-thumbnail" src="@phpthumb($article['article_photo'],'w=600,h=200,zc=1')" alt=""
                    class="img-fluid w-100" itemprop="image" width="400" height="140">
            </div>
        </a>
    </div>
    <div>
        <h2 class="h5">
            <a itemprop="headline" href="@makeUrl($article['id'])" class="text-inherit">{{$article['pagetitle']}}</a>
        </h2>
        <p itemprop="description">{{$article['introtext']}}</p>
        <div class="d-flex justify-content-between text-muted mt-4">
            <span><small itemprop="datePublished"
                    content="{{\Carbon\Carbon::createFromTimestamp($article['createdon'])->toIso8601String()}}">{{$article['date']}}</small></span>
            <meta itemprop="dateModified"
                content="{{\Carbon\Carbon::createFromTimestamp($article['createdon'])->toIso8601String()}}">
            <span class="d-none" itemprop="author" itemscope="" itemtype="https://schema.org/Person">
                <small itemprop="name">@config('site_name')</small>
            </span>
            <meta itemprop="url" content="@config('site_url')">
        </div>
    </div>
</div>