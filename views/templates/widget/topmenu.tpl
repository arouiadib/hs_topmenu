


{block name='header_nav'}
    <nav id="mainNav" class="header-nav navbar navbar-light navbar-fixed-top">
        <div class="container-fluid">
            <div class="row">
                <div class="hidden-sm-down">
                    <div class="col-md-10 col-xs-12 nav1">
                        {hook h='displayNav1'}
                        <div>
                            {include file='module:hs_topmenu/views/templates/widget/navigation_links.tpl'}
                        </div>
                    </div>
                    <div class="col-md-2 right-nav">
                        {hook h='displayNav2'}
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

