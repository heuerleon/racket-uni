;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Berechnet das nettoeinkommen aus dem einkommen
;; einkommen: N (nat. Zahlen)
(define nettoeinkommen
  (lambda [einkommen]
    (- einkommen (steuern einkommen))))

;; Berechnet, wie viele Steuern man vom Bruttoeinkommen bezahlen muss
;; einkommen: N (nat. Zahlen)
(define steuern
  (lambda [einkommen]
    (cond
      [(> einkommen 10000) (+ (* (- einkommen 10000) 0.2) 750)]
      [(> einkommen 5000) (* (- einkommen 5000) 0.15)]
      [else 0])))

(= (steuern 5000) 0)
(= (steuern 5100) 15)
(= (steuern 10100) 770)

(= (nettoeinkommen 5000) 5000)
(= (nettoeinkommen 5100) 5085)
(= (nettoeinkommen 10100) 9330)