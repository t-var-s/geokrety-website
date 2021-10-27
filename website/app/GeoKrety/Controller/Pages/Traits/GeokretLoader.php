<?php

namespace GeoKrety\Traits;

use GeoKrety\Model\Geokret;
use GeoKrety\Service\Smarty;

trait GeokretLoader {
    /**
     * @var Geokret
     */
    protected $geokret;

    public function beforeRoute(\Base $f3) {
        parent::beforeRoute($f3);
        $gkid = $f3->get('PARAMS.gkid');
        $gkid = Geokret::gkid2id($gkid);

        $geokret = new Geokret();
        $this->geokret = $geokret;
        $this->geokret->filter('owner_codes', ['adopter = ?', null]);
        $this->geokret->filter('avatars', ['uploaded_on_datetime != ?', null]);
        $this->filterHook();
        $geokret->load(['gkid = ?', $gkid]);
        if ($geokret->dry()) {
            http_response_code(404);
            Smarty::render('dialog/alert_404.tpl');
            exit();
        }
        Smarty::assign('geokret', $geokret);
    }

    protected function filterHook() {
        // empty
    }
}