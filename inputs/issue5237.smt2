(set-logic QF_LIA)
(declare-fun x () Int)
(check-sat)
(get-value ( x (div x 5) 0))
