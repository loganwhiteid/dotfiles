#!/usr/bin/env bash
# Usage: ./add.sh ~/.some_config_file

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${DOTFILES_DIR}/home"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC}  $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

usage() {
	echo "Usage: $0 <path-to-file>"
	echo "  Example: $0 ~/.bashrc"
	exit 1
}

[[ $# -ne 1 ]] && usage

FILE="$(realpath "$1")"

if [[ ! -e "$FILE" ]]; then
	log_error "File does not exist: $FILE"
	exit 1
fi

if [[ "$FILE" != "$HOME"* ]]; then
	log_error "File must be under \$HOME"
	exit 1
fi

# Prevent double-adoption
if [[ -L "$FILE" && "$(readlink "$FILE")" == "$SOURCE_DIR"* ]]; then
	log_error "Already managed: $FILE"
	exit 1
fi

relative="${FILE#"${HOME}"/}"
dest="${SOURCE_DIR}/${relative}"

mkdir -p "$(dirname "$dest")"
mv "$FILE" "$dest"
log_info "Moved:   $FILE → $dest"

ln -s "$dest" "$FILE"
log_info "Linked:  $FILE → $dest"

echo ""
log_info "Stage the file:"
echo "  git -C '${DOTFILES_DIR}' add '${dest}'"
