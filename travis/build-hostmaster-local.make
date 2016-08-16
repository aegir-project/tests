core = 7.x
api = 2

projects[drupal][type] = "core"

# Travis docker-compose.yml puts hosting module at /source/hostmaster
projects[hostmaster][type] = "profile"
projects[hostmaster][download][type] = "copy"
projects[hostmaster][download][url] = "/source/hostmaster

# @TODO: This can be removed once we figure out https://github.com/drush-ops/drush/issues/2311
projects[hostmaster][contrib_destination] = "profiles"

# Travis docker-compose.yml puts hosting module at /source/hosting
# projects[hosting][type] = "module"
# projects[hosting][subdir] = "aegir"
# projects[hosting][download][type] = "copy"
# projects[hosting][download][url] = "/source/hosting"
