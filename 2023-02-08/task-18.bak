;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname task-18) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; concatenate akzeptiert zwei Listen und hängt diese aneinander
(check-expect
 (concatenate '() '())
 '())
(check-expect
 (concatenate '(A) '(B))
 '(A B))
(check-expect
 (concatenate '() '(A))
 '(A))
(check-expect
 (concatenate '(A) '())
 '(A))
(check-expect
 (concatenate '(A B C) '(D E F))
 '(A B C D E F))

;; concatenate: list, list -> list
(define concatenate
  (lambda [list1 list2]
    (cond
      [(empty? list2) list1]
      [(empty? list1) list2]
      [else (concatenate (append list1 (list (first list2))) (rest list2))]
      )))


;; mult-2-num-lists nimmt zwei gleich lange Listen an Zahlen
;; und multipliziert die korrespondierenden Elemente
(check-expect
 (mult-2-num-lists '() '())
 '())
(check-expect
 (mult-2-num-lists '(1 2 3) '(4 5 6))
 '(4 10 18))
(check-error
 (mult-2-num-lists '(1) '()))
(check-error
 (mult-2-num-lists '() '(1)))

;; mult-2-num-lists: list, list -> list
(define mult-2-num-lists
  (lambda [list1 list2]
    (cond
      [(not (= (length list1) (length list2))) (error 'mult-2-num-lists "Die Listen müssen gleich lang sein.")]
      [(empty? list1) '()]
      [else (append (list (* (first list1) (first list2))) (mult-2-num-lists (rest list1) (rest list2)))]
      )))


;; merge akzeptiert zwei sortierte Listen von Zahlen
;; und gibt eine sortierte Liste zurück, die alle Elemente
;; beider Listen enthält.
(check-expect
 (merge '() '())
 '())
(check-expect
 (merge '(2 3 4 11) '(1 4 7 8 9))
 '(1 2 3 4 4 7 8 9 11))
(check-expect
 (merge '(2 5 7) '(1 3 5 9))
 '(1 2 3 5 5 7 9))

;; merge: list, list -> list
(define merge
  (lambda [list1 list2]
    (cond
      [(empty? list1) list2]
      [(empty? list2) list1]
      [(< (first list1) (first list2)) (cons (first list1) (merge (rest list1) list2))]
      [else (cons (first list2) (merge list1 (rest list2)))]
     )))