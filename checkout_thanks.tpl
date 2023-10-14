{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="5"}

<h1>Order Complete</h1>

  {if isset($ebook_error)}
    There was an error processing your ebook purchases.
    <br/> Please contact support with this order number so this can be resolved
    <br/> {$ebook_error}
    <br/><br/>
  {/if}

{#order_thankyou_text#}

{if isset($placed.order.id) && !isset($placed.info.amazon_order_ids)}
  <h2>Your Order # is {$placed.order.id}</h2>
{elseif isset($placed.info.amazon_order_ids)}
    <h2>{#store_name#} Order # is {$placed.order.id}</h2>
    {include file="amazon_checkout.tpl" order_ids=$placed.info.amazon_order_ids}
{/if}

{if isset($placed.rewards_points_earned) && $placed.rewards_points_earned > 0}
  <h2>Rewards Points Earned: {$placed.rewards_points_earned}</h2>
  <br/>
{/if}

{if isset($placed.rewards_points_redeemed) && $placed.rewards_points_redeemed > 0}
  <h2>Rewards Points Used: {$placed.rewards_points_redeemed}</h2>
  <br/>
{/if}

{if $registered == 'y'}
  <p><strong>Welcome to our site!</strong></p>
  <p>Feel free to log in to our member area <a href="/member">here</a> with the email and password you used during checkout.  If you cannot log in using the information given during checkout, your account may be pending approval.</p>
{/if}

{include file="display_product_group.tpl" label="Related Products" products=$rel_prods max=4}

{*** Commonly used Tracking Pixel variables ******
Order ID = $placed.order.id
Order Total = $placed.totals.grandtotal
SubTotal = $placed.totals.subtotal
Shipping Total = $placed.totals.shiptotal
Tax Total = $placed.totals.taxtotal
Payment Type = $placed.info.billing.payment_method
Currency Type = $placed.info.currency_type
**************************************************}

<!-- Google tag (gtag.js) - Google Ads: 123456789 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-1064132375"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'AW-1064132375');
</script>

<!-- Event snippet for Example conversion page -->
  <script>
    gtag('event', 'conversion', {'send_to': 'AW-1064132375/kTcECOv8r_MBEJe-tfsD',
      'value': $placed.totals.grandtotal,
      'transaction_id': $placed.info.order_id,
      'currency': 'USD'
    });
  </script>

{if isset($placed.info.amazon_order_ids) || isset($placed.order.id) && !isset($placed.info.amazon_order_ids)}

<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
window.ysm_customData = new Object();
window.ysm_customData.conversion = "transId={$placed.info.order_id},currency=USD,amount={$placed.totals.grandtotal}";
var ysm_accountid  = "1IB59L2HCV81PP4THIUI763NPM0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' "
+ "SRC=//" + "srv1.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid
+ "></SCR" + "IPT>");
// -->
</SCRIPT>



{* BEGIN: buySAFE Guarantee -->
<script src="https://seal.buysafe.com/private/rollover/rollover.js"></script>
<span id="BuySafeSealSpan"></span>
<span id="BuySafeGuaranteeSpan"></span>
<script type="text/javascript">
  buySAFE.Hash = "N%2BOxWUrYa5ezF%2F25DqWd8SvwQ42hoRLOkHEzD0xTZd0ODf8d9q5k1K0lbLtEc7p22kIA8YUlwYsvAosFSDt0RQ%3D%3D";
  WriteBuySafeSeal("BuySafeSealSpan", "GuaranteedSeal");
  WriteBuySafeGuarantee("JavaScript");
</script>
END: buySAFE Guarantee *}

{/if}

{include file="_bottom.tpl"}