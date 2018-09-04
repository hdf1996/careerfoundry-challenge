source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'


group :development, :test do
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'rubocop', '~> 0.58.2'
  gem 'faker', '~> 1.9.1'
  gem 'factory_bot_rails', '~> 4.11.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
