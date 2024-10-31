<!-- Cart -->
<section tabindex="-1" id="offcanvasCart" aria-labelledby="offcanvasCart" class="offcanvas offcanvas-start">
    {!! $modalcart !!}
 
</section>

<div class="modal fade" id="callmeModal" tabindex="-1" aria-labelledby="callmeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="callmeModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="form_callme_wrapper">
                <form class=" " id="form_callme">
                    <input type="hidden" name="formid" value="form_callme">
                    <div class="form-group mb-3" data-field-wrapper="name">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="">
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="form-group mb-3" data-field-wrapper="phone">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="">
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="form-group mb-3" data-field-wrapper="vericode">
                        <div class="smart-captcha" data-sitekey="@config('y-captcha-sitekey')"></div>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="form-group  ">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>