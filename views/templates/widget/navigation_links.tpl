<ul class="nav navbar-nav">
    {foreach from=$menustates item=menustate key=menukey}
        {if $menustate.exists}
            <li class="{if $menustate.active}active{/if}">
                <a class="page-scroll"
                   href="{$menustate.destination}"
                >
                    {*
                    {if $menukey === 'home'}
                        {l s='home' sprintf=[$menukey] mod='hs_topmenu'}
                    {/if}
                    *}
                    {if $menukey === 'about'}
                        {l s='about' d='Modules.Hstopmenu.Shop'}
                    {/if}
                    {if $menukey === 'catalog'}
                        {l s='catalog' d='Modules.Hstopmenu.Shop'}
                    {/if}
                    {if $menukey === 'reparation'}
                        {l s='reparation' d='Modules.Hstopmenu.Shop'}
                    {/if}
                    {if $menukey === 'contact'}
                        {l s='contact' d='Modules.Hstopmenu.Shop'}
                    {/if}
                </a>
            </li>
        {/if}
    {/foreach}
</ul>
