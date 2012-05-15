name "lamp_varnish_drupal_dev"
description "A LAMP + Varnish + Memcached stack for Drupal similar to Mercury
with development tools."
run_list(
  "role[apache2_mod_php]",
  "role[apache2_backend]",
  "role[drupal_dev]",
  "role[drupal]",
  "recipe[drupal::panopoly]",
  "role[memcached]",
  "role[mysql_server]",
  "role[varnish_frontend]",
  "recipe[drupal::drupal_apps]"
)
# TODO Add recipe to create dev sites via Drush make.
