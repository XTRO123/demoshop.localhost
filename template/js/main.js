$(document).ready(function () {

    var ajax = {
        /**
         * @param {string} form_wrapper_id ex #outer_form_id
         * @param {string} form_id   ex #form_id
         * @param {string} url   ex ajax/route
         * @param {function} callback  anonymouse function
         * @param {boolean} rewrite true/false
         */
        sendForm: function (form_wrapper_id, form_id, url, callback = false, rewrite = true) {
            var formData = new FormData($(form_id)[0]);
            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                dataType: 'json',
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {

                    $(form_id).find('.invalid-feedback').html('');
                    $(form_id).find('input,textarea').removeClass('is-invalid')
                    $(form_id).find('[data-messages]').removeClass('alert-danger')
                    if (data.messages) {
                        $(form_id).find('[data-messages]').html(data.messages[0]).addClass('alert-danger');
                    }
                    if (data.status === true) {
                        if (rewrite) {
                            $(form_id).html(data.output)
                        }
                        if (callback) {
                            callback(data);
                        }
                    }
                    else {
                        if (data.redirect) { location.reload(data.redirect) }
                        $.each(data.errors, function (index, item) {
                            var error_text = '';
                            var validate_errors_types = Object.keys(item);
                            for (var key in validate_errors_types) {
                                var error_text = item[validate_errors_types[key]];
                                var field = $(form_id).find('[name="' + index + '"]');
                                field.addClass('is-invalid');

                                var field_container = $(form_id).find('[data-field-wrapper="' + index + '"]');
                                field_container.find('.invalid-feedback').addClass('d-block');
                                field_container.find('.invalid-feedback').html(error_text);
                                field_container.addClass('has-error');
                            }

                        });
                        if (data.captcha) {
                            //
                            window.smartCaptcha.render(
                                $(form_id).find('.smart-captcha')[0], {
                                sitekey: window.sitekey,
                            })
                        }
                    }
                }
            });
            return false;
        },
    }

    $('#form_callme').on('submit', function (e) {
        ajax.sendForm('#form_callme_wrapper', '#form_callme', 'ajax/callme', function () {
            setTimeout(function () {
                //
            }, 2000);
        }, true);
        e.preventDefault();
    })

});

/**
 * Создание всплывающего уведомления
 * @param {string} message сообщение
 * @param {string} title заголовок
 * @param {number} [delay=5000] время показа
 * @example
 * showToast('Это пример уведомления!', 'Уведомление', 3000);
 */
function showToast(message, title = 'Уведомление', delay = 5000) {
    // Создаем HTML-шаблон тоста
    var toastHTML = `
        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="${delay}">
            <div class="toast-header">
                <strong class="me-auto">${title}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${message}
            </div>
        </div>`;

    var toastContainer = document.getElementById('toast-container');
    var toastElement = document.createElement('div');
    toastElement.innerHTML = toastHTML;
    toastContainer.appendChild(toastElement.firstElementChild);

    // Инициализация и показ тоста
    var toast = new bootstrap.Toast(toastContainer.lastElementChild);
    toast.show();
}

$(document).on('cart-add-complete.commerce', function (e, params) {
    if (params.response.status != 'success') {
        return;
    }
    var message;
    switch (params.data.instance) {
        case 'comparison':
            message = "Товар добавлен к сравнению";
            break;
        case 'wishlist':
            message = "Товар добавлен в избранное";
            break;
        case 'products':
        default:
            message = "Товар добавлен в корзину";
            break;
    }

    showToast(message, 'Магазин', 1000)
});