#!/usr/bin/env bash

# ============================================================
#  CODEX CLI — instalador oficial para Linux/WSL
#  Pode ser sourced ou executado diretamente
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    set -euo pipefail
    source "$SCRIPT_DIR/../lib/utils.sh"
fi

install_codex_cli() {
    if command -v codex >/dev/null 2>&1; then
        warn "Codex CLI ja instalado — atualizando pelo instalador oficial."
    else
        log "Instalando Codex CLI..."
    fi

    curl -fsSL https://chatgpt.com/codex/install.sh | sh

    if command -v codex >/dev/null 2>&1; then
        log "Codex CLI instalado. Execute 'codex' para autenticar com o ChatGPT."
    else
        warn "Codex foi instalado, mas ainda nao esta no PATH desta sessao. Reabra o terminal."
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_codex_cli
fi
