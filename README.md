# Professor Moo 🐄 — Fortune-Telling Web App

Professor Moo is a fun full stuck webapp that generate random fortune using Linux fortune utility. It uses HTMX to, Bash CGI scripts, Apache HTTPD, MySQL, Docker Compose, and Caddy (reverse proxy).
User can save their favorite fortunes in MySQL, download them or clear the database.  

## Installation

Clone the repo

```bash
https://github.com/Ishihab/Professor_Moo.git
```

## Usage
Start the containers
```bash
docker compose up --build
```
Access the app
```bash
http://localhost:8080
```
## License

[MIT](https://choosealicense.com/licenses/mit/)