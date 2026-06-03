#lang racket

(require "PyS.rkt")

;; Pruebas auxiliares de sum-list
(equal? (sum-list '()) 0)
(equal? (sum-list '(1 2 3)) 6)
(equal? (sum-list '(5 5 5 5)) 20)


;; Pruebas auxiliares de merge-sort
(equal? (merge-sort '()) '())
(equal? (merge-sort '(1)) '(1))
(equal? (merge-sort '(3 1 2)) '(1 2 3))
(equal? (merge-sort '(5 2 5 1)) '(1 2 5 5))
(equal? (merge-sort '(4 3 2 1)) '(1 2 3 4))


;; Pruebas del problema

;; Caso donde max(boys) < min(girls)
(equal? (party-and-sweets '(1 2 1) '(3 4)) 12)


;; Caso donde max(boys) = min(girls)
(equal? (party-and-sweets '(2 3) '(3 3)) 10)


;; Caso con una sola niña
(equal? (party-and-sweets '(1 2 3) '(3)) 6)


;; Caso donde todos los valores coinciden
(equal? (party-and-sweets '(2 2 2) '(2 2)) 12)


;; Caso con ajuste usando segundo niño maximo
(equal? (party-and-sweets '(1 4 2) '(5 6)) 19)


;; Caso imposible
;; Como 5 > 4, no existe matriz valida.
(equal? (party-and-sweets '(3 5) '(4 6)) -1)


;; Caso especial
;; solo hay un niño y max-boy < min-girl
(equal? (party-and-sweets '(2) '(3 4)) -1)


;; Caso de un solo niño valido.
(equal? (party-and-sweets '(3) '(3 4)) 7)