;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define grundmiete 500)

;; Calculates the rent for a monopoly train station depending on the amount of train stations owned
(define monopoly-miete
  (lambda [bahnhoefe]
    (* 500 (expt 2 (- bahnhoefe 1)))))

(= (monopoly-miete 1) 500)
(= (monopoly-miete 4) 4000)
(= (monopoly-miete 2) 1000)