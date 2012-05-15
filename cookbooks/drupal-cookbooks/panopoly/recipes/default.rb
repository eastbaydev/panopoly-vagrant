# Author:: Alec Reynolds <alec@eastbaywebshop.com>
# Cookbook Name::  panopoly
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
when "debian", "ubuntu"
  bash "install-panopoly" do
    code <<-EOH
(cd /tmp; wget http://ftp.drupal.org/files/projects/panopoly-7.x-4.5.tar.gz)
(cd /tmp; tar zxvf panopoly-7.x-4.5.tar.gz)
(cd /tmp; mv panopoly /usr/share/)
(ln -s /usr/share/panopoly/panopoly /usr/bin/panopoly)
(pear install Console_Table)
    EOH
    not_if { File.exists?("/usr/share/panopoly/panopoly") }
  end
end
