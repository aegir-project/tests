core = 7.x
api = 2

projects[drupal][type] = "core"

# Travis docker-compose.yml puts hosting module at /source/hostmaster
projects[hostmaster][type] = "profile"
projects[hostmaster][version] = "7.x-3.x"

# Travis docker-compose.yml puts hosting module at /source/hosting
projects[hosting][type] = "module"
projects[hosting][subdir] = "aegir"
projects[hosting][download][type] = "copy"
projects[hosting][download][url] = "/source/hosting"
