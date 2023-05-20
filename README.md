# inflation-correction

## Setup environment

1. Clone the repository

    1.1. **HTTPS**

    ```bash
    git clone https://github.com/LucasVmigotto/inflation-correction.git
    ```

    1.1. **SSH**

    ```bash
    git clone git@github.com:LucasVmigotto/inflation-correction.git
    ```

2. Copy the `.env.example` and rename it to `.env`

    >  Customize the values as needed

## Development

1. **ic-app**

    1.1. Start `ic-app` service

    ```bash
    docker compose up [-d] ic-app
    ```

    1.2. Use `ic-app` container environment

    ```bash
    docker compose run --rm --service-ports ic-app bash
    ```

2. **ic-sql-server**

    1.1. Start `ic-sql-server` service

    ```bash
    docker compose up [-d] ic-sql-server
    ```

    1.2. Use `ic-sql-server` container environment

    ```bash
    docker compose exec -it ic-sql-server /opt/mssql-tools/bin/sqlcmd -U sa -P '<your password value defined to $IC_SQL_PSWD in .env>'
    ```
