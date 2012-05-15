maintainer       "Alec Reynolds"
maintainer_email "alec@eastbaywebshop.com"
license          "Apache 2.0"
description      "Installs panopoly head"
version          "0.9.0"
#depends           "php::pear"
#depends           "php::php5"
recipe "panopoly", "Installs panopoly head"

%w{ debian ubuntu arch }.each do |os|
  supports os
end
