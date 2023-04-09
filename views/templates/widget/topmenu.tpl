{block name='header_nav'}
    <nav id="mainNav" class="header-nav navbar navbar-light navbar-fixed-top {if $store_name_clickable}indexpage{/if}">
        <div class="container-fluid">
            <div class="row">
                <div class="hidden-sm-down">
                    <div class="col-md-10 col-xs-12 nav1">
                        {hook h='displayNav1'}
                        <a class="navbar-brand
                           {if !$store_name_clickable}page-scroll{/if}
                            "
                           {if !$store_name_clickable}
                               href="#header"
                           {else}
                               href="{$store_link}"
                           {/if}
                        >
                            {$store_name}
                        </a>
                        <div>
                            {include file='module:hs_topmenu/views/templates/widget/navigation_links.tpl'}
                        </div>
                    </div>
                    <div class="col-md-2 right-nav">
                        {hook h='displayNav2'}
                    </div>
                </div>
                <div class="hidden-md-up mobile">
                    <div class="float-xs-left">
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
                        <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-2">
                            {include file='module:hs_topmenu/views/templates/widget/navigation_links.tpl'}
                        </div>
                    </div>
                    <div class="float-xs-right" id="_mobile_cart"></div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </nav>
{/block}
