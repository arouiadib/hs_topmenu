<ul class="main-menu">
    <li class="main-site-logo">
        <a href="{$shops.mainShop.url}">
            <img
                class="logo img-fluid"
                src="{$shops.mainShop.logo}"
                alt=""
                width=""
                height="">
        </a>
    </li>
    {foreach from=$shops.subshops item=shop key=key}
        <li class="menu-li">
            {if $shops.current_shop.id_shop == $shop.id}
                <img
                    class="{if $shops.current_shop.id_shop == $shop.id}
                                active
                            {/if}"
                    src="{$shop.logo}"
                    alt=""
                    width=""
                    height="20">
            {else}
                <a href="{$shop.url}">
                    <img
                        src="{$shop.logo}"
                        alt=""
                        width=""
                        height="20">
                </a>
            {/if}
        </li>
    {/foreach}
</ul>



