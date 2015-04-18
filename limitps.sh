#!/bin/sh
which cpulimit > /dev/null
status="$?"

if [ $status -eq 0 ]
	then
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
else
  echo "Al parecer la aplicación cpulimit no está instalada."
  echo "Para instalarla ejecute:"
  echo "    sudo apt-get install cpulimit"
fi
