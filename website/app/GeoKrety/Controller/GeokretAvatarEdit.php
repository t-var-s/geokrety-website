<?php

namespace GeoKrety\Controller;

use GeoKrety\Model\Picture;
use GeoKrety\Service\Smarty;

class GeokretAvatarEdit extends Base {
    use \PictureLoader;

    public function _get(\Base $f3) {
        // Restore saved caption
        $save_geokret_avatar_caption = filter_var($f3->get('SESSION.save_geokret_avatar_caption'), FILTER_VALIDATE_BOOLEAN);
        Smarty::assign('save_geokret_avatar_caption', $save_geokret_avatar_caption);
        if ($save_geokret_avatar_caption && empty($this->picture->caption)) {
            $this->picture->caption = $f3->get('SESSION.saved_geokret_avatar_caption');
        }
    }

    public function get(\Base $f3) {
        $this->_get($f3);
        Smarty::render('extends:full_screen_modal.tpl|dialog/geokret_avatar_edit.tpl');
    }

    public function get_ajax(\Base $f3) {
        $this->_get($f3);
        Smarty::render('extends:base_modal.tpl|dialog/geokret_avatar_edit.tpl');
    }

    public function post(\Base $f3) {
        $this->_get($f3);
        $this->picture->caption = $f3->get('POST.caption');

        if ($this->picture->validate()) {
            $this->picture->update();
            \Event::instance()->emit('geokret.avatar.image.caption.saved', $this->picture);
            \Flash::instance()->addMessage(_('Picture caption saved.'), 'success');

            // Save picture caption
            if (filter_var($f3->get('POST.save_geokret_avatar_caption'), FILTER_VALIDATE_BOOLEAN)) {
                $f3->set('SESSION.save_geokret_avatar_caption', true, GK_SITE_CACHE_TTL_PICTURE_CAPTION);
                $f3->set('SESSION.saved_geokret_avatar_caption', $this->picture->caption, GK_SITE_CACHE_TTL_PICTURE_CAPTION);
            } else {
                $f3->clear('SESSION.save_geokret_avatar_caption');
                $f3->clear('SESSION.saved_geokret_avatar_caption');
            }

            $f3->reroute('@geokret_details(@gkid='.$this->picture->geokret->gkid.')#gk-avatars-list');
        }

        Smarty::render('extends:full_screen_modal.tpl|dialog/geokret_avatar_edit.tpl');
    }
}