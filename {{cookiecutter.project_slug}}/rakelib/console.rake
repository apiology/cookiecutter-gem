# frozen_string_literal: true

desc 'Load up {{cookiecutter.project_slug}} in pry'
task :console do |_t|
  exec 'pry -I lib -r {{cookiecutter.project_slug}}'
end
