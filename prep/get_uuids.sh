#!/usr/bin/env bash

grep -i root ../PAK/Public/SecretScrolls5eSpells/Stats/Generated/Data/Object_SecretScrolls5eSpells.txt | awk '{ print $3 "," }'
