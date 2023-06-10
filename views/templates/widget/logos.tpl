<ul class="main-menu col-md-12 pr-0">
    <li class="main-site-logo col-md-4 pl-1">
        <a class="col-xs-12 p-0" href="{$shops.mainShop.url}">
            <img
                class="logo {*img-fluid*}"
                src="{$shops.mainShop.logo}"
                alt=""
                width="128"
                height="31"
            >
        </a>
    </li>
    {foreach from=$shops.subshops item=shop key=key}
        <li class="menu-li col-md-4 {if $shop.name == "Records"}records{else} repair{/if}">
            {if $shops.current_shop.id_shop == $shop.id}
                <span class="">
                    <img
                        class="{if $shops.current_shop.id_shop == $shop.id}
                                    active
                                {/if} img-fluid"
                        src="{$shop.logo}"
                        alt=""
{*                        width="{if $shop.name == "Records"}173{else}89{/if}"
                        *}{*height="{if $shop.name == "Records"}26{else}23{/if}"*}{*
                        style="height:{if $shop.name == "Records"}26px;{else}23px;{/if}"*}

                    >
                 </span>
            {else}
                <a class="" href="{$shop.url}">

                        <img class="img-fluid"
                                src="{$shop.logo}"
                                alt=""
{*                                width="{if $shop.name == "Records"}171{else}89{/if}"
                                *}{*height="{if $shop.name == "Records"}26{else}23{/if}"*}{*
                             style="height:{if $shop.name == "Records"}26px;{else}23px;{/if}"*}
                        >

                </a>
            {/if}
        </li>
    {/foreach}
</ul>
<div class="clearfix"></div>



