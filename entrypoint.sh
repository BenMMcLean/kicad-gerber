#!/bin/sh -l

output="$2"
input="$1"
placement_format="${3:-ascii}"

filename=$(basename -- "$output")

mkdir -p "$output"
kicad-cli pcb export drill -o "$output" "$input"
kicad-cli pcb export gerbers -o "$output" "$input"

if [[ "$placement_format" == "ascii" || "$placement_format" == "csv" ]]; then
    kicad-cli pcb export pos --format "$placement_format" -o "$output" "$input"
elif [[ "$placement_format" == "gerber" ]]; then
    kicad-cli pcb export pos --format gerber --side front -o "$output/$filename.front.pos" "$input"
    kicad-cli pcb export pos --format gerber --side back -o "$output/$filename.back.pos" "$input"
fi