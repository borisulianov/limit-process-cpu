#!/bin/sh
echo -n "Proceso? > "
read NombreProceso
proceso="$(pidof -s $NombreProceso)"
status="$?"

if [ $status -eq 0 ]
  then
    cpulimit --pid=$proceso -l 50
    echo "Limitando $NombreProceso."
  else
    echo "No se han encontrado instancias del proceso $NombreProceso."
fi
