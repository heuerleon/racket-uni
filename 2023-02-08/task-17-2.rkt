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
      [(list? (first list)) (append (flatten (first list)) (flatten (rest list)))]
      [else (cons (first list) (flatten (rest list)))]
      )))


;; anzahl-bevor-summe-erreicht akzeptiert eine Zahl sum und eine Liste.
;; Die Zahl gibt die zu erreichende Summe an und die Liste enthält
;; Zahlen, die aufaddiert werden. Die Funktion gibt eine ganze Zahl n
;; zurück, sodass die Summe der ersten n Elemente der Liste kleiner als sum,
;; die Summe der ersten n+1 Elemente hingegen größer oder gleich sum ist. 
(check-expect
 (anzahl-bevor-summe-erreicht 2 '(2 5 7))
 0)
(check-expect
 (anzahl-bevor-summe-erreicht 4 '(2 5 7))
 1)
(check-expect
 (anzahl-bevor-summe-erreicht 8 '(2 5 7))
 2)
(check-expect
 (anzahl-bevor-summe-erreicht 0 '(1))
 0)
(check-expect
 (anzahl-bevor-summe-erreicht 30 '(4 1 6 10 9 13))
 4)
(check-expect
 (anzahl-bevor-summe-erreicht 10 '(3 3 3 1))
 3)
(check-error
 (anzahl-bevor-summe-erreicht 15 '(2 5 7)))

;; anzahl-bevor-summe-erreicht: number, list -> number
(define anzahl-bevor-summe-erreicht
  (lambda [sum list]
    (cond
      [(empty? list) (error 'anzahl-bevor-summe-erreicht "Summe der Listenelemente zu klein.")]
      [(< (first list) sum) (+ 1 (anzahl-bevor-summe-erreicht (- sum (first list)) (rest list)))]
      [else 0])))