#!/bin/bash
#Script para descargar paquetes del repositorio de Arch Arm (archv6h)
#ademas de descargar sus dependencias y comprobar si ya estan descargados esos 
#paquetes
read -p "Nombre del paquete a descargar " n_paquete

function descargar_p_p {
wget `curl --stderr - https://archlinuxarm.org/packages/armv6h/$n_paquete | grep .pkg.tar.xz | cut -d "\"" -f 2` -q --show-progress --limit-rate=300k
echo "Descarga finalizada buscando dependencias faltantes"
verificar_dependencias
}

function descargar_p_d {
wget `curl --stderr - https://archlinuxarm.org/packages/armv6h/${depe:1} | grep .pkg.tar.xz | cut -d "\"" -f 2` -q --show-progress --limit-rate=300k
echo "Descarga finalizada del paquete $depe"
#verificar_dependencias
}

function buscar_paquete {
echo "Buscando el paquete $n_paquete"
estado=`curl -o /dev/null -s -w "%{http_code}\n" https://archlinuxarm.org/packages/armv6h/$n_paquete`
if [[ "$estado" == *200* ]];  then
	echo "Paquete encontrado"
	descargar_p_p
	else
	echo "Paquete no encontrado"
fi
}

function buscar_dependencias {
echo "Buscando la dependencia $depe del paquete $n_paquete"
estado=`curl -o /dev/null -s -w "%{http_code}\n" https://archlinuxarm.org/packages/armv6h/${depe:1}`

if [[ "$estado" == *200* ]];  then
	echo "dependencias encontrada"
	descargar_p_d
	else
	echo "dependencia no encontrada"
fi
}



function verificar_dependencias {

n_depend=$(tar xf $n_paquete** .PKGINFO -O | grep ^'depend' | wc -l)
echo "verificando dependencias necesarias del paquete $n_paquete"

for ((i=1;i<=$n_depend;i++)) 
do 
depe=$(tar xf $n_paquete** .PKGINFO -O | grep ^'depend' | cut -d "=" -f 2 | sed -n ${i}p)

PAQ_d=`find  ${depe:1}** -print -quit`

if [ -n "$PAQ_d" ]; then
    echo "El paquete $depe ya existe"
    else
    echo "No se encontro el paquete"
    echo "Buscando.."
    buscar_dependencias
fi
done
}
  
function verificar_des {
PAQ=`find  $n_paquete-** -print -quit`

if [ -n "$PAQ" ]; then
    echo "El paquete $n_paquete ya existe"
    verificar_dependencias
else
    echo "No se encontro el paquete"
    echo "Buscando.."
    buscar_paquete
fi

}

verificar_des
#verificar_dependencias





