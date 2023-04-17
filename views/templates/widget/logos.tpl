<div class="menu-container">
    <ul class="main-menu">
        <li class="main-site-logo">
            <a href="{$shops.mainShop.url}">
                <img
                        class="logo img-fluid"
                        src="{$shops.mainShop.logo}"
                        alt="{*{$shop.name}*}"
                        width="{*{$shop.logo_details.width}*}"
                        height="{*{$shop.logo_details.height}*}">
            </a>
        </li>
        {foreach from=$shops.subshops item=shop key=key}
            <li>
                {if $shops.current_shop_id == $shop.id}
                    <img
                            class="logo img-fluid
                {if $shops.current_shop_id == $shop.id}
                    active
                {/if}
                "
                            src="{$shop.logo}"
                            alt="{*{$shop.name}*}"
                            width="{*{$shop.logo_details.width}*}"
                            height="{*{$shop.logo_details.height}*}">
                {else}
                    <a href="{$shop.url}">
                        <img
                                class="logo img-fluid"
                                src="{$shop.logo}"
                                alt="{*{$shop.name}*}"
                                width="{*{$shop.logo_details.width}*}"
                                height="{*{$shop.logo_details.height}*}">
                    </a>
                {/if}
            </li>
        {/foreach}
    </ul>
</div>



