<ul class="mobile-menu">
    {if $repair}
        <li class="repair-li">
            <a href="/repair/rendez-vous">
                {l s='Préparez votre rendez vous' d='Modules.Hstopmenu.Shop'}
            </a>

        </li>
        <li class="repair-li repair-last">
            <a href="/repair/2-nos-reparations">
                {l s='Nos réparations' d='Modules.Hstopmenu.Shop'}
            </a>
        </li>
    {/if}

    {foreach from=$shops.subshops item=shop key=key}
        {if $shops.current_shop.id_shop != $shop.id}
            <li class="menu-li">
                <a href="{$shop.url}">
                    <img
                            class="{*logo img-fluid*}"
                            src="{$shop.logo}"
                            alt=""
                            width=""
                            height="20">
                </a>
            </li>
        {/if}
    {/foreach}

    {if $shops.current_shop.id_shop != $shops.mainShop.id}
         <li class="back-li">
             <a href="{$shops.mainShop.url}">
                 {l s='Back to HARK' d='Modules.Hstopmenu.Shop'}
             </a>
         </li>
    {/if}

</ul>

<div class="col-xs-12">
        {hook h='displayNav2'}
</div>
<div class="col-xs-12 pt-1 pb-1">
    {hook h="displaySocialButtons" mod="hs_topmenu"}
</div>



