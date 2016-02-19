$: << File.expand_path('../lib', __dir__)
require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'graphql_reloader'
Bundler.require(*Rails.groups)

module GraphqlBlogRails5
  class Application < Rails::Application
    config.middleware.use GraphQLReloader
    config.autoload_paths << Rails.root.join('app/graph')
    config.autoload_paths << Rails.root.join('app/lib')
    config.autoload_paths << Rails.root.join('app/graph/mutations')
    config.autoload_paths << Rails.root.join('app/graph/types')
    config.active_record.raise_in_transactional_callbacks = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.schema_format = :sql

    # Configure rails g to skip helper/assets files
    config.generators do |g|
      g.assets = false
      g.helper = false
      g.view_specs      false
      g.helper_specs    false
    end
  end
end
