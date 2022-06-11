<?php

namespace GeoKrety\Service;

use Exception;
use GeoKrety\Service\Xml\Error;
use Prefab;

/**
 * Exception thrown if a rate limit is reached.
 */
class RateLimitExceeded extends Exception {
}

class RateLimit extends Prefab {
    private const RATE_KEY = 'RATE_LIMIT_API';

    /**
     * Count requests and report error as GKXML Error.
     *
     * @param string      $name Limit name
     * @param string|null $key  User identifier
     *
     * @return void
     */
    public static function check_rate_limit_raw(string $name, ?string $key = null) {
        try {
            self::incr($name, $key);
        } catch (RateLimitExceeded $e) {
            echo _('Rate limit exceeded');
            http_response_code(429);
            exit();
        }
    }

    /**
     * Count requests and report error as GKXML Error.
     *
     * @param string      $name Limit name
     * @param string|null $key  User identifier
     *
     * @return void
     */
    public static function check_rate_limit_xml(string $name, ?string $key = null) {
        try {
            self::incr($name, $key);
        } catch (RateLimitExceeded $e) {
            Error::buildError(false, [_('Rate limit exceeded')]);
            http_response_code(429);
            exit();
        }
    }

    /**
     * @param string      $name Limit name
     * @param string|null $key  User identifier
     *
     * @throws \GeoKrety\Service\RateLimitExceeded
     */
    public static function incr(string $name, ?string $key = null) {
        /** @var \GeoKrety\Service\Redis $redis */
        $redis = Redis::instance();
        try {
            $redis->ensureOpenConnection();
        } catch (StorageException $e) {
            // Let users pass if redis is failing
            // TODO log error, notify admin?
            return;
        }

        $rate_key = sprintf('%s__%s__', self::RATE_KEY, $name);
        if (!is_null($key)) {
            $rate_key .= $key;
        } else {
            $rate_key .= \Base::instance()->get('IP');
        }

        if (!$redis->exists($rate_key)) {
            $redis->set($rate_key, 1);
            $redis->expire($rate_key, GK_RATE_LIMITS[$name][1]);
        } else {
            $redis->incr($rate_key);
            $total_user_calls = $redis->get($rate_key);
            if ($total_user_calls > GK_RATE_LIMITS[$name][0]) {
                // TODO notify admin?
                throw new RateLimitExceeded();
            }
        }
    }

    /**
     * @throws \GeoKrety\Service\StorageException
     */
    public static function get_rates_limits_usage(string $query = '*'): array {
        /** @var \GeoKrety\Service\Redis $redis */
        $redis = Redis::instance();
        $redis->ensureOpenConnection();
        $allKeys = $redis->keys(sprintf('%s__%s', self::RATE_KEY, $query));
        $response = [];
        foreach ($allKeys as $key) {
            $val = $redis->get($key);
            if (preg_match('/^'.self::RATE_KEY.'__(.*)__(.*)$/', $key, $matches) === false or !array_key_exists($matches[1], GK_RATE_LIMITS)) {
                $redis->del($key);
                continue;
            }
            $response[$matches[1]][$matches[2]] = $val;
        }

        return $response;
    }
}