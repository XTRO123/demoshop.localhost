<li class="" data-id="{{ $data['id'] }}" data-commerce-row="{{ $data['row'] }}">
    <div>title {{ $data['name'] }}</div>

    <div>count {{ $data['count'] }}</div>

    <div>
        price @price($data['price'])
    </div>
    <div>total @price($data['total'])</div>

    {{ $data['options'] }}
    <div>
        <input type="text" name="count" class="form-control" value="{{ $data['count'] }}"
            data-commerce-action="recount">
        <button type="button" data-commerce-action="decrease"> - </button>
        <button type="button" data-commerce-action="increase"> + </button>
        <button type="button" data-commerce-action="remove">x</button>
    </div>
</li>