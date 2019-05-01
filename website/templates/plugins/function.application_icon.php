<?php

require_once SMARTY_PLUGINS_DIR.'modifier.escape.php';

/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.application_icon.php
 * Type:     function
 * Name:     application_icon
 * Purpose:  outputs a icon for an application
 * -------------------------------------------------------------
 */
function smarty_function_application_icon(array $params, Smarty_Internal_Template $template) {
    if (!in_array('app', array_keys($params)) || empty($params['app']) || $params['app'] == 'www') {
        return;
    }
    $title = $params['app'];
    if (in_array('app_ver', array_keys($params)) || empty($params['app_ver'])) {
        $title .= ' '.$params['app_ver'];
    }
    $title = htmlspecialchars($title, ENT_QUOTES, 'UTF-8');

    return '<img src="'.CONFIG_CDN_IMAGES.'/api/icons/16/'.smarty_modifier_escape($params['app'], 'url').'.png" title="'.smarty_modifier_escape($title).'">';
}
