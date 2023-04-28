<?php
if(!defined('_PS_VERSION_'))
{
    exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

class Hs_Topmenu extends Module implements WidgetInterface
{
    private $templatesFolder = 'views/templates/widget/';

    private $templateFile = 'topmenu.tpl';

    protected $menuState = [];

    protected $catalogLink = '';
    protected $homeLink = '';
    protected $contactLink = '';
    protected $rdvLink = '';


    public function __construct()
    {
        $this->name = 'hs_topmenu';
        $this->version = '1.0.0';
        $this->author = 'Adib Aroui';
        $this->tab = 'front_office_features';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();

        $this->description = $this->trans('Add top menu ', array(), 'Modules.Hs_Topmenu.Admin');
        $this->displayName = $this->trans('HS Topmenu', array(), 'Modules.Hs_Topmenu.Admin');
        $this->confirmUninstall = $this->trans('Are you sure you want to uninstall?', array(), 'Modules.Hs_Topmenu.Admin');

        $this->catalogLink = Context::getContext()->link->getCategoryLink(Tools::getValue('HOME_FEATURED_CAT', (int) Configuration::get('HOME_FEATURED_CAT')));
        $this->homeLink = Context::getContext()->shop->getBaseURL(true);
        $this->contactLink = $this->context->link->getPageLink('contact');

        $this->blogLink = 'blog';
        if (Module::isEnabled('asblog')) {
            $url = \PrestaShop\Module\AsBlog\Link\BlogLink::getBlogUrl();
            $id_lang = Context::getContext()->language->id;
            $dispatcher = Dispatcher::getInstance();
            $this->blogLink = $url. $dispatcher->createUrl('module-asblog-bloglist', $id_lang, [], true);

        }

        if (Module::isEnabled('hsrdv')) {
            $url = $this->context->link->getPageLink('index',true);
            $id_lang = Context::getContext()->language->id;
            $dispatcher = Dispatcher::getInstance();
            $this->rdvLink = $url. $dispatcher->createUrl('module-hsrdv-rdv', $id_lang, [], true);
        }

        $this->menuState = [
            'about' => [
                'exists' => true,
                'active' => false,
                'destination' => $this->homeLink
            ],
            'catalog' => [
                'exists' => true,
                'active' => false,
                'destination' => $this->catalogLink
            ],
            'reparation' => [
                'exists' => true,
                'active' => false,
                'destination' => $this->rdvLink
            ],
            'blog' => [
                'exists' => true,
                'active' => false,
                'destination' => $this->blogLink
            ],
        ];
    }

    public function install()
    {
        if (!parent::install()
            || !(bool)$this->registerHook('actionFrontControllerSetMedia')
            || !(bool)$this->registerHook('displaySocialButtons')
            || !(bool)$this->registerHook('displaySubShopsBlocks')
            || !(bool)$this->registerHook('displayFooterRepairLinkList')
            || !(bool)$this->registerHook('displayFooterRecordsLinkList')
        ) {
            return false;
        }

        return true;
    }

    public function uninstall()
    {
        return(parent::uninstall());
    }

    public function hookActionFrontControllerSetMedia()
    {
        $this->context->controller->addCSS($this->_path . 'views/css/top-menu.css', 'all');
        $this->context->controller->addJS($this->_path . 'views/js/top-menu.js', 'all');
    }

    public function renderWidget($hookName = null, array $configuration = [])
    {
        $this->smarty->assign($this->getWidgetVariables($hookName, $configuration));

        return $this->display(__FILE__, $this->templatesFolder . $this->templateFile);
    }

    public function getWidgetVariables($hookName = null, array $configuration = [])
    {
        $modulesShops = $this->getHarkShops();
        switch ($this->context->controller->getPageName())
        {
            case 'index':
                $this->menuState['about']['active'] =  true;
                $this->menuState['about']['destination'] = '#intro-repair';
                $this->menuState['catalog']['destination'] = '#nos-reparations';
                $this->menuState['reparation']['destination'] = '#prendre-rdv';
                $this->menuState['blog']['destination'] = '#stories';
                break;
            case 'order':
            case 'cart':
                break;
            case 'category':
            case 'manufacturer':
                $this->menuState['catalog']['active'] = true;
                break;
            case 'contact':
            case 'product':
                $this->menuState['catalog']['active'] = true;
                break;
            case 'module-asblog-blogArchive':
            case 'module-asblog-blogArchiveMonth':
            case 'module-asblog-blogPost':
            case 'module-asblog-blogCategory':
            case 'module-asblog-blogList':
            case 'module-asblog-blogSearch':
            case 'module-asblog-blogTag':
                $this->menuState['blog']['active'] = true;
                break;
            case 'module-hsrdv-rdv':
            case 'module-hsrdv-editRdv':
            case 'module-hsrdv-satisfaction':
            case 'module-hsrdv-livraison':
                $this->menuState['reparation']['active'] = true;
                break;
            default:
                break;

        }

        return [
            'menustates' => $this->menuState,
            'store_name' => Configuration::get('PS_SHOP_NAME'),
            'store_link' => $this->homeLink,
            'repair' => Context::getContext()->shop->theme_name == 'hark-repair',
            'shops' => $modulesShops,
            /*'social' => [
                'youtube' => [
                    'url' => '',
                    'img_src' => $this->getModulePath() . 'views/img/Youtube.svg',
                ],
                'instagram' => [
                    'url' => '',
                    'img_src' => $this->getModulePath() . 'views/img/Insta.svg',
                ]
            ]*/
        ];
    }

    public function isUsingNewTranslationSystem()
    {
        return true;
    }


    public function getModulePath()
    {
        return '/modules/'.$this->name.'/';
    }

    /**
     * @return string
     */
    public function hookDisplaySocialButtons()
    {
        $social = [
            'youtube' => [
                'url' => '',
                'img_src' => $this->getModulePath() . 'views/img/Youtube.svg',
            ],
            'instagram' => [
                'url' => '',
                'img_src' => $this->getModulePath() . 'views/img/Insta.svg',
            ]
        ];
        $this->context->smarty->assign('social', $social);

        return $this->fetch('module:hs_topmenu/views/templates/widget/social.tpl');
    }

    /**
     * @return string
     */
    public function hookDisplaySubShopsBlocks()
    {
        $modulesShops = $this->getHarkShops();
        $this->context->smarty->assign('shops', $modulesShops);

        return $this->fetch('module:hs_topmenu/views/templates/widget/footer_addresses.tpl');
    }

    protected function getHarkShops() {
        $stores = Store::getStores($this->context->language->id);

        $shopList = Context::getContext()->shop->getShops(false, true);
        $moduleShops = [];

        $moduleShops['current_shop_id'] = Context::getContext()->shop->id;
        foreach ($shopList as $key => $shop) {
            if($key == 1) {
                $moduleShops['mainShop']['id'] = $shop['id_shop'];
                $moduleShops['mainShop']['logo'] = $this->getModulePath() . 'views/img/Hark.svg';

                $moduleShops['mainShop']['url'] =  $shop['uri'];
                continue;
            }

            if ($shop['theme_name'] === 'hark-repair') {
                foreach ($stores as $store) {
                    if ($store['name'] === 'repair') {
                        $moduleShops['subshops'][] = [
                            'id' => $shop['id_shop'],
                            'name' => 'Repair',
                            'logo' => $this->getModulePath() . 'views/img/repair.svg',
                            'url' =>  $shop['uri'],
                            'address1' => $store['address1'],
                            'address2' => $store['address2'],
                            'phone' => $store['phone'],
                            'email' => $store['email']
                        ];
                    }
                }

            } else {
                foreach ($stores as $store) {
                    if ($store['name'] === 'records') {
                        $moduleShops['subshops'][] = [
                            'id' => $shop['id_shop'],
                            'name' => 'Records',
                            'logo' => $this->getModulePath() . 'views/img/records.svg' ,
                            'url' =>  $shop['uri'],
                            'address1' => $store['address1'],
                            'address2' => $store['address2'],
                            'phone' => $store['phone'],
                            'email' => $store['email']
                        ];
                    }
                }
            }
        }

        return $moduleShops;
    }
}