fmt:
    cargo fmt

sqlx:
    cd backend && cargo sqlx prepare

clippy:
    cargo clippy --workspace --all-targets --all-features --fix

test:
    cargo test

init_db:
    ./scripts/init_db.sh

clear_test_db:
    ./scripts/clear_test_dbs.sh

create_migration description:
    cargo sqlx migrate add --source ./backend/migrations {{description}}

backend:
    cargo run -p backend

frontend:
    cd frontend && bun run dev

pretty:
    cd frontend && bun run format

migrate:
    cd backend && cargo sqlx migrate run

dev:
    docker-compose up db auth kong jaeger prometheus -d