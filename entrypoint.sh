#!/bin/bash

# Note that this does not use pipefail
# because if the grep later doesn't match any deleted files,
# which is likely the majority case,
# it does not exit with a 0, and I only care about the final exit.
set -eo

sudo systemctl start mysql.service
sudo chmod +x bin/install-wp-tests.sh
bin/install-wp-tests.sh wordpress_test root 'root' localhost $WP_VERSION
composer global require "phpunit/phpunit=5.7.*"
phpunit