Elior Concepts Application
========================

The Elior Concepts is an application created to show Elior restauration products for restaurants & canteens.

Requirements
------------

  * PHP 5.5.9 or higher; PHP 7.0 would be a best !
  * MySQL;
  * and the [usual Symfony application requirements](http://symfony.com/doc/current/reference/requirements.html).

If unsure about meeting these requirements, download the application and
browse the `http://localhost:8000/config.php` script to get more detailed
information.

Installation
------------

     $ git clone https://github.com/mobena/elior-concepts.git
     $ cd elior-concepts/
     $ composer install --no-interaction

You can even create the database and load the sample data from the command line:

     $ cd elior-concepts/
     $ bin/console doctrine:database:create
     $ bin/console doctrine:schema:create
     $ bin/console doctrine:fixtures:load

Or even better, just import latest sql extract from web/sql/ and import it in your "elior-concepts" database.

Usage
-----

There is no need to configure a virtual host in your web server to access the application.
Just use the built-in web server:

```bash
$ cd elior-concepts/
$ bin/console server:run
```

This command will start a web server for the Symfony application. Now you can
access the application in your browser at <http://localhost:8000>. You can
stop the built-in web server by pressing `Ctrl + C` while you're in the
terminal.

> **NOTE**
>
> If you want to use a fully-featured web server (like Nginx or Apache) to run
> application, configure it to point at the `web/` directory of the project.
> For more details, see:
> http://symfony.com/doc/current/cookbook/configuration/web_server_configuration.html

Developments
------------

Here are some tips to accelerate your developments.


    $ cd elior-concepts/
    $ bin/console doctrine:generate:entity
    $ bin/console doctrine:migrations:status
    $ bin/console doctrine:migrations:diff
    $ bin/console doctrine:migrations:migrate
    $ bin/console generate:doctrine:crud

Use with caution.