(declare-fun i2 () Int)
(assert (>= 34 (* i2 i2 34)))
(check-sat)
(assert (<= (+ 2245 i2 0) 112))
(check-sat)
