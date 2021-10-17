#|
Author: Shehzad Anwar
Date: 2/9/21
Description: Scheme Fundamentals
|#

;Part 1
;1
(define run1 (lambda ()(+ 1 2 3)
               )
  )

;2
(define run2 (lambda () (+ (* (+ 2(/ 10 4)) 3) 30)
               )
  )

;3
(define run3 (lambda ()(+ (- (- (* 5 0) 2)(* 5 3)) 10)
               )
  )

;4
(define run4 (lambda ()(* (/ (+ (+ (* 5 8) 10 10) 4)(+ 10 2)) 5)
               )
  )

;5
(define run5 (lambda ()(+ (/ (- (/ (/ (* (+ 3 5)(+ 4 6)) 2) 2) 5) 3)(/ (+ (* 2 10)(* 4 5)) 2)(* 4 5)
                          )
               )
  )


;Part 2
;A
(define how-much-damage-ff6? (lambda (damage defense)
                               (+1
                                (floor (/(* damage (- 255 defense)) 256)
                                       )
                                )
                               )
  )

;B
(define base-attack-ff7 (lambda (strength defense)
                          (+ weapon strength)
                          )
  )

;C
(define base-damage-ff7 (lambda (level attack)
                          (+ attack (*(floor (/(+ level attack) 3))(floor (/(* attack level) 32)
                                                                          )
                                      )
                             )
                          )
  )

;D
(define calculate-power-ff7 (lambda (power base-damage)
                              (* power (/ base damage 16)
                                 )
                              )
  )

;E
(define how-much-damage-ff7? (lambda (defense power)
                               (floor (* power (/ (- 512 defense)512)
                                         )
                                      )
                               )
  )

;F
(define get-attack-damage-ff7 (lambda (level strength weapon power defense)
                                (how-much-damage-ff7? defense
                                                      (calculate-power-ff7 power
                                                                           (base-damage-ff7 level
                                                                                            (base-attack-ff7 strength)
                                                                                            )
                                                                           )
                                                      )
                                )
  )

;Part 3
;A
(define get-second-item (lambda (list)
                          (car (cdr list)
                               )
                          )
  )

;B
(define get-third-item (lambda (list)
                         (car (cdr (cdr list)
                                   )
                              )
                         )
  )

;C
(define list-length? (lambda (list)
                       (if (null? list)
                           0(+ (list-length? (cdr list)
                                             )
                               1)
                           )
                       )
  )

;D
(define arbitrary-cdr (lambda (number list)
                        (if (> number (list-length? list)
                               )
                            #f
                            (if (= number 1)
                                list
                                (arbitrary-cdr (- number 1)(cdr list)
                                               )
                                )
                            )
                        )
  )

;Part 4
;A
(define number-list? (lambda (list)
                       (if (not (number? (car list)
                                         )
                                )
                           #f
                           (if (and (= (list-length? list) 1)
                                    (number? (car list)
                                             )
                                    )
                               #t (number-list? (cdr list)
                                                )
                               )
                           )
                       )
  )

;B
(define sum-number-list (lambda (list)
                          (if (number-list? list)
                              (if (= (list-length? list) 1)
                                  (car list)(+ (car list)(sum-number-list (cdr list)
                                                                          )
                                               )
                                  )
                              #f
                              )
                          )
  )