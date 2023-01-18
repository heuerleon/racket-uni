;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define karten-preis 500)
(define besucher-kosten 65)

;; Calculates the profit for the cinema depending on the amount of visitors
(define profit
  (lambda [besucherzahl]
    (- (einnahmen besucherzahl) (kosten besucherzahl))))

;; Calculates the cost for the cinema depending on the amount of visitors
(define kosten
  (lambda [besucherzahl]
    (* besucherzahl besucher-kosten)))

;; Calculates the income the cinema generates depending on the amount of visitors
(define einnahmen
  (lambda [besucherzahl]
    (* besucherzahl karten-preis)))

(= (einnahmen 2) 1000)
(= (einnahmen 10) 5000)

(= (kosten 2) 130)
(= (kosten 10) 650)

(= (profit 2) 870)
(= (profit 10) 4350)