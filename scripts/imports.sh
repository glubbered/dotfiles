#!/bin/bash

search_for="$1"
search_for+=".class"

paths=( "/home/wedens/Projects/zenith-portal/zenith-portal/build/regserver/webapp/WEB-INF/classes" "/home/wedens/Projects/zenith-portal/zenith-portal/build/client/classes" )

RESULT=()
for p in "${paths[@]}"
do
  esc_path=${p//\//\\/}
  esc_path+="\\/"
  matches=( $(ag -g "$search_for" "$p" | sed "s/$esc_path//g" | sed "s/\\$/./g" | sed "s/\.class//g" | sed "s/\//\./g") )
  RESULT=( "${RESULT[@]}" "${matches[@]}" )
done


jars=( "/home/wedens/Projects/zenith-portal/zenith-portal/lib/spring/org.springframework.orm-3.0.5.RELEASE.jar" )

for j in "${jars[@]}"
do
  matches=( $(jar tf "$j" | ag "$search_for" | sed "s/\\$/./g" | sed "s/\.class//g" | sed "s/\//\./g")  )
  RESULT=( "${RESULT[@]}" "${matches[@]}" )
done

printf '%s\n' "${RESULT[@]}" | sort -u
