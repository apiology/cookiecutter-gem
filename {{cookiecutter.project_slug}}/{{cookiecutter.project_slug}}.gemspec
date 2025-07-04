# coding: ascii
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require '{{ cookiecutter.project_slug }}/version'

Gem::Specification.new do |spec|
  spec.name          = '{{ cookiecutter.project_slug }}'
  spec.version       = {{ cookiecutter.module_name }}::VERSION
  spec.authors       = ["{{ cookiecutter.full_name.replace('\"', '\\\"') }}"]
  spec.email         = ['{{ cookiecutter.email }}']
  spec.summary       = "{{ cookiecutter.project_short_description.replace('\"', '\\\"') }}"
  spec.homepage      = 'https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}'
  spec.license       = '{{ cookiecutter.open_source_license }}'
  spec.required_ruby_version = '>= 3.2'

  spec.files         = Dir['README.md',
                           'Rakefile',
                           'lib/{{cookiecutter.project_slug}}.rb',
                           '{lib}/**/*',
                           'sig/**/*.rbs',
                           'sig/*.rbs',
                           'rbi/**/*.rbi',
                           'rbi/*.rbi',
                           '{exe}/*',
                           '{{cookiecutter.project_slug}}.gemspec']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # spec.add_dependency 'activesupport'
{% if cookiecutter.use_checkoff == 'Yes' %}  spec.add_dependency 'redis'
{% endif %}

  spec.metadata = {
    'rubygems_mfa_required' => 'true',
  }
end
