;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define sollzeit 160)

(define-struct festangestellter [name grundgehalt stunden])
(define-struct werkstudent [name stundenlohn stunden])

;; Berechnet den Bruttomonatslohn eines Mitarbeiters
(check-expect
 (monatslohn (make-festangestellter "Hans" 4000 160))
 4000)
(check-expect
 (monatslohn (make-festangestellter "Dieter" 4000 200))
 5250)
(check-expect
 (monatslohn (make-festangestellter "Peter" 5000 140))
 5000)
(check-expect
 (monatslohn (make-werkstudent "Heinrich" 15 150))
 2250)
(check-expect
 (monatslohn (make-werkstudent "Georg" 20 170))
 3400)

(define monatslohn
  (lambda [mitarbeiter]
    (cond
      [(festangestellter? mitarbeiter) (+ (festangestellter-grundgehalt mitarbeiter) (* (ueberstunden mitarbeiter) 1.25 (/ (festangestellter-grundgehalt mitarbeiter) sollzeit)))]
      [(werkstudent? mitarbeiter) (* (werkstudent-stundenlohn mitarbeiter) (werkstudent-stunden mitarbeiter))]
      )))


;; Berechnet die Anzahl der Überstunden eines Mitarbeiters
(check-expect
 (ueberstunden (make-festangestellter "Johann" 3000 200))
 40)
(check-expect
 (ueberstunden (make-festangestellter "Bodo" 3000 160))
 0)
(check-expect
 (ueberstunden (make-festangestellter "Tristan" 3000 100))
 0)

(define ueberstunden
  (lambda [mitarbeiter]
    (cond
      [(festangestellter? mitarbeiter) (max 0 (- (festangestellter-stunden mitarbeiter) sollzeit))]
      [else 0]
      )))
