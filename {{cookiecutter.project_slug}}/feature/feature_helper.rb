# frozen_string_literal: true

require 'open3'
require '{{cookiecutter.project_slug}}'
require 'rspec'

# Add the bin directory, to allow testing of gem executables as if the gem is
# already installed.
root_dir = RSpec::Core::RubyProject.root
exec_dir = File.join(File::SEPARATOR, root_dir, 'bin')
# @sg-ignore
ENV['PATH'] = [exec_dir, ENV.fetch('PATH')].join(File::PATH_SEPARATOR)

# Courtesy of:
# https://raw.github.com/cupakromer/tao-of-tdd/master/adder/spec/support/
#    capture_exec.rb

# @sg-ignore
# @param cmd [Array<String>]
# @return [String]
def exec_io(*cmd)
  cmd = cmd.flatten
  # @sg-ignore
  all_out, _exit_code = Open3.capture2e(*cmd)

  all_out
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
  config.alias_it_should_behave_like_to :has_behavior
  config.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

# @return [void]
def let_double(*doubles)
  doubles.each do |double_sym|
    # @sg-ignore
    let(double_sym) { double(double_sym.to_s) }
  end
end
