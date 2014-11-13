require "bundler/gem_tasks"

task :default => :spec


desc "Prueba las pruebas"
task :spec do
   sh "rspec -I. -Ilib -Ispec spec/simple_choice_spec.rb"
end
