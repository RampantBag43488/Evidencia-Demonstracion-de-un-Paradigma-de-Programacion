#lang racket

;; Evidencia: Demostración de un Paradigma de Programacion
;; Problema: Codeforces 1158A - The Party and Sweets
;; Paradigma: Programacion funcional
;; Lenguaje: DrRacket

(provide party-and-sweets
         merge-sort  
         sum-list)

;; Suma todos los elementos de una lista usando recursivamente (head).
(define sum-list
  (lambda (lst)
    (cond
      [(empty? lst) 0]
      [else (+ (first lst) (sum-list (rest lst)))])))

;; Recibe dos listas ya ordenadas y las combina en una sola
;; lista ordenada de menor a mayor.
(define merge
  (lambda (left right)
    (cond
      [(empty? left) right]
      [(empty? right) left]
      [(<= (first left) (first right))
       (cons (first left)
             (merge (rest left) right))]
      [else
       (cons (first right)
             (merge left (rest right)))])))

;; Divide una lista en dos partes para aplicar merge sort.
(define split-list
  (lambda (lst)
    (cond
      [(empty? lst) (list '() '())]
      [(empty? (rest lst)) (list (list (first lst)) '())]
      [else
       (let* ([parts (split-list (rest (rest lst)))]
              [left (first parts)]
              [right (second parts)])
         (list (cons (first lst) left)
               (cons (second lst) right)))])))

;; Ordena una lista de menor a mayor usando merge sort.
(define merge-sort
  (lambda (lst)
    (cond
      [(empty? lst) '()]
      [(empty? (rest lst)) lst]
      [else
       (let* ([parts (split-list lst)]
              [left (first parts)]
              [right (second parts)])
         (merge (merge-sort left) (merge-sort right)))])))

;; Recibe la lista de niños y la lista de niñas.
;; Regresa la suma minima total de dulces o -1 si no es posible.
(define party-and-sweets
  (lambda (boys girls)
    (let* ([n (length boys)]
           [m (length girls)]

           ;; Se ordenan las listas para obtener maximo, minimo
           ;; y segundo maximo de forma clara.
           [sorted-boys (merge-sort boys)]
           [sorted-girls (merge-sort girls)]

           [sum-boys (sum-list boys)]
           [sum-girls (sum-list girls)]

           [max-boy (last sorted-boys)]
           [min-girl (first sorted-girls)]

           ;; Formula base:
           ;; m * sum(boys) + sum(girls) - m * max(boys)
           [base-answer (+ (* m sum-boys) sum-girls (- (* m max-boy)))])
      (cond
        ;; Caso base:
        ;; el maximo minimo de los niños no puede ser mayor
        ;; que el minimo maximo de las niñas.
        [(> max-boy min-girl) -1]

        ;; Caso base especial:
        ;; no se puede conservar el minimo de boys de esa única fila.
        [(and (= n 1) (< max-boy min-girl)) -1]

        ;; Casos alternativos:
        ;; se necesita ajuste con segundo maximo.
        [(< max-boy min-girl)
         (let ([second-max-boy (list-ref sorted-boys (- n 2))])
           (+ base-answer (- max-boy second-max-boy)))]

        ;; Si max-boy = min-girl, no se necesita ajuste extra.
        [else base-answer]))))