<p>Замова #[+order.id+] на сайце [(site_url)] аплочаная!</p>

<p>Памер аплаты: [[PriceFormat? &price=`[+amount+]` &convert=`0`]]</p>

<h4>Зьвесткі пакупніка:</h4>

<p>
    [+order.name+], [+order.email+], [+order.phone+]<br>
    Спосаб дастаўкі: [+order.fields.delivery_method_title+]<br>
    Спосаб аплаты: [+order.fields.payment_method_title+]
</p>

<h4>Зьмесьціва замовы:</h4>

[!Cart?
    &instance=`order`
    &tpl=`@FILE:order_report_items_row`
    &ownerTPL=`@FILE:order_report_items`
    &subtotalsRowTpl=`@FILE:order_report_subtotals_row`
    &urlScheme=`full`
!]
