# Question::SimpleChoice

## Haniel Y María

Implementar una clase Ruby para representar y gestionar listas enlazadas que se puedan recorrer en ambos sentidos.

#### Pruebas:


## Installation

Add this line to your application's Gemfile:

    gem 'question-simple_choice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install question-simple_choice

## Usar

Utilizar la herramienta Guard de Comprobación Continua con el código Ruby desarrollado.

Se ha de configurar de manera que permita la ejecuci´on de las pruebas definidas con Rspec cuando se modifiquen.

- Añadir Guard como una dependencia de desarrollo en el fichero de especificaciones de la gema .gemspec.

    spec.add_development_dependency "guard"
    spec.add_development_dependency "guard-rspec"
    spec.add_development_dependency "guard-bundler"

- Instalar Guard a través de Bundler.

    bundle install

- Generar un fichero de guardia por defecto (Guardfile).

    bundle exec guard init

- Ejecutar Guard a través de Bundler en una terminal.

    bundle exec guard

## Contributing

1. Fork it ( https://github.com/[my-github-username]/question-simple_choice/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
