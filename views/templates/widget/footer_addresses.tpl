<div class="">
    <div class="row">
        <div class="col-md-4"></div>
        {foreach from=$shops.subshops item=shop key=key}
            <div class="col-md-4">
                <div>
                    <img
                        class="logo img-fluid"
                        src="{$shop.logo}"
                        alt="{$shop.name}"
                        width="{*{$shop.logo_details.width}*}"
                        height="{*{$shop.logo_details.height}*}">
                </div>
                <div>
                    {$shop.address1}
                </div>
                <div>
                    {$shop.address2}
                </div>
                <div>
                    {assign var="hookName" value="displayFooter"|cat: $shop['name']|cat: "LinkList"}
                    {widget name="ps_linklist" hook=$hookName}
                </div>
            </div>
        {/foreach}
    </div>
</div>
