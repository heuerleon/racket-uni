;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ein Zeitpunkt (nach Mitternacht) ist ein Wert
;;     (make-timepoint h m s)
;; wobei h die Stunden, m die Minuten und s die Sekunden sind.
;; Die Werte sind jeweils Zahlen.
(define-struct timepoint [h m s])

;; Konvertiert einen Zeitpunkt seit Mitternacht
(define time-to-secs
  (lambda [timepoint]
    (+ (* (timepoint-h timepoint) 60 60) (* (timepoint-m timepoint) 60) (timepoint-s timepoint))))

;; Test cases
(= (time-to-secs (make-timepoint 0 10 10)) 610)
(= (time-to-secs (make-timepoint 12 30 20)) 45020)
(= (time-to-secs (make-timepoint 8 20 0)) 30000)
