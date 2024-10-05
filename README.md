# kicad-gerber Action

Generates gerber & drill files for a specified PCB and places them in a specified directory

## Inputs

### `input-file`

**Required** The PCB to process

### `output-directory`

The directory in which to place the gerber & drill files. Default "gerber".

### `position-format`

The position format to use. Options are gerber, csv, ascii, and none. Default "none".

## Example usage
```
uses: BenMMcLean/kicad-gerber@v2.0.3
with:
  input-file: pcb.kicad_pcb
```
