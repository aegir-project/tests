core = 7.x
api = 2

projects[drupal][type] = "core"

# Travis docker-compose.yml puts hosting module at /source/hostmaster
projects[hostmaster][type] = "profile"
projects[hostmaster][download][type] = "copy"
projects[hostmaster][download][url] = "/source/hostmaster"

# Travis docker-compose.yml puts hosting module at /source/hosting
projects[hosting][type] = "module"
projects[hosting][subdir] = "aegir"
projects[hosting][download][type] = "copy"
projects[hosting][download][url] = "/source/hosting"

# Copy modules from source
projects[source_modules][type] = "module"
projects[source_modules][download][type] = "copy"
projects[source_modules][download][url] = "/source/modules"

# Copy modules from source
projects[source_themes][type] = "theme"
projects[source_themes][download][type] = "copy"
projects[source_themes][download][url] = "/source/themes"
