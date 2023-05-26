<div class="row">
    <div class="col-xl-4 hidden-sm-down"></div>
    {foreach from=$shops.subshops item=shop key=key}
        <div class="col-sm-6 col-xl-4 footer-block">
            <div class="footer-block-logo">
                <img
                    class="logo img-fluid"
                    src="{$shop.logo}"
                    alt="{$shop.name}"
                    width="{*{$shop.logo_details.width}*}"
                    height="{*{$shop.logo_details.height}*}">
            </div>
            <div class="footer-block-content">
                <div>
                    {$shop.address1}
                </div>
                <div>
                    {$shop.address2}
                </div>
                {if $shop.name == "Records"}
                    <div class="mt-2 mb-2">
                        <a href=mailto:“{$shop.email}”>{l s='Contact'}</a>
                    </div>
                {/if}
            </div>
            <div class="footer-block-links">
                {assign var="hookName" value="displayFooter"|cat: $shop['name']|cat: "LinkList"}
                {widget name="ps_linklist" hook=$hookName}
            </div>
        </div>
    {/foreach}
</div>

