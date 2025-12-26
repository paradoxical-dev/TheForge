#!/bin/nu

let generated = "/tmp/color-dump.json" | path expand
let settings_path = "~/.config/VSCodium/User/settings.json" | path expand

let patch = (open $generated)
let settings = (open $settings_path)

let merged = ($settings | merge $patch)

$merged | to json | save -f $settings_path
