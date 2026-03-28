#!/usr/bin/env bash
# Creates symlinks in $HOME for every file found under home/

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${DOTFILES_DIR}/home"
BACKUP_DIR="${DOTFILES_DIR}/backup/$(date +%Y%m%d_%H%M%S)"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC}  $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC}  $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

create_symlink() {
	local source="$1"
	local target="$2"
	local target_dir
	target_dir="$(dirname "$target")"

	# Create parent directories in $HOME if needed
	if [[ ! -d "$target_dir" ]]; then
		mkdir -p "$target_dir"
		log_info "Created directory: $target_dir"
	fi

	# Already correctly linked — nothing to do
	if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
		log_info "Already linked:    $target"
		return
	fi

	# Back up anything that would be overwritten
	if [[ -e "$target" || -L "$target" ]]; then
		mkdir -p "$BACKUP_DIR"
		mv "$target" "$BACKUP_DIR/"
		log_warn "Backed up:         $target → $BACKUP_DIR/"
	fi

	ln -s "$source" "$target"
	log_info "Linked:            $target → $source"
}

main() {
	if [[ ! -d "$SOURCE_DIR" ]]; then
		log_error "Source directory not found: $SOURCE_DIR"
		exit 1
	fi

	# Initialise and pull all submodules before linking
	# log_info "Updating submodules..."
	# git -C "$DOTFILES_DIR" submodule update --init --recursive

	while IFS= read -r -d '' file; do
		relative="${file#"${SOURCE_DIR}"/}"
		target="${HOME}/${relative}"
		create_symlink "$file" "$target"
	done < <(find "$SOURCE_DIR" -type f -print0)

	log_info "Done."
}

main "$@"
