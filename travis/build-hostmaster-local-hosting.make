core = 7.x
api = 2

projects[drupal][type] = "core"

# Load 3.x branch of hostmaster.
projects[hostmaster][type] = "profile"
projects[hostmaster][version] = "3.x"

# Override source of hosting module download.
# Travis docker-compose-hosting.yml puts hosting module at /source/hosting
projects[hosting][type] = "module"
projects[hosting][subdir] = "aegir"
projects[hosting][download][type] = "copy"
projects[hosting][download][url] = "/source/hosting"
