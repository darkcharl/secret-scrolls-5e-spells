#!/usr/bin/env bash

SPELL_SRC=()
i=0
for SPELL in $(sed -n 's/^new entry "\([^"_]*_[^"_]*\)"/\1/p' source/5eSpells/*.txt | sort | uniq)
do
    SPELL_SRC[i]="${SPELL}"
    (( i++ ))
done

echo "${#SPELL_SRC[*]} spells found in source"

for SCROLLFILE in ../PAK/Public/SecretScrolls5eSpells/RootTemplates/*.lsx
do
    # echo "${SCROLLFILE}"
    SPELL=$(sed -n 's/[[:space:]]*<attribute id="SpellId" type="FixedString" value="\([^"]*\)"\/>/\1/p' "${SCROLLFILE}")
    if [[ ! ${SPELL_SRC[*]} =~ $SPELL ]]
    then
        SPELL_NAME=$(echo "${SPELL}" | cut -d '_' -f2)
        if grep -A7 "${SPELL_NAME}" Object_SecretScrolls5eSpells.txt | grep ToBeDeleted > /dev/null
        then
            echo "[.] ${SPELL} deprecated"
        else
            echo "[-] ${SPELL} not found"
        fi
    # else
    #    echo "[+] ${SPELL} found"
    fi
done