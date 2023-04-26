<div class="">
    <div class="row">
        {foreach from=$shops.subshops item=shop key=key}
            <div class="col-md-6">
                {$shop.address1}
                {$shop.address2}
                <img
                        class="logo img-fluid"
                        src="{$shop.logo}"
                        alt="{*{$shop.name}*}"
                        width="{*{$shop.logo_details.width}*}"
                        height="{*{$shop.logo_details.height}*}">
                {assign var="url" value="displayFooter"|cat: "RepairLinkList"}
                {$url|var_dump}
                {widget name="ps_linklist" hook="displayFooter"|cat: "RepairLinkList"}
            </div>
        {/foreach}
    </div>
</div>
