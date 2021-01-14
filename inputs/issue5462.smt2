(declare-fun a () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun b () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun c () (_ BitVec 1))
(declare-fun d () (_ BitVec 1))
(declare-fun n () (_ BitVec 1))
(declare-fun e () (_ BitVec 1))
(declare-fun f () (_ BitVec 1))
(declare-fun o () (_ BitVec 1))
(declare-fun g () (_ BitVec 32))
(declare-fun h () (_ BitVec 32))
(declare-fun i () (_ BitVec 32))
(declare-fun j () (_ BitVec 32))
(declare-fun k () (_ BitVec 32))
(declare-fun l () (_ BitVec 32))
(declare-fun m () (_ BitVec 32))
(assert (= (_ bv1 1) (bvand (bvmul (ite (= o (ite (= g h) (_ bv1 1) (_
 bv0 1))) (_ bv1 1) (_ bv0 1)) (bvnor (ite (= f (ite (= h (bvor
 (bvlshr (bvor (concat (_ bv0 24) (select b (bvadd i (_ bv0 32))))
 (bvshl (concat (_ bv0 24) (select b (bvudiv i (_ bv1 32)))) (_ bv8
 32))) (bvshl (concat (_ bv0 24) (select b (bvadd i (_ bv2 32)))) (_
 bv16 32))) (bvshl (concat (_ bv0 24) (select b (bvadd i (_ bv3
 32)))) (_ bv24 32)))) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1))
 (bvsmod (ite (= e (ite (= i (bvadd j (_ bv4 32))) (_ bv1 1) (_ bv0
 1))) (_ bv1 1) (_ bv0 1)) (bvshl (ite (= n (ite (= b (store (store
 (store (store a (bvadd j (_ bv3 32)) ((_ extract 7 0) (bvlshr l (_
 bv24 32)))) (bvsdiv j (_ bv2 32)) ((_ extract 7 0) (bvlshr l (_ bv16
 32)))) (bvadd j (_ bv1 32)) ((_ extract 7 0) (bvadd l (_ bv8 32))))
 (bvadd j (_ bv0 32)) ((_ extract 7 0) l))) (_ bv1 1) (_ bv0 1))) (_
 bv1 1) (_ bv0 1)) (bvand (ite (= d (ite (= j (bvudiv m (_ bv4 32)))
 (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1)) (ite (= c (ite (= k (bvor
 (bvadd (bvor (concat (_ bv0 24) (select a (bvnor m (_ bv0 32))))
 (bvadd (concat (_ bv0 24) (select a (bvadd m (_ bv1 32)))) (_ bv8
 32))) (bvshl (concat (_ bv0 24) (select a (bvadd m (_ bv2 32)))) (_
 bv16 32))) (bvshl (concat (_ bv0 24) (select a (bvadd m (_ bv3
 32)))) (_ bv24 32)))) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0
 1))))))) (bvand (bvnot (_ bv0 1)) (bvand (bvand c (bvand d (bvudiv n
 (bvand e (bvand f o))))) (ite (= k g) (_ bv1 1) (_ bv0 1)))))))
(check-sat)
