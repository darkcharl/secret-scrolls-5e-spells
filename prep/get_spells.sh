#!/usr/bin/env bash

egrep '^new entry "[^"_]+_[^"_]+"' source/5eSpells/Spells_* | awk '{ print $NF }' | tr -d '"' | sort > 5eSpells.txt
