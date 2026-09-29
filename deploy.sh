#!/usr/bin/env bash
# Déploiement FTP de index.html vers la racine du site.
# Usage :
#   FTP_HOST=ftp.example.com FTP_USER=monuser FTP_PASS=monmotdepasse ./deploy.sh
# Variables optionnelles :
#   FTP_PORT   (défaut : 21)
#   FTP_PATH   (défaut : / — répertoire distant cible)
#   FTP_SECURE (1 = FTPS/TLS explicite, défaut : 0 = FTP simple)
set -euo pipefail

if [[ -z "${FTP_HOST:-}" || -z "${FTP_USER:-}" || -z "${FTP_PASS:-}" ]]; then
  echo "Erreur : FTP_HOST, FTP_USER et FTP_PASS doivent être définis." >&2
  echo "Exemple : FTP_HOST=ftp.example.com FTP_USER=user FTP_PASS=pass ./deploy.sh" >&2
  exit 1
fi

PORT="${FTP_PORT:-21}"
REMOTE_PATH="${FTP_PATH:-/}"
SECURE="${FTP_SECURE:-0}"

if [[ ! -f "$(dirname "$0")/index.html" ]]; then
  echo "Erreur : index.html introuvable à côté du script." >&2
  exit 1
fi

CURL_OPTS=(--upload-file "$(dirname "$0")/index.html" --port "$PORT" --ftp-create-dirs --fail --show-error --silent)
if [[ "$SECURE" == "1" ]]; then
  CURL_OPTS+=(--ssl-reqd)
fi

curl "${CURL_OPTS[@]}" "ftp://${FTP_HOST}${REMOTE_PATH}index.html" --user "${FTP_USER}:${FTP_PASS}"

echo "index.html déployé sur ftp://${FTP_HOST}${REMOTE_PATH}index.html"
