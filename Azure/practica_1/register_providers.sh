#!/usr/bin/env bash
set -euo pipefail

# Uso:
#   ./register_providers.sh
#   ./register_providers.sh <subscription_id_o_nombre>
#
# Requiere:
#   - Azure CLI instalado
#   - Sesion iniciada: az login
#   - Permisos para registrar providers en la suscripcion

SUBSCRIPTION="${1:-}"

if ! command -v az >/dev/null 2>&1; then
  echo "Error: Azure CLI no esta instalado (comando az no encontrado)."
  exit 1
fi

if [[ -n "$SUBSCRIPTION" ]]; then
  echo "Seleccionando suscripcion: $SUBSCRIPTION"
  az account set --subscription "$SUBSCRIPTION"
fi

echo "Validando sesion activa..."
az account show >/dev/null

PROVIDERS=(
  Microsoft.Resources
  Microsoft.Storage
  Microsoft.Network
  Microsoft.Compute
  Microsoft.Databricks
  Microsoft.DBforMySQL
  Microsoft.ContainerInstance
  Microsoft.ContainerService
)

echo "Registrando providers necesarios..."
for ns in "${PROVIDERS[@]}"; do
  state="$(az provider show --namespace "$ns" --query registrationState -o tsv 2>/dev/null || echo "NotRegistered")"

  if [[ "$state" == "Registered" ]]; then
    echo "  - $ns: ya estaba registrado"
    continue
  fi

  echo "  - $ns: registrando (estado actual: $state)"
  az provider register --namespace "$ns" >/dev/null
done

echo "Esperando confirmacion de registro..."
for ns in "${PROVIDERS[@]}"; do
  tries=0
  max_tries=30
  sleep_seconds=5

  while true; do
    state="$(az provider show --namespace "$ns" --query registrationState -o tsv 2>/dev/null || echo "Unknown")"
    if [[ "$state" == "Registered" ]]; then
      echo "  - $ns: Registered"
      break
    fi

    tries=$((tries + 1))
    if (( tries >= max_tries )); then
      echo "  - $ns: no llego a Registered a tiempo (estado final: $state)"
      exit 1
    fi

    sleep "$sleep_seconds"
  done
done

echo "Todos los providers necesarios estan registrados."
