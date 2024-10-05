#!/bin/bash

output="/github/workspace/$2"
input="/github/workspace/$1"
placement_format="${3:-ascii}"

filename="$(basename -- "$input" .${input##*.})"

mkdir -p "$output"
kicad-cli pcb export drill -o "$output" "$input"
kicad-cli pcb export gerbers -o "$output" "$input"

if [[ "$placement_format" == "ascii" || "$placement_format" == "csv" ]]; then
    kicad-cli pcb export pos --format "$placement_format" -o "$output/$filename.pos" "$input"
elif [[ "$placement_format" == "gerber" ]]; then
    kicad-cli pcb export pos --format gerber --side front -o "$output/$filename.front.pos" "$input"
    kicad-cli pcb export pos --format gerber --side back -o "$output/$filename.back.pos" "$input"
fi