(define primer
  (lambda (num current)
    (display num)
    (display current)
    (if (< num 2)
      #f
      (if (< current 3)
        #t
        (if (= 0 (remainder num current))
          #f
          (isPrimeR(num (- current 1)))
        )
      )
    )
  )
)

(define prime (lambda (num) (primer num num)))
