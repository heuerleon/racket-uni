;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define zylinder-volumen
  (lambda [hoehe radius]
    (* hoehe (kreis-flaeche radius))))

(define kreis-flaeche
  (lambda [radius]
    (* pi (* radius radius))))

(= (kreis-flaeche 25) (* pi (* 25 25)))
(= (kreis-flaeche 30) (* pi (* 30 30)))


(= (zylinder-volumen 30 25) (* 30 (* pi (* 25 25))))
(= (zylinder-volumen 40 30) (* 40 (* pi (* 30 30))))

(define zylinder-oberflaeche
  (lambda [hoehe radius]
    (+ (* 2 (kreis-flaeche radius)) (mantel-flaeche hoehe radius))))

(define mantel-flaeche
  (lambda [hoehe radius]
    (* hoehe (umfang radius))))

(define umfang
  (lambda [radius]
    (* 2 pi radius)))

(= (umfang 3) (* 2 pi 3))
(= (umfang 5) (* 2 pi 5))

(= (mantel-flaeche 7 3) (* 7 (* 2 pi 3)))
(= (mantel-flaeche 7 5) (* 7 (* 2 pi 5)))

(= (zylinder-oberflaeche 7 3) (+ (* 2 (* pi (* 3 3))) (* 7 (* 2 pi 3))))
(= (zylinder-oberflaeche 7 5) (+ (* 2 (* pi (* 5 5))) (* 7 (* 2 pi 5))))

(define rohr-oberflaeche
  (lambda [innenradius wandstaerke laenge]
    (+ (rohr-mantelsumme innenradius wandstaerke laenge)

(define rohr-mantelsumme
  (lambda [innenradius wandstaerke laenge]
    (+ (zylinder-oberflaeche laenge innenradius) (zylinder-oberflaeche laenge (+ innenradius wandstaerke)))))

(define rohr-kreissumme
  (lambda [innenradius wandstaerke]
    (- (kreis-flaeche (+ innenradius wandstaerke)) (kreis-flaeche innenradius))))

