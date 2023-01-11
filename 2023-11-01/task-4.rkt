;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define quader-volumen
  (lambda [length width height]
    (* length width height)))

(define train-crash
  (lambda [distance speed-a speed-b]
    (/ distance (+ speed-a speed-b))))

(define monopoly-rent
  (lambda [station-count]
    (* 500 (expt 2 (- station-count 1)))))