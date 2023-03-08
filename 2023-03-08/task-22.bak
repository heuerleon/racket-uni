;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 22a) Addiert 42 zu jedem Element der Liste
(check-expect (add42 '(1 2 3 4)) '(43 44 45 46))
(check-expect (add42 '()) '())

;; add42: list of numbers -> list of numbers
(define add42
  (lambda [list]
    (map (lambda [x] (+ 42 x)) list)))


;; 22b) Addiert 42 zu jedem Element der Liste und
;; gibt nur die geraden Zahlen zurück
(check-expect (add42-even '(1 2 3 4)) '(44 46))
(check-expect (add42-even '()) '())

;; add42-even: list of numbers -> list of numbers
(define add42-even
  (lambda [list]
    (filter
      (lambda [x] (= 0 (modulo x 2)))
      (add42 list))))


;; 22c) Addiert 42 zu jedem Element der Liste,
;; nimmt dann die geraden Zahlen und gibt
;; deren Produkt zurück
(check-expect (add42-even-product '(1 2 3 4 5 6)) 97152)
(check-expect (add42-even-product '()) 1)

;; add42-even-product: list of numbers -> number
(define add42-even-product
  (lambda [list]
    (foldr * 1 (add42-even list))))


;; 22d) Akzeptiert eine Liste und gibt nur die Zahlen
;; zurück, die durch 4 oder 5 teilbar sind
(check-expect (filter45 '(2 3 4 5 7 10 16)) '(4 5 10 16))
(check-expect (filter45 '(9 1)) '())
(check-expect (filter45 '()) '())

;; filter45: list of numbers -> list of numbers
(define filter45
  (lambda [list]
    (filter (lambda [x]
              (or (= 0 (modulo x 4)) (= 0 (modulo x 5)))) list)))


;; 22e) Quadriert alle Elemente in der Liste
;; und gibt deren Summe zurück
(check-expect (sum-square '(1 2 3 4)) 30)
(check-expect (sum-square '()) 0)

;; sum-square: list of numbers -> number
(define sum-square
  (lambda [list]
    (foldr + 0 (map sqr list))))


;; 22f) Gibt genau dann true zurück, wenn
;; alle booleans in der Liste auch den Wert
;; true besitzen, ansonsten false
(check-expect (und '(#true #true #false #true)) #false)
(check-expect (und '(#true #true #true)) #true)

;; und: list of booleans -> boolean
(define und
  (lambda [list]
    (foldr (lambda [x y] (if (and x y) y #false)) #true list)))


;; 22g) Akzeptiert ein Prädikat und eine Liste an
;; beliebigen Elementen. Gibt zwei Listen zurück,
;; wobei erstere alle Elemente enthält, die das
;; Prädikat erfüllen, und die andere die restlichen
;; Elemente enthält.
(check-expect
 (partitioniere (lambda [x] (> x 3)) '(1 2 3 4 5))
 '((4 5) (1 2 3)))
(check-expect
 (partitioniere (lambda [x] (> x 3)) '(1 2 3))
 '(() (1 2 3)))
(check-expect
 (partitioniere (lambda [x] (> x 3)) '())
 '(() ()))

;; partitioniere: predicate, list of atoms -> list of lists
(define partitioniere
  (lambda [pred? l]
    (list
     (filter pred? l)
     (filter (lambda [x] (not (pred? x))) l))))