#!/usr/bin/env bash

sed -En 's/^(new entry "[^"]+"|data "RootTemplate" "[^"]+"|^$)/\1/p' ../PAK/Public/SecretScrolls5eSpells/Stats/Generated/Data/Object_SecretScrolls5eSpells.txt  | tr -d '"' | awk '{ print $NF }'

