
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
{block name='header_banner'}
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
{/block}

{block name='header_nav'}
    <nav class="header-nav">
        <div class="container">
            <div class="row">
                <div class="hidden-sm-down">
                    <div class="col-md-5 col-xs-12">
                        {include file='module:hs_topmenu/views/templates/widget/logos.tpl'}
                        {hook h='displayNav1'}
                    </div>
                    <div class="col-md-7 right-nav">
                        {hook h='displayNav2'}
                    </div>
                </div>
                <div class="hidden-md-up text-sm-center mobile">
                    <div class="float-xs-left" id="menu-icon">
                        <i class="material-icons d-inline">&#xE5D2;</i>
                    </div>
                    <div class="top-logo" id="_mobile_logo"></div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </nav>
{/block}


{if $repair}
    {block name='header_nav'}
        <nav id="mainNav" class="header-nav navbar navbar-light navbar-fixed-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="hidden-sm-down">
                        <div class="col-md-10 col-xs-12 nav1">
                            <div>
                                {include file='module:hs_topmenu/views/templates/widget/navigation_links.tpl'}
                            </div>
                        </div>
                        <div class="col-md-2 right-nav">
                        </div>
                    </div>
                    <div class="hidden-md-up mobile">
                        <div>
                            <div class="float-xs-right">
                                <button class="navbar-toggler navbar-toggler-right"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#bs-example-navbar-collapse-2"
                                        aria-controls="bs-example-navbar-collapse-2"
                                        aria-expanded="false"
                                        aria-label="Toggle navigation"
                                >
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                            </div>
                            <div class="float-xs-left"></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-2">
                            {include file='module:hs_topmenu/views/templates/widget/navigation_links.tpl'}
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    {/block}
{/if}
