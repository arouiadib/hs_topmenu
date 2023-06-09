
{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

{if $repair}
    {block name='new_world'}
        <div class="new-world">
            <span class="new-world-message">{l s='HiFi Store devient HARK Repair'}</span>
            <span class="new-world-close"></span>
        </div>
    {/block}
{/if}

{block name='header_nav'}
    <nav id="main-nav" class="header-nav">
        <div class="container-fluid">
            <div class="row">
                <div class="hidden-sm-down">
                    <div class="col-md-6 col-xs-12">
                        <div class="menu-container">
                            {include file='module:hs_topmenu/views/templates/widget/logos.tpl'}
                        </div>
                    </div>
                    <div class="col-md-6 right-nav {if $repair} repair {/if}">
                        <div class="col-md-8">
                            {hook h='displayNav2'}
                        </div>
                        <div class="col-md-4">
                            {hook h="displaySocialButtons" mod="hs_topmenu"}
                        </div>
                    </div>
                </div>
                <div class="hidden-md-up mobile">
                    <div class="col-xs-10 p-1" id="_mobile_logo">
                        <a href="{$shops.mainShop.url}">
                            <img
                                class="{*logo img-fluid*}"
                                src="{$shops.mainShop.logo}"
                                alt=""
                                width=""
                                height="40">
                        </a>
                        {if $shops.current_shop.id_shop != $shops.mainShop.id}
                        {*<a href="{$shops.mainShop.url}">*}
                            <img
                                class="{*logo img-fluid*}"
                                src="{$shops.current_shop.logo}"
                                alt=""
                                width=""
                                height="18">
                        {*</a>*}
                        {/if}
                    </div>
                    <div class="hamburger col-xs-2 pt-1 pl-1 pb-1 pr-0" id="menu-icon">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </nav>
    <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
        <div class="js-top-menu menu-container mobile" id="_mobile_top_menu">
           {include file='module:hs_topmenu/views/templates/widget/mobile-menu.tpl'}
        </div>
    </div>
{/block}
