# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# ---------------------------------------------------
# ROUTE 53 Reusable Delegation Set
# By default, each hosted zone that you create gets a different set of four name
# servers—a different delegation set. If you create a lot of hosted zones,
# maintaining different delegation sets can be difficult and time consuming.
# Route 53 lets you create a delegation set that you can reuse with multiple hosted zones.
# ---------------------------------------------------

variable reference_name {}
