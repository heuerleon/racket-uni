;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ein Punkt ist ein Wert
;; (make-point x y)
;; wobei x und y Zahlen sind und die kartesischen
;; Koordinaten eines Punkts in der Ebene darstellen
(define-struct point [x y])

;; Ein Kreis ist ein Wert
;;     (make-circle center r)
;; wobei center ein Punkt ist, der den Mittelpunkt darstellt
;; und r eine Zahl ist, die den Radius darstellt.
(define-struct circle [center r])

;; Berechnet die Distanz zwischen zwei Punkten
(define point-distance
  (lambda [point-1 point-2]
    (sqrt (+
      (sqr (- (point-x point-1) (point-x point-2)))
      (sqr (- (point-y point-1) (point-y point-2)))
     ))))

;; Prüft, ob ein Punkt in einem Kreis liegt
(define point-in-circle?
  (lambda [point circle]
    (<= (point-distance point (circle-center circle)) (circle-r circle))))

;; Test cases
(< (- (point-distance (make-point 1 1) (make-point 3 4)) 3.6) 0.1)
(< (- (point-distance (make-point 2 3) (make-point 1 5)) 2.23) 0.1)
(< (- (point-distance (make-point 5 2) (make-point 2 7)) 5.83) 0.1)
(< (- (point-distance (make-point -3 10) (make-point -7 9)) 4.12) 0.1)

(point-in-circle? (make-point 1 2) (make-circle (make-point 3 3) 5))
(point-in-circle? (make-point 3 4) (make-circle (make-point 0 1) 6))
(not (point-in-circle? (make-point 0 1) (make-circle (make-point 10 9) 4)))