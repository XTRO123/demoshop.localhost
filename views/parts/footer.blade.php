<div id="toast-container" class="toast-container position-fixed top-0 end-0 p-3"></div>

<script src="https://smartcaptcha.yandexcloud.net/captcha.js" defer async></script>

<script>
    /**
 *  капча Яндекс
 */
window.sitekey = "{{evo()->getConfig('y-captcha-sitekey') ?? null}}";
</script>
<script src="template/js/main.js?rostelekom=pidr"></script>