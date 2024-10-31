<form method="post" data-commerce-order="{{ $data['form_hash'] }}">
    <p>Все поля формы обязательны к заполнению</p>
    <input type="hidden" name="formid" value="order">

    <div class="form-group mb-2">
        <input type="text"
            class="form-control {{ $data['name.errorClass'] ?? '' }} {{ $data['name.requiredClass'] ?? '' }}"
            placeholder="Ваше имя *" name="name" value="{{ $data['name.value'] ?? '' }}">
        {!! $data['name.error'] ?? '' !!}
    </div>

    <div class="form-group mb-2">
        <input type="text"
            class="form-control {{ $data['email.errorClass'] ?? '' }} {{ $data['email.requiredClass'] ?? '' }}"
            placeholder="e-mail *" name="email" value="{{ $data['email.value'] ?? '' }}">
        {!! $data['email.error'] ?? '' !!}
    </div>

    <div class="form-group mb-2">
        <input type="text"
            class="form-control {{ $data['phone.errorClass'] ?? '' }} {{ $data['phone.requiredClass'] ?? '' }}"
            placeholder="Номер телефона *" name="phone" value="{{ $data['phone.value'] ?? '' }}">
        {!! $data['phone.error'] ?? '' !!}
    </div>



    <div data-commerce-deliveries>
        {!! $data['delivery'] !!}
    </div>

    <div data-commerce-payments>
        {!! $data['payments'] !!}
    </div>

    {!! $data['form.messages'] ?? '' !!}

    <div class="form-group mb-2">
 

        <button type="submit" class="btn btn-primary">Отправить заказ</button>
    </div>

</form>