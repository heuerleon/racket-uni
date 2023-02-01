;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fibonacci) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Berechnet die n-te Fibonacci-Zahl
;; Parameter n: N (nat. Zahlen)
(define fif
  (lambda [n]
    (cond
      [(= n 1) 1]
      [(= n 2) 1]
      [else (+ (fif (- n 1)) (fif (- n 2)))
        ])))

;; Test cases
(= (fif 1) 1)
(= (fif 2) 1)
(= (fif 4) 1)