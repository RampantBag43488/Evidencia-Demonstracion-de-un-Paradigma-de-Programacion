#lang racket

;; ITESM QRO
;; Iñaki Mancera Llano
;; A01708827
;; Evidencia: Demonstración de un Paradigma de Programación
;; Paradigma: Programacion Funcional
;; Problema: Codeforces 266A Stones on the Table

;; Compara dos piedras y regresa si tienen el mismo color como valor booleano.
(define same-color?
  (lambda (a b)
    (equal? a b)))

;; Recibe una lista de caracteres (representan las piedras) y regresa el numero minimo
;; de piedras que se tendrian que quitar para que dos piedras del mismo color no queden
;; pegadas.
(define (removedCount stones)
  (cond
    ;; Caso base:
    ;; Si esta vacia o con una roca la lista, no hay con que comparar.
    [(or (empty? stones) (empty? (rest stones))) 0]

    ;; Caso alternativo:
    ;; Si la primer roca y la segunda son del mismo color, se cuenta 1 y se avanza a
    ;; las siguientes.
    [(same-color? (first stones) (first (rest stones)))
     (+ 1 (removedCount (rest stones)))]


    ;; Si las primeras dos piedras son diferentes no se agrega nada a la cuenta y
    ;; se avanza en la lista de piedras.
    [else
     (removedCount (rest stones))]))

;; Cambia el string que se da a una lista de caracteres y se le aplica la funcion
;; removedCount.
(define TableStones
  (lambda (s)
    (removedCount (string->list s))))

;; Ejemplos
(TableStones "RRG") ;; Resultado esperado: 1
(TableStones "RRRRR") ;; Resultado esperado: 4
(TableStones "BRBG") ;; Resultado esperado: 0
(TableStones "B") ;; Resultado esperado: 0

;; Pruebas
(equal? (TableStones "RRG") 1)
(equal? (TableStones "RRRRR") 4)
(equal? (TableStones "BRBG") 0)
(equal? (TableStones "RGBRGB") 0)
(equal? (TableStones "R") 0)
(equal? (TableStones "RRGGBB") 3)
(equal? (TableStones "RBBRGG") 2)
(equal? (TableStones "BBBRRRRG") 5)