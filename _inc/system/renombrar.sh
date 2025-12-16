#!/bin/bash

echo "=== RENOMBRANDO LOGOS AL FORMATO RETROPIE ==="
echo "Trabajando en: $(pwd)"
echo ""

# Mapa: NOMBRE-DE-RETROPIE = palabra clave del archivo Anbernic
declare -A MAP=(
  # Sony
  [psx]="PSX"
  [ps2]="PS2"
  [ps3]="PS3"
  [ps4]="PS4"
  [psp]="PSP"

  # Nintendo
  [nes]="NES"
  [snes]="SNES"
  [n64]="N64"
  [gb]="GB "
  [gbc]="GBC"
  [gba]="GBA"
  [nds]="NDS"
  [gc]="NGC"
  [wii]="WII"

  # Sega
  [mastersystem]="MS"
  [megadrive]="MD"
  [gamegear]="GG"
  [dreamcast]="DC"
  [saturn]="SATURN"

  # Arcade/varios
  [mame]="MAME"
  [fba]="FBA"
  [arcade]="ARCADE"

  # Otros
  [neogeo]="NEOGEO"
  [ngp]="NGP"
  [ngpc]="NGPC"
  [pcengine]="PCE"
  [pcfx]="PCFX"
  [tg16]="TG16"
  [wonderswan]="WS"
  [wonderswancolor]="WSC"
  [supervision]="SUPERVISION"
)

for rp_name in "${!MAP[@]}"; do
  key="${MAP[$rp_name]}"

  # Buscar archivo cuyo nombre contenga la palabra clave
  match=$(ls | grep -i "$key" | head -n 1)

  if [[ -n "$match" ]]; then
    echo "Renombrando: $match -> $rp_name.png"
    mv -f "$match" "$rp_name.png"
  else
    echo "NO ENCONTRADO: $rp_name (buscando '$key')"
  fi
done

echo ""
echo "=== LISTO ==="
