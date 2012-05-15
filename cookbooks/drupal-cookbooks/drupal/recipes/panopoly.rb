# Installs Panopoly codebase on the Drupal codebase
# TODO Move this to a definition with parameters.
require_recipe "mysql"
require_recipe "drush"
require_recipe "drush_make"

case node[:platform]
when "debian", "ubuntu"
	#Run commands to get latest panopoly in drupal root
	bash "get-latest-panopoly" do
    code <<-EOH
    cd /vagrant/public/drupal.vbox.local/www
		repo init -u git://github.com/populist/panopoly_manifest.git
		repo sync
		EOH
  end

  #Run drush make to install panopoly codebase
  bash "install-panopoly-modules" do
    code <<-EOH
    cd /vagrant/public/drupal.vbox.local/www
    mkdir profiles/panopoly/modules
    mkdir profiles/panopoly/modules/contrib
    drush make --no-core --contrib-destination=profiles/panopoly profiles/panopoly/build-panopoly.make
		EOH
  end

end
