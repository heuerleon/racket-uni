;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-17-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; flatten akzeptiert eine Liste und bringt alle Elemente aus enthaltenen Sublisten auf die selbe Ebene
(check-expect
 (flatten '())
 '())
(check-expect
 (flatten '(A))
 '(A))
(check-expect
 (flatten '(A B))
 '(A B))
(check-expect
 (flatten '(A B C D E F))
 '(A B C D E F))
(check-expect
 (flatten '(A (B C) (D (E)) ((F))))
 '(A B C D E F))
(check-expect
 (flatten '(((A B C)) D (E) ((F) G) H))
 '(A B C D E F G H))

;; flatten: list -> list
(define flatten
  (lambda [list]
    (cond
      [(empty? list) list]
      [(= 1 (length list)) (cond
                             [(list? (first list)) (flatten (first list))]
                             [else (cons (first list) empty)]
                             )]
      [else (append
             (cond
               [(list? (first list)) (flatten (first list))]
               [else (cons (first list) empty)])
             (flatten (rest list))
             )]
      )))


;; frequencies: list -> list of pairs
(define frequencies
  (lambda [list]
    ()))
