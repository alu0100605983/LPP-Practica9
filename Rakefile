require "bundler/gem_tasks"

task :default => :spec

desc "Instalar gema question-simple_choice"
task :install do
    sh "gem install question-simple_choice" 
end

desc "Crear estructura de la gema"
task :build do
   sh "bundle gem question-simple_choice"
end

desc "Prueba las pruebas"
task :spec do
   sh "rspec -I. -Ilib -Ispec spec/simple_choice_spec.rb"
end

desc "Documentacion pruebas"
task :test do
  sh "rspec -Ilib spec/simple_choice_spec.rb --format documentation"
end

desc "Formato HTML Test"
task :thtml do
   sh "bundle exec ruby lib/question/simple_choice.rb > web.html"
end