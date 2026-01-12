# PostWave: Production-Ready Full-Stack Web Application

![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-API-red.svg)
![React](https://img.shields.io/badge/Frontend-HTML%2FCSS%2FJS-blue.svg)
![Docker](https://img.shields.io/badge/Deployment-Docker-blue.svg)
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-green.svg)
![JWT Auth](https://img.shields.io/badge/Authentication-JWT-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Overview

PostWave is a production-ready full-stack web application designed to demonstrate a robust and scalable architecture. It features a powerful Ruby on Rails API backend, a lightweight HTML/CSS/JS frontend, and a comprehensive deployment setup using Docker, PostgreSQL, and Nginx.

This project serves as an excellent boilerplate for developers looking to build secure, authenticated web applications with modern deployment practices.

## Features

*   **Ruby on Rails API**: A RESTful API built with Ruby on Rails, providing a solid backend foundation.
*   **JWT Authentication**: Secure user authentication and authorization using JSON Web Tokens (JWT).
*   **User Management**: Functionality for user registration and login.
*   **Posts & Comments CRUD**: Complete Create, Read, Update, Delete (CRUD) operations for posts and comments.
*   **Lightweight Frontend**: A simple yet effective HTML/CSS/JS frontend to interact with the API.
*   **Dockerized Deployment**: Includes Docker setup for easy containerization and deployment.
*   **PostgreSQL Integration**: Utilizes PostgreSQL as the primary database for reliable data storage.
*   **Nginx Reverse Proxy**: Configured with Nginx as a reverse proxy for efficient request handling and production deployment.

## Technologies

*   **Backend**: Ruby on Rails
*   **Frontend**: HTML, CSS, JavaScript
*   **Database**: PostgreSQL
*   **Authentication**: JWT (JSON Web Tokens)
*   **Deployment**: Docker, Nginx

## Setup & Installation

To get PostWave up and running on your local machine, follow these steps:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/BlackOussema/PostWave.git
    cd PostWave
    ```

2.  **Docker Setup (Recommended)**:
    Ensure you have Docker and Docker Compose installed. Then, build and run the containers:
    ```bash
    docker-compose build
    docker-compose up
    ```
    This will set up the Rails API, PostgreSQL database, and Nginx reverse proxy.

3.  **Database Setup**:
    Once the containers are running, you might need to set up the database. Access the Rails container and run migrations:
    ```bash
    docker-compose exec web rails db:create db:migrate
    ```

4.  **Access the Application**:
    The application should be accessible via your web browser at `http://localhost` (or the port configured in your Nginx setup).

## Usage

*   **Register/Login**: Create a new user account or log in using existing credentials.
*   **Create Posts**: Authenticated users can create new posts.
*   **Comment on Posts**: Users can add comments to existing posts.
*   **Manage Content**: Edit or delete your own posts and comments.

## Contribution

Contributions are welcome! If you have suggestions for improvements, new features, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any inquiries or support, please contact [oussemaghariani17@gmail.com](mailto:oussemaghariani17@gmail.com).
