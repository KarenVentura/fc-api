# FC - Rails API

Comenzemos, corre esta API localmente!

# FC es una API en Ruby on Rails API con la versión de Ruby 2.7.1 y Rails 6.0.3

Para comenzar necesitaras instalar Ruby en tu sistema. La forma más facil de hacerlo es con un manejador de versions de Ruby.

El manejador de las versiones de Ruby que usaremos se llama rbenv, sigue las instrucciones en el siguiente link:

[RBENV](https://github.com/rbenv/rbenv)

Una vez que tenemos instalado rbenv, necesitamos instalar ruby, corre lo siguiente:

`rbenv install 2.7.1`

`rbenv local 2.7.1`

`gem install bundler`

Ahora clona el proyecto. Una vez dentro de la carpeta corre lo siguiente:

`bundle install`

Todas las dependencias fueron instaladas, ahora ya puedes correr el servidor, para esto debes estar dentro de la carpeta del proyecto.

`rails server`

Tu instalación está lista y corre en http://localhost:3000/

Verifica que las pruebas estén verdes con el siguiente comando:

`rails test`

# Si quieres checar la api corriendo en producción, ve aquí:

[FC-API](https://resuelve-fc-api.herokuapp.com/)
