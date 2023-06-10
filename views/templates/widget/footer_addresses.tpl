<div class="col-md-4 col-xl-4 hidden-md-down"></div>
{foreach from=$shops.subshops item=shop key=key}
    <div class="col-sm-6 col-md-4 col-xl-4 footer-block {if $shop.name != "Records"}repair{else}records{/if}">
        <div class="footer-block-logo">
            <div class="footer-logo">
                <img
                        class="logo img-fluid"
                        src="{$shop.logo}"
                        alt="{$shop.name}"
                        width=""
                        height="26">
            </div>
        </div>
        <div class="footer-block-content">
            <div>
                {$shop.address1}
            </div>
            <div>
                {$shop.address2}
            </div>
            {if $shop.name == "Records"}
                <div class="contact mb-2">
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


