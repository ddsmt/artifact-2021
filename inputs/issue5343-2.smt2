(set-logic QF_ALL_SUPPORTED)
(declare-fun i4 () Int)
(assert (sep (pto 0 (- i4)) true))
(check-sat)
