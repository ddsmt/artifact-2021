(set-logic QF_UFLIA)
(declare-fun i1 () Int)
(declare-fun i4 () Int)
(declare-fun i7 () Int)
(declare-fun i9 () Int)
(declare-fun i10 () Int)
(assert (= 327 i7 ((_ iand 4) i4 i9) i10 i1))
(check-sat)
