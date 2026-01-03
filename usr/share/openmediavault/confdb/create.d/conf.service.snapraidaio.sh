#!/bin/sh
#
# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    OpenMediaVault Plugin Developers <plugins@omv-extras.org>
# @copyright Copyright (c) 2025-2026 openmediavault plugin developers
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

. /usr/share/openmediavault/scripts/helper-functions

SERVICE_XPATH_NAME="snapraidaio"
SERVICE_XPATH="/config/services/${SERVICE_XPATH_NAME}"

if ! omv_config_exists "${SERVICE_XPATH}"; then
    omv_config_add_node "/config/services" "${SERVICE_XPATH_NAME}"

    # Notification settings
    omv_config_add_key "${SERVICE_XPATH}" "email_address" ""
    omv_config_add_key "${SERVICE_XPATH}" "from_email_address" ""
    omv_config_add_key "${SERVICE_XPATH}" "check_updates" "1"

    omv_config_add_key "${SERVICE_XPATH}" "healthchecks" "0"
    omv_config_add_key "${SERVICE_XPATH}" "healthchecks_id" ""
    omv_config_add_key "${SERVICE_XPATH}" "healthchecks_url" "https://hc-ping.com/"

    omv_config_add_key "${SERVICE_XPATH}" "telegram" "0"
    omv_config_add_key "${SERVICE_XPATH}" "telegram_token" ""
    omv_config_add_key "${SERVICE_XPATH}" "telegram_chat_id" ""

    omv_config_add_key "${SERVICE_XPATH}" "discord" "0"
    omv_config_add_key "${SERVICE_XPATH}" "discord_webhook_url" ""

    omv_config_add_key "${SERVICE_XPATH}" "hook_notification" ""

    # SnapRAID thresholds & scrub
    omv_config_add_key "${SERVICE_XPATH}" "del_threshold" "500"
    omv_config_add_key "${SERVICE_XPATH}" "up_threshold" "500"
    omv_config_add_key "${SERVICE_XPATH}" "add_del_threshold" "0"

    omv_config_add_key "${SERVICE_XPATH}" "sync_warn_threshold" "-1"

    omv_config_add_key "${SERVICE_XPATH}" "scrub_percent" "5"
    omv_config_add_key "${SERVICE_XPATH}" "scrub_age" "10"
    omv_config_add_key "${SERVICE_XPATH}" "scrub_new" "0"
    omv_config_add_key "${SERVICE_XPATH}" "scrub_delayed_run" "0"

    omv_config_add_key "${SERVICE_XPATH}" "prehash" "1"
    omv_config_add_key "${SERVICE_XPATH}" "force_zero" "0"
    omv_config_add_key "${SERVICE_XPATH}" "spindown" "0"

    omv_config_add_key "${SERVICE_XPATH}" "verbosity" "0"

    omv_config_add_key "${SERVICE_XPATH}" "retention_days" "0"
    omv_config_add_key "${SERVICE_XPATH}" "snapraid_log_dir" "\$HOME"

    omv_config_add_key "${SERVICE_XPATH}" "smart_log" "1"
    omv_config_add_key "${SERVICE_XPATH}" "smart_log_notify" "0"

    omv_config_add_key "${SERVICE_XPATH}" "snap_status" "0"
    omv_config_add_key "${SERVICE_XPATH}" "snap_status_notify" "0"

    omv_config_add_key "${SERVICE_XPATH}" "snapraid_conf" "/etc/snapraid.conf"

    # Docker / service management
    omv_config_add_key "${SERVICE_XPATH}" "manage_services" "0"
    omv_config_add_key "${SERVICE_XPATH}" "docker_mode" "1"

    omv_config_add_key "${SERVICE_XPATH}" "docker_local" "0"
    omv_config_add_key "${SERVICE_XPATH}" "services" "container1 container2 container3"

    # Custom hooks
    omv_config_add_key "${SERVICE_XPATH}" "custom_hook" "0"

    omv_config_add_key "${SERVICE_XPATH}" "before_hook_name" ""
    omv_config_add_key "${SERVICE_XPATH}" "before_hook_cmd" ""

    omv_config_add_key "${SERVICE_XPATH}" "after_hook_name" ""
    omv_config_add_key "${SERVICE_XPATH}" "after_hook_cmd" ""
fi

exit 0
