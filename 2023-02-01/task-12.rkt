;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Gibt zurück, wie viele Lösungen die quadratische Gleichung
;;     ax^2 + bx + c = 0
;; besitzt.
(define loesungsmenge
  (lambda [a b c]
    (cond
      [(and (= a 0) (= b 0) (= c 0)) +inf.0]
      [(= c 0) 1]
      [(or (and (> a 0) (> c 0)) (and (< a 0) (< c 0))) 0]
      [else 2])))

;; Test cases
(= (loesungsmenge 0 0 0) +inf.0)
(= (loesungsmenge 1 0 1) 0)
(= (loesungsmenge -2 0 1) 2)
(= (loesungsmenge -3 0 -2) 0)
(= (loesungsmenge 2 0 -2) 2)
(= (loesungsmenge 3 4 0) 1)