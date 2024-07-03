# config/initializers/active_storage.rb
Rails.application.config.active_storage.resolve_model_overrides = true

# Adjust the maximum file size allowed (default is 100.megabytes)
Rails.application.config.active_storage.content_types_to_serve_as_binary.delete('image/svg+xml')
