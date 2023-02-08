;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-17-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Akzeptiert eine Liste an Zahlen und berechnet deren Summe
(check-expect
 (sum '(1 2 3 4))
 10)
(check-expect
 (sum '())
 0)
(check-expect
 (sum '(8))
 8)
(check-expect
 (sum '(-10 20 3))
 13)

;; sum: liste-von-zahlen -> zahl
(define sum
  (lambda [list]
    (cond
      [(> (length list) 1) (+ (first list) (sum (rest list)))]
      [(empty? list) 0]
      [else (first list)]
      )))


;; Akzeptiert eine Liste an Zahlen und berechnet deren Produkt
(check-expect
 (prod '(1 2 3 4))
 24)
(check-expect
 (prod '())
 1)
(check-expect
 (prod '(8))
 8)
(check-expect
 (prod '(-10 20 3))
 -600)
(check-expect
 (prod '(-3 -3))
 9)
(check-expect
 (prod '(4 2 0))
 0)

;; prod: liste-von-zahlen -> list
(define prod
  (lambda [list]
    (cond
      [(empty? list) 1]
      [(empty? (rest list)) (first list)]
      [(> (length list) 1) (* (first list) (prod (rest list)))]
      )))


;; Akzeptiert eine Liste an Zahlen und gibt die größte enthaltene Zahl aus
(check-expect
 (maximum '(1 2 3 4))
 4)
(check-expect
 (maximum '(5 9 -20 11 4 1))
 11)
(check-expect
 (maximum '(300 3))
 300)
(check-expect
 (maximum '(-10 -12))
 -10)
(check-expect
 (maximum '(1))
 1)
(check-error
 (maximum '()))

;; maximum: liste-von-zahlen -> zahl
(define maximum
  (lambda [list]
    (cond
      [(> (length list) 2) (max (first list) (maximum (rest list)))]
      [(= (length list) 2) (max (first list) (first (rest list)))]
      [else (first list)]
      )))


;; Akzeptiert eine Liste und ein beliebiges Element
;; und gibt an, ob das Element in der Liste enthalten ist
(check-expect
 (enthaelt? '(1 2 3 4) 4)
 true)
(check-expect
 (enthaelt? '(1 2 3 4) 5)
 false)
(check-expect
 (enthaelt? '(1) 1)
 true)
(check-expect
 (enthaelt? '(1) "1")
 false)
(check-expect
 (enthaelt? '() 1)
 false)

;; enthaelt
(define enthaelt?
  (lambda [list element]
    (cond
      [(> (length list) 1) (or (equal? (first list) element) (enthaelt? (rest list) element))]
      [(= (length list) 1) (equal? (first list) element)]
      [else false]
      )))


;; Akzeptiert eine Liste an Zahlen und gibt
;; eine Liste mit denselben Zahlen um jeweils 1 verringert aus.
(check-expect
 (declist '(2 5 7))
 '(1 4 6))
(check-expect
 (declist '(-10 1 2))
 '(-11 0 1))
(check-expect
 (declist '(4))
 '(3))
(check-expect
 (declist '())
 '())

(define declist
  (lambda [list]
    (cond
      [(> (length list) 1) (cons (- (first list) 1) (declist (rest list)))]
      [(= (length list) 1) (cons (- (first list) 1) empty)]
      [else '()]
      )))