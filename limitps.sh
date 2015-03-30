#!/bin/sh
echo -n "Proceso? > "
read NombreProceso
proceso="$(pidof -s $NombreProceso)"
status="$?"

if [ $status -eq 0 ]
  then
    echo -n "Límite CPU? >"
    read LimiteCPU
    echo "Limitando $NombreProceso a $LimiteCPU % de tiempo de CPU."
    cpulimit --pid=$proceso -l $LimiteCPU > /dev/null
  else
    echo "No se han encontrado instancias del proceso $NombreProceso."
fi
