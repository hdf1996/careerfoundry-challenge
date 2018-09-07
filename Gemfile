source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'httparty'

group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'rubocop', '~> 0.58.2'
  gem 'faker', '~> 1.9.1'
  gem 'factory_bot_rails', '~> 4.11.0'
  gem 'webmock', '~> 3.0.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
