source 'https://rubygems.org'

gem 'coverband'

gem 'addressable'
gem 'allowy'
gem 'cf-copilot', '0.0.13'
gem 'clockwork', require: false
gem 'cloudfront-signer'
gem 'em-http-request', '~> 1.1'
gem 'eventmachine', '~> 1.0.9'
gem 'googleapis-common-protos'
gem 'hashdiff'
gem 'httpclient'
gem 'json-schema'
gem 'json_pure'
gem 'loggregator_emitter', '~> 5.0'
gem 'membrane', '~> 1.0'
gem 'mime-types', '~> 3.0'
gem 'multi_json'
gem 'multipart-parser'
gem 'net-ssh'
gem 'netaddr'
gem 'newrelic_rpm'
gem 'nokogiri'
gem 'palm_civet'
gem 'posix-spawn', '~> 0.3.6'
gem 'protobuf', '3.6.12'
gem 'public_suffix'
gem 'rake'
gem 'rfc822'
gem 'rubyzip'
gem 'sequel', '~> 5.0'
gem 'sinatra', '~> 2.0'
gem 'sinatra-contrib'
gem 'statsd-ruby', '~> 1.4.0'
gem 'steno'
gem 'talentbox-delayed_job_sequel', '~> 4.3.0'
gem 'thin'
gem 'unf'
gem 'vmstat', '~> 2.0'
gem 'yajl-ruby'

# Rails Components
gem 'actionpack', '~> 5.2.0'
gem 'actionview', '~> 5.2.0'
gem 'activemodel', '~> 5.2.0'
gem 'railties', '~> 5.2.0'

# Blobstore and Bits Service Dependencies
gem 'azure-storage', '0.14.0.preview' # https://github.com/Azure/azure-storage-ruby/issues/122
gem 'bits_service_client', '~> 3.0'
gem 'fog-aliyun'
gem 'fog-aws'
gem 'fog-azure-rm', git: 'https://github.com/fog/fog-azure-rm.git', branch: 'fog-arm-cf'
gem 'fog-google'
gem 'fog-local'
gem 'fog-openstack'

gem 'cf-uaa-lib', '~> 3.14.0'
gem 'vcap-concurrency', git: 'https://github.com/cloudfoundry/vcap-concurrency.git', ref: '2a5b0179'

gem 'cf-perm', '~> 0.0.10'
gem 'scientist', '~> 1.1.0'

group :db do
  gem 'mysql2', '~> 0.4.10' # 0.4.x works with Rails 4.2.5-5.x, 0.5.x works with Rails 5.0.7, 5.1.6, and higher
  gem 'pg'
end

group :operations do
  gem 'awesome_print'
  gem 'pry-byebug'
end

group :test do
  gem 'cf-perm-test-helpers', '~> 0.0.6'
  gem 'codeclimate-test-reporter', require: false
  gem 'machinist', '~> 1.0.6'
  gem 'parallel_tests'
  gem 'rack-test'
  gem 'rspec', '~> 3.8.0'
  gem 'rspec-collection_matchers'
  gem 'rspec-instafail'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'rspec-wait'
  gem 'rspec_api_documentation'
  gem 'rubocop'
  gem 'timecop'
  gem 'webmock', '> 2.3.1'
end

group :development do
  gem 'byebug'
  gem 'debase', '>= 0.2.2.beta14'
  gem 'listen'
  gem 'roodi'
  gem 'ruby-debug-ide', '>= 0.7.0.beta4'
  gem 'solargraph'
  gem 'spork', git: 'https://github.com/sporkrb/spork', ref: '224df49' # '~> 1.0rc'
end
