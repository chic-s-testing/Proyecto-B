# Proyecto B - chic-s testing

## Desarrollo con docker
### Requisitos
- `docker`
- `docker-compose`

### Instalación de ambiente de desarrollo con docker
1. Setear variables de entorno en un archivo `.env`:
    - `DB_USERNAME`
    - `DB_PASSWORD`
    - `DB_HOST`
2. Ejecutar `docker-compose build`: construye la imagen de la aplicación.
3. Ejecutar `docker-compose run --rm web rails db:create`: crea la base de datos.
4. Ejecutar `docker-compose run --rm web rails db:migrate`: corre las migraciones pendientes de la base de datos.
5. Ejecutar `docker-compose up`: levanta los servicios de docker en sus contenedores. Para este caso, la base de datos y el servidor de rails en el puerto 3000.
6. (Opcional) Si se obtiene un error de que webpacker no se encuentra instalado, correr lo siguiente: `docker-compose run --rm web rails webpacker:install`

#### Archivo .env de ejemplo para ejecutar con docker
```
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_HOST=db
```

### Comandos útiles
- `docker-compose build`: construye la imagen de la aplicación.
- `docker-compose up`: levanta los servicios de docker en sus contenedores. Para este caso, la base de datos y el servidor de rails en el puerto 3000.
- `docker-compose run --rm web <comando>`: corre un comando cualquiera en el ambiente de la aplicación dentro de un contenedor.

## Comandos de rails
- `rails db:create`: crea la base de datos en postgres. Es necesario ejecutar este comando si se corre por primera vez la aplicación.
- `rails db:migrate`: corre las migraciones pendientes de la base de datos.
- `rails db:drop`: elimina la base de datos.
- `rails db:reset`: resetea la base de datos.