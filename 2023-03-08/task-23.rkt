;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-23) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 23a) Wendet die beiden gegebenen Funktionen
;; nacheinander auf jedes Element der Liste an
(check-expect
 (apply-two (lambda [x] (* x 2)) (lambda [x] (- x 1)) '(1 2 3 4))
 '(1 3 5 7))
(check-expect
 (apply-two sqr (lambda [x] (+ 3 x)) '(1 2 3 4))
 '(4 7 12 19))

;; apply-two: (number -> number) (number -> number) list-of number -> list-of number
(define apply-two
  (lambda [f1 f2 list]
    (map f2 (map f1 list))))


;; 23b) Sucht die kleinste natürliche Zahl bis maximal 1000,
;; für die beide Funktionen denselben Wert zurückgeben. Wenn
;; keine Zahl gefunden werden kann, wird 0 zurückgegeben.
(check-expect (same-result (lambda [x] 4) (lambda [x] x)) 4)
(check-expect (same-result (lambda [x] (expt 2 x)) (lambda [x] x)) 0)

;; same-result: (number -> number) (number -> number) -> number
(define same-result
  (lambda [f1 f2]
    (letrec ([same-result-iter
              (lambda [i] (cond
                            [(> i 1000) 0]
                            [(equal? (f1 i) (f2 i)) i]
                            [else (same-result-iter (+ i 1))]))])
      (same-result-iter 1))))