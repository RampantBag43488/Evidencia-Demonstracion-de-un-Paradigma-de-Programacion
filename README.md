# Evidencia-Demostracion-Paradigma-Funcional

## Inaki Mancera Llano

## Problema seleccionado
Codeforces 1158A - The Party and Sweets  
Link: https://codeforces.com/problemset/problem/1158/A

## Contexto
Esta evidencia resuelve un problema de programación competitiva utilizando el paradigma funcional. El problema consiste en encontrar la mínima suma total posible de dulces en una matriz donde las filas representan niños y las columnas representan niñas.

La lista de niños representa los mínimos por fila, mientras que la lista de niñas representa los máximos por columna. Si no existe una matriz que cumpla esas condiciones, la respuesta debe ser -1.

## Paradigma principal
El paradigma principal utilizado es programación funcional en DrRacket. La solución se basa en funciones recursivas, procesamiento de listas, cond y transformación de datos sin usar variables mutables.

## Implementación
El archivo principal es PyS.rkt. En él se implementan funciones auxiliares propias para sumar y ordenar listas:

- sum-list: suma recursivamente los valores de una lista.
- split-list: divide una lista en dos partes.
- merge: combina dos listas ordenadas.
- merge-sort: ordena una lista mediante divide y vencerás.
- party-and-sweets: resuelve el problema principal.

Las pruebas están en pruebas.rkt y llaman directamente a la función party-and-sweets con listas ya definidas.

Para correr las pruebas en terminal donde esten los documentos:
- racket tests.rkt
