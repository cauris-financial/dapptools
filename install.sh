#!/usr/bin/env bash

{ # Prevent execution if this script was only partially downloaded
  set -e

  tmpfile=$(mktemp)
  trap 'rm $tmpfile' EXIT

  cat > "$tmpfile" <<'EOF'
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  NC='\033[0m'

  oops() {
    >&2 echo -e "${RED}error:${NC} $1"
    exit 1
  }

  [[ "$(id -u)" -eq 0 ]] && oops "Please run this script as a regular user"

  API_OUTPUT=$(curl -sS https://api.github.com/repos/dapphub/dapptools/releases/28500572)
  RELEASE=$(echo "$API_OUTPUT" | jq -r .tarball_url)
  RELEASE=https://github.com/cauris-financial/dapptools/archive/refs/tags/dapp/0.28.2.tar.gz
  [[ $RELEASE == null ]] && oops "No release found in ${API_OUTPUT}"

  nix-env -iA dapp hevm seth solc -f "$RELEASE" --show-trace

  echo -e "${GREEN}All set!${NC}"
EOF

  nix-shell --pure -p cacert cachix curl git jq nix --run "bash $tmpfile"
} # End of wrapping

# previous working tag: https://github.com/charles-packer/dapptools/archive/refs/tags/0.51.6.tar.gz
