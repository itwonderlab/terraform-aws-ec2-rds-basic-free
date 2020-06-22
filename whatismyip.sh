#!/bin/bash
# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

set -e
INTERNETIP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo $(jq -n --arg internetip "$INTERNETIP" '{"internet_ip":$internetip}')
