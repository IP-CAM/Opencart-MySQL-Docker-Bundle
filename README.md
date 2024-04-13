
# OpenCart & MySQL Docker Bundle

Welcome to our Docker repository, featuring a ready-to-use bundle with OpenCart and MySQL! This setup is designed to help you quickly deploy your OpenCart website using Docker containers.

## What's Included

- **OpenCart**: A free, open-source e-commerce platform for online merchants.
- **MySQL**: A robust, scalable, and reliable SQL database server to manage OpenCart's data.

## Prerequisites

Before you begin, make sure you have Docker and Docker Compose installed on your system. For installation instructions, refer to the [official Docker documentation](https://docs.docker.com/get-docker/).

## Getting Started

1. **Check OpenCart Version**: Before proceeding, ensure that the OpenCart version specified in the `Dockerfile` meets your requirements. The version is defined where the OpenCart archive is downloaded.

2. **Configure Database Settings**: You need to set the necessary environment variables for the MySQL database in the `db_config.env` file. This file includes settings such as the database name, user, and password.

    Example `db_config.env` content:
    ```env
    MYSQL_USER=opencart
    MYSQL_PASSWORD=your_password
    MYSQL_DATABASE=opencart
    ```

3. **Build and Run Containers**: With Docker and Docker Compose installed, and your environment variables set, you can build and run your containers using the following command from the root of the project:
    ```bash
    docker-compose up -d
    ```

    This command will start the OpenCart and MySQL containers in detached mode.

4. **Access OpenCart**: After the containers are up and running, you can access the OpenCart installation through your web browser by navigating to `http://localhost:8080` (adjust the port if you've customized it in your `docker-compose.yml`).

5. **Follow OpenCart Installation**: Complete the OpenCart installation by following the on-screen instructions. Use the database settings you specified in `db_config.env`.

## Using Bitnami Images

For those who prefer a pre-configured setup, you can use the Bitnami Docker images available in the `bitnami` folder. Simply configure the `opencart_config.env` and `db_config.env` files with your specific settings:

### opencart_config.env
```env
OPENCART_DATABASE_HOST=mysql
OPENCART_DATABASE_PORT_NUMBER=3306
OPENCART_DATABASE_USER=test
OPENCART_DATABASE_NAME=test
OPENCART_DATABASE_PASSWORD=test
# Administrator of OpenCart
OPENCART_USERNAME=test
OPENCART_PASSWORD=test
```

### db_config.env
```env
MYSQL_ROOT_PASSWORD=test
MYSQL_USER=test
MYSQL_PASSWORD=test
MYSQL_DATABASE=test
```

Navigate to the `bitnami` folder and use Docker Compose to start your containers:
```bash
docker-compose up -d
```

## Customization

- To customize OpenCart or MySQL versions, adjust the respective lines in the `Dockerfile` and `docker-compose.yml`.
- For advanced configurations, refer to the official documentation of [OpenCart](https://www.opencart.com) and [MySQL Docker images](https://hub.docker.com/_/mysql).

## Support

If you encounter any issues or have questions, please file an issue in this repository.
