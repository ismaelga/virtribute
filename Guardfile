notification :tmux, :success => 'white'

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'ctags-bundler', :src_path => ["lib", "spec/support"] do
  watch(/^(lib|spec\/support)\/.*\.rb$/)
  watch('Gemfile.lock')
end
