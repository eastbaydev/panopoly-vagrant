# Install Drupal dev tools.
require_recipe "apt"
require_recipe "build-essential"

# Install Git, since Drupal devs probably need that.
package 'git-core'
package 'curl'
package 'unzip'
# Install Repo, which will be necessary for Panopoly installation
bash "install-repo" do
  code <<-EOH
  curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > /usr/bin/repo
  chmod a+x /usr/bin/repo
  EOH
end

php_pear "xdebug" do
  action :install
end

template "/etc/php5/apache2/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[apache2]"), :delayed
end
