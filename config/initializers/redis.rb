# Useful for lower-caching when necessary
$redis = Redis::Namespace.new(:redis => Redis.new)