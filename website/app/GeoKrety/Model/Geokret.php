<?php

namespace GeoKrety\Model;

use GeoKrety\Service\HTMLPurifier;
use DB\SQL\Schema;

class Geokret extends Base {
    use \Validation\Traits\CortexTrait;

    protected $db = 'DB';
    protected $table = 'gk-geokrety';

    protected $fieldConf = array(
        'name' => array(
            'type' => Schema::DT_VARCHAR128,
            'filter' => 'trim|HTMLPurifier',
            'validate' => 'not_empty|min_len,3|max_len,75',
        ),
        'type' => array(
            'type' => Schema::DT_VARCHAR128,
            'filter' => 'trim',
            'validate' => 'geokrety_type',
            'index' => true,
        ),
        'tracking_code' => array(
            'type' => Schema::DT_VARCHAR128,
            'validate' => 'geokrety_type',
            'index' => true,
            'unique' => true,
        ),
        'mission' => array(
            'type' => Schema::DT_TEXT,
            'filter' => 'HTMLPurifier',
        ),
        'owner' => array(
            'belongs-to-one' => '\GeoKrety\Model\User',
        ),
        'holder' => array(
            'belongs-to-one' => '\GeoKrety\Model\User',
        ),
        'moves' => array(
            'has-many' => array('\GeoKrety\Model\Move', 'geokret'),
        ),
        // 'avatar' => array(
        //     'belongs-to-one' => '\GeoKrety\Model\GeokretAvatar',
        // ),
        'last_position' => array(
            'belongs-to-one' => '\GeoKrety\Model\Move',
        ),
        'last_log' => array(
            'belongs-to-one' => '\GeoKrety\Model\Move',
        ),
        'created_on_datetime' => array(
             'type' => Schema::DT_DATETIME,
        ),
        'moved_on_datetime' => array(
             'type' => Schema::DT_DATETIME,
        ),
        'updated_on_datetime' => array(
             'type' => Schema::DT_DATETIME,
        ),
    );

    // public function set_name($value) {
    //     return HTMLPurifier::getPurifier()->purify($value);
    // }
    //
    // public function set_mission($value) {
    //     return HTMLPurifier::getPurifier()->purify($value);
    // }

    public function get_type($value) {
        return new \GeoKrety\GeokretyType($value);
    }

    public function get_created_on_datetime($value) {
        return self::get_date_object($value);
    }

    public function get_updated_on_datetime($value) {
        return self::get_date_object($value);
    }

    public function __construct() {
        parent::__construct();
        $this->beforeinsert(function ($self) {
            // generate Tracking Code
            $seed = str_split('abcdefghjkmnpqrstuvwxyz23456789');
            shuffle($seed);
            $rand = '';
            foreach (array_rand($seed, GK_SITE_TRACKING_CODE_LENGTH) as $k) {
                $rand .= $seed[$k];
            }
            // TODO ensure unicity
            $self->tracking_code = strtoupper($rand);
        });
    }
}