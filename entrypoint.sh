#!/bin/sh -l

mkdir -p /github/workspace/$2
kicad-cli pcb export drill -o /github/workspace/$2 /github/workspace/$1
kicad-cli pcb export gerbers -o /github/workspace/$2 /github/workspace/$1