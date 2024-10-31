<button data-commerce-cart="{{ $data['hash'] }}" data-instance="{{ $data['instance'] }}"
    class="btn btn-primary  fs-sm order-lg-3  d-sm-inline-flex  position-relative" href="/cart"
    data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">{{ $data['count']
        }}</span>
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
        class="bi bi-cart2 d-lg-none d-block d-sm-none" viewBox="0 0 16 16">
        <path
            d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0" />
    </svg>
    <span class="d-lg-block d-none d-sm-block">Корзина</span>
</button>