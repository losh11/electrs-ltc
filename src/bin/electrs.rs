#![recursion_limit = "256"]

use anyhow::Result;

fn main() -> Result<()> {
    electrs_ltc::run()
}
