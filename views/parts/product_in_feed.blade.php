<div class="col-xl-2 col-lg-3 col-md-4 col-6 mb-4" aria-hidden="true" itemscope itemtype="https://schema.org/Product">
    <a href="@makeUrl($product['id'])" class="text-decoration-none" itemprop="url">
        <article class="item-in">
            <header>
                <figure>
                    <img class="img-thumbnail" loading="lazy"
                        src="@phpthumb($product['product_photo'],'w=210,h=210,zc=1')" alt="{{ $product['pagetitle'] }}"
                        itemprop="image" width="210" height="210">
                </figure>
                <h2 itemprop="name" class="fs-5 ">{{ $product['pagetitle'] }}</h2>
            </header>
            <div class="text-dark-emphasis">
                <span itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                    <span itemprop="price" content="{{ $product['price'] }}">{{ $product['price'] }}</span>
                    <span itemprop="priceCurrency" content="RUB">руб.</span>
                    @if ($product['in_stock'])
                    <meta itemprop="availability" content="https://schema.org/InStock">
                    @else
                    <meta itemprop="availability" content="https://schema.org/OutOfStock">
                    @endif
                </span>
            </div>
        </article>
    </a>
</div>