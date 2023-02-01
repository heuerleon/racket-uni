;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Berechnet die prozentuale Rückerstattung aus den Ausgaben
(define rueckerstattung
  (lambda [ausgaben]
    (cond
      [(> ausgaben 2500) (+ (rueckerstattung 2500) (* (- ausgaben 2500) (/ 1 100)))]
      [(> ausgaben 1500) (+ (rueckerstattung 1500) (* (- ausgaben 1500) (/ 3 400)))]
      [(> ausgaben 500) (+ (rueckerstattung 500) (* (- ausgaben 500) (/ 1 200)))]
      [else (* ausgaben (/ 1 400))])))

;; Test cases
(= (rueckerstattung 400) 1)
(= (rueckerstattung 1400) 5.75)
(= (rueckerstattung 2000) 10)
(= (rueckerstattung 2600) 14.75)