<div class="">
    <div class="row">
        {foreach from=$shops.subshops item=shop key=key}
            <div class="col-md-6">
                <div>
                    {$shop.address1}
                </div>
                <div>
                    {$shop.address2}
                </div>
                <div>
                    <img
                            class="logo img-fluid"
                            src="{$shop.logo}"
                            alt="{*{$shop.name}*}"
                            width="{*{$shop.logo_details.width}*}"
                            height="{*{$shop.logo_details.height}*}">
                </div>
                <div>
                    {assign var="hookName" value="displayFooter"|cat: $shop['name']|cat: "LinkList"}
                    {widget name="ps_linklist" hook=$hookName}
                </div>
            </div>
        {/foreach}
    </div>
</div>
