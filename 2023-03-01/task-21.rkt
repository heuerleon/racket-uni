;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-21) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum berechnet die Summe aller Zahlen in der gegebenen Liste
(check-expect (sum '(1 3 4 2)) 10)
(check-expect (sum '()) 0)
(check-expect (sum '(0)) 0)
(check-expect (sum '(-10 -9 8)) -11)

;; sum: list of numbers -> number
(define sum
  (lambda [list]
    (letrec [
             (sum-iter
              (lambda [akku list2]
                (cond
                  [(empty? list2) akku]
                  [else (sum-iter (+ (first list2) akku) (rest list2))])))]
      (sum-iter 0 list))))


;; absolute-distances berechnet aus einer Liste mit relativen
;; Abständen zwischen den Listenelementen eine Liste mit absoluten
;; Abständen zum Startpunkt 0
(check-expect (absolute-distances '(120 90 70 65)) '(120 210 280 345))
(check-expect (absolute-distances '()) '())
(check-expect (absolute-distances '(70 130 20 200)) '(70 200 220 420))

;; absolute-distances: list of numbers -> list of numbers
(define absolute-distances
  (lambda [list]
    (letrec [
             (abs-distances-iter
              (lambda [akku list2]
                (cond
                  [(empty? list2) empty]
                  [else (cons (+ akku (first list2)) (abs-distances-iter (+ akku (first list2)) (rest list2)))])))]
      (abs-distances-iter 0 list))))


;; singletons 
(check-expect (singletons '(A B B C)) '(A C))
(check-expect (singletons '(A A B B C C)) '())
(check-expect (singletons '()) '())
(check-expect (singletons '(A B C D E)) '(A B C D E))

;; singletons: list -> list of singletons
(define singletons
  (lambda [list]
    (letrec [
             (singletons-iter
              (lambda [akku list2]
                (cond
                  [(empty? list2) empty]
                  [(member? (first list2) (rest list2)) (singletons-iter (cons (first list2) akku) (rest list2))]
                  [(member? (first list2) akku) (singletons-iter akku (rest list2))]
                  [else (cons (first list2) (singletons-iter (cons (first list2) akku) (rest list2)))])))]
      (singletons-iter '() list))))