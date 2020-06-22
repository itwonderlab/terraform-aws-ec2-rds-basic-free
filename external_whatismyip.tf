# Copyright (C) 2018 - 2020 IT Wonder Lab (https://www.itwonderlab.com)
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

#-----------------------------------------
# Obtain current Public Internet IP
#-----------------------------------------

data "external" "whatismyip" {
  program = ["/bin/bash" , "${path.module}/whatismyip.sh"]
}
