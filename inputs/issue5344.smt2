(set-logic ALL)
(declare-datatypes ((a 0)) (((b (c (_ BitVec 32)) (d a)) (r))))
(declare-fun e () Bool)
(declare-fun f (a (_ BitVec 32)) Bool)
(declare-fun s () a)
(declare-fun g ((_ BitVec 32) a) a)
(declare-sort h 0)
(declare-fun j (h) a)
(declare-fun k (h) (_ BitVec 32))
(declare-sort l 0)
(declare-fun m (l) (_ BitVec 32))
(declare-fun n (l) a)
(assert (forall ((i h)) (= (f (j i) (k i)) (ite ((_ is r) (j i)) false
 (ite ((_ is b) (j i)) (= (c (j i)) (k i)) e)))))
(assert (forall ((i l)) (= (g (m i) (n i)) (ite ((_ is r) (n i)) r
 (ite ((_ is b) (n i)) (ite (bvugt (c (n i)) (m i)) (b (c (n i)) (g
 (m i) (d (n i)))) (g (m i) (d (n i)))) s)))))
(assert (exists ((o a) (t (_ BitVec 32)) (p (_ BitVec 32))) (not (=>
 (or (or (not (bvslt t p)) (not (forall ((q h)) (not (= (k q) t)))))
 (f (g p (d o)) t)) (or (not (and (f o t) (not (forall ((q h)) (not
 (and (= (j q) o) (= (k q) t))))))) (f (g p o) t) (forall ((q h))
 (not (and (= (j q) (g p o)) (= (k q) t)))) (forall ((q l)) (not (and
 (= (m q) p) (= (n q) o)))))))))
(check-sat)
