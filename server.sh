#!/bin/bash
set -eux
cd `dirname $0`

cargo fmt --all
cargo build --all --features "metrics_process" --release

NETWORK=$1
shift

DB=./db
export RUST_LOG=${RUST_LOG-electrs=INFO}
target/release/electrs --network $NETWORK --db-dir $DB --daemon-dir $HOME/.litecoin $*

# use SIGINT to quit
