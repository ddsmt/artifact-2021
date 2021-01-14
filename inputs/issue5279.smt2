(set-logic LIA)
(assert (forall ((a Int) (b Bool)) (= a (ite b 0 1))))
(check-sat)
