# Load Dragonfly if it isn't loaded already.
require "dragonfly"

Dragonfly.app(:ckeditor).configure do
  plugin :imagemagick
  secret "4f8cc3d6d99cee0d26c743acc62e4587e14a689078482b9e9622baebb8cb13f2"

  # Store files in public/uploads/ckeditor. This is not
  # mandatory and the files don't even have to be stored under
  # public. See http://markevans.github.io/dragonfly/data-stores
  datastore :file,
    root_path: Rails.root.join("public", "uploads", "ckeditor", Rails.env).to_s,
    server_root: 'public'

  # Accept asset requests on /ckeditor_assets. Again, this path is
  # not mandatory. Just be sure to include :job somewhere.
  url_format "/uploads/ckeditor/:job/:basename.:format"
end

Rails.application.middleware.use Dragonfly::Middleware, :ckeditor
