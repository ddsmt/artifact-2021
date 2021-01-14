(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$MAIN2$0$PAs@1 () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id IS_base_MAIN2)
(assert (not
 (=> (= (ControlFlow 0 0) 119236) (let ((inline$MAIN2$0$Return_correct  (=> (= (ControlFlow 0 91120) (- 0 119628)) (and (and (and (and (exists ((k Int) ) (!  (and (and (and (and (and (and (trigger k) (trigger (ite (< k n) (+ k 1) 1))) (trigger (+ n 1))) (<= 1 k)) (<= k (+ n 1))) (= inline$MAIN2$0$PAs@1 (|lambda#4|  (and (<= 1 k) (<= k n)) (q@max id@@0) k 1 0))) true)
 :qid |ChangRob.92:11|
 :skolemid |5|
 :pattern ( (trigger k))
)) (forall ((i@@3 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@3) (<= i@@3 n)) (> (select (select channel@0 i@@3) msg) 0)) (and (<= msg (select id@@0 (q@max id@@0))) (forall ((j Int) ) (!  (=> (and (and (and (and (<= 1 i@@3) (<= i@@3 n)) (and (<= 1 j) (<= j n))) (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n))) (or (or (and (<= i@@3 j) (< j (q@max id@@0))) (and (< (q@max id@@0) i@@3) (<= i@@3 j))) (and (< j (q@max id@@0)) (< (q@max id@@0) i@@3)))) (not (= msg (select id@@0 j))))
 :qid |ChangRob.98:100|
 :skolemid |6|
))))
 :qid |ChangRob.98:18|
 :skolemid |7|
))) (forall ((i@@4 Int) ) (!  (=> (and (and (<= 1 i@@4) (<= i@@4 n)) (not (= i@@4 (q@max id@@0)))) (not (select leader i@@4)))
 :qid |ChangRob.99:18|
 :skolemid |8|
))) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN2$0$PAs@1))) (= id@@0 id@@0)))))
(let ((inline$MAIN2$0$anon0_correct  (=> (and (forall ((i@@5 Int) ) (!  (=> (and (<= 1 i@@5) (<= i@@5 n)) (= (select channel@0 (ite (< i@@5 n) (+ i@@5 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@5) 1)))
 :qid |ChangRob.158:18|
 :skolemid |11|
)) (forall ((i@@6 Int) ) (!  (=> (or (< i@@6 1) (> i@@6 n)) (= (select channel@0 i@@6) (|lambda#0| 0)))
 :qid |ChangRob.159:18|
 :skolemid |12|
))) (=> (and (and (forall ((i@@7 Int) (msg@@0 Int) ) (!  (=> (and (and (<= 1 i@@7) (<= i@@7 n)) (> (select (select channel@0 i@@7) msg@@0) 0)) (= msg@@0 (select id@@0 (ite (> i@@7 1) (- i@@7 1) n))))
 :qid |ChangRob.160:18|
 :skolemid |13|
)) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN2$0$PAs@1)) (= (ControlFlow 0 91112) 91120))) inline$MAIN2$0$Return_correct))))
(let ((init_correct  (and (=> (= (ControlFlow 0 91118) (- 0 119464)) (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@8 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@8) (select id@@0 j@@0)) (= i@@8 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@9 Int) (j@@1 Int) ) (!  (=> (= (select id@@0 i@@9) (select id@@0 j@@1)) (= i@@9 j@@1))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (=> (= (ControlFlow 0 91118) (- 0 119476)) (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1))) (=> (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1)) (=> (= (ControlFlow 0 91118) 91112) inline$MAIN2$0$anon0_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@10 Int) (j@@2 Int) ) (!  (=> (= (select id@@0 i@@10) (select id@@0 j@@2)) (= i@@10 j@@2))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 119236) 91118)) init_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$INV2$0$PAs@0 () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun inline$INV2$0$choice@0 () T@PA)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id IS_conclusion_MAIN2)
(assert (not
 (=> (= (ControlFlow 0 0) 119839) (let ((inline$INV2$0$Return_correct  (=> (forall ((pa@@5 T@PA) ) (!  (=> (> (select inline$INV2$0$PAs@0 pa@@5) 0) (not (is-P_PA pa@@5)))
 :qid |unknown.0:0|
 :skolemid |76|
)) (and (=> (= (ControlFlow 0 91684) (- 0 120176)) (and (and (forall ((i@@3 Int) ) (!  (=> (and (and (<= 1 i@@3) (<= i@@3 n)) (not (= i@@3 (q@max id@@0)))) (not (select leader@0 i@@3)))
 :qid |ChangRob.79:18|
 :skolemid |4|
)) (= pendingAsyncs@0 pendingAsyncs)) (= id@@0 id@@0))) (=> (and (and (forall ((i@@4 Int) ) (!  (=> (and (and (<= 1 i@@4) (<= i@@4 n)) (not (= i@@4 (q@max id@@0)))) (not (select leader@0 i@@4)))
 :qid |ChangRob.79:18|
 :skolemid |4|
)) (= pendingAsyncs@0 pendingAsyncs)) (= id@@0 id@@0)) (=> (= (ControlFlow 0 91684) (- 0 120215)) (forall ((pa@@6 T@PA) ) (! (= (select inline$INV2$0$PAs@0 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |75|
))))))))
(let ((inline$INV2$0$anon0_correct  (=> (exists ((k Int) ) (!  (and (and (and (and (and (and (trigger k) (trigger (ite (< k n) (+ k 1) 1))) (trigger (+ n 1))) (<= 1 k)) (<= k (+ n 1))) (= inline$INV2$0$PAs@0 (|lambda#4|  (and (<= 1 k) (<= k n)) (q@max id@@0) k 1 0))) (= inline$INV2$0$choice@0 (P_PA k)))
 :qid |ChangRob.92:11|
 :skolemid |5|
 :pattern ( (trigger k))
)) (=> (and (and (forall ((i@@5 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg) 0)) (and (<= msg (select id@@0 (q@max id@@0))) (forall ((j Int) ) (!  (=> (and (and (and (and (<= 1 i@@5) (<= i@@5 n)) (and (<= 1 j) (<= j n))) (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n))) (or (or (and (<= i@@5 j) (< j (q@max id@@0))) (and (< (q@max id@@0) i@@5) (<= i@@5 j))) (and (< j (q@max id@@0)) (< (q@max id@@0) i@@5)))) (not (= msg (select id@@0 j))))
 :qid |ChangRob.98:100|
 :skolemid |6|
))))
 :qid |ChangRob.98:18|
 :skolemid |7|
)) (forall ((i@@6 Int) ) (!  (=> (and (and (<= 1 i@@6) (<= i@@6 n)) (not (= i@@6 (q@max id@@0)))) (not (select leader@0 i@@6)))
 :qid |ChangRob.99:18|
 :skolemid |8|
))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV2$0$PAs@0)) (= (ControlFlow 0 91653) 91684))) inline$INV2$0$Return_correct))))
(let ((init_correct  (and (=> (= (ControlFlow 0 91661) (- 0 119936)) (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@7 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@7) (select id@@0 j@@0)) (= i@@7 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@8 Int) (j@@1 Int) ) (!  (=> (= (select id@@0 i@@8) (select id@@0 j@@1)) (= i@@8 j@@1))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (=> (= (ControlFlow 0 91661) 91653) inline$INV2$0$anon0_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@9 Int) (j@@2 Int) ) (!  (=> (= (select id@@0 i@@9) (select id@@0 j@@2)) (= i@@9 j@@2))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 119839) 91661)) init_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun PAs@1 () (Array T@PA Int))
(declare-fun PAs@0 () (Array T@PA Int))
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun leader@2 () (Array Int Bool))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun |inline$P'$0$pid@0| () Int)
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun |Trigger_P'_msg| (Int) Bool)
(declare-fun inline$INV2$0$choice@0 () T@PA)
(declare-fun inline$INV2$0$PAs@0 () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id IS_step_MAIN2)
(assert (not
 (=> (= (ControlFlow 0 0) 120233) (let ((|inline$P'$0$Return_correct|  (=> (and (= PAs@1 ((_ map (+ (Int Int) Int)) PAs@0 |inline$P'$0$PAs@4|)) (= (ControlFlow 0 92708) (- 0 121103))) (and (and (and (and (exists ((k Int) ) (!  (and (and (and (and (and (and (trigger k) (trigger (ite (< k n) (+ k 1) 1))) (trigger (+ n 1))) (<= 1 k)) (<= k (+ n 1))) (= PAs@1 (|lambda#4|  (and (<= 1 k) (<= k n)) (q@max id@@0) k 1 0))) true)
 :qid |ChangRob.92:11|
 :skolemid |5|
 :pattern ( (trigger k))
)) (forall ((i@@3 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@3) (<= i@@3 n)) (> (select (select channel@4 i@@3) msg) 0)) (and (<= msg (select id@@0 (q@max id@@0))) (forall ((j Int) ) (!  (=> (and (and (and (and (<= 1 i@@3) (<= i@@3 n)) (and (<= 1 j) (<= j n))) (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n))) (or (or (and (<= i@@3 j) (< j (q@max id@@0))) (and (< (q@max id@@0) i@@3) (<= i@@3 j))) (and (< j (q@max id@@0)) (< (q@max id@@0) i@@3)))) (not (= msg (select id@@0 j))))
 :qid |ChangRob.98:100|
 :skolemid |6|
))))
 :qid |ChangRob.98:18|
 :skolemid |7|
))) (forall ((i@@4 Int) ) (!  (=> (and (and (<= 1 i@@4) (<= i@@4 n)) (not (= i@@4 (q@max id@@0)))) (not (select leader@2 i@@4)))
 :qid |ChangRob.99:18|
 :skolemid |8|
))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs PAs@1))) (= id@@0 id@@0)))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) pendingAsyncs@1 (store (|lambda#1| 0) (P_PA |inline$P'$0$pid@0|) 1))) (= (ControlFlow 0 92646) 92708)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA |inline$P'$0$pid@0|) 1)) (=> (and (and (= channel@4 channel@3) (= leader@2 leader@0)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|) (= (ControlFlow 0 92628) 92646))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (>= (select id@@0 |inline$P'$0$pid@0|) |inline$P'$0$msg@0|) (=> (and (= channel@3 channel@1) (= (ControlFlow 0 92616) 92628)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (and (and (> |inline$P'$0$msg@0| (select id@@0 |inline$P'$0$pid@0|)) (= channel@2 (store channel@1 (ite (< |inline$P'$0$pid@0| n) (+ |inline$P'$0$pid@0| 1) 1) (store (select channel@1 (ite (< |inline$P'$0$pid@0| n) (+ |inline$P'$0$pid@0| 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@1 (ite (< |inline$P'$0$pid@0| n) (+ |inline$P'$0$pid@0| 1) 1)) |inline$P'$0$msg@0|) 1))))) (and (= channel@3 channel@2) (= (ControlFlow 0 92674) 92628))) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 |inline$P'$0$pid@0|))) (and (=> (= (ControlFlow 0 92604) 92674) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 92604) 92616) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (= |inline$P'$0$msg@0| (select id@@0 |inline$P'$0$pid@0|)) (=> (and (= leader@1 (store leader@0 |inline$P'$0$pid@0| true)) (= |inline$P'$0$PAs@2| (|lambda#1| 0))) (=> (and (and (= channel@4 channel@1) (= leader@2 leader@1)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|) (= (ControlFlow 0 92690) 92646))) |inline$P'$0$anon7_correct|)))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel@0 |inline$P'$0$pid@0|) |inline$P'$0$msg@0|) 0) (= channel@1 (store channel@0 |inline$P'$0$pid@0| (store (select channel@0 |inline$P'$0$pid@0|) |inline$P'$0$msg@0| (- (select (select channel@0 |inline$P'$0$pid@0|) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 92592) 92690) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 92592) 92604) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (=> (and (and (= channel@4 channel@0) (= leader@2 leader@0)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|) (= (ControlFlow 0 92694) 92646))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 92562) 92694) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 92562) 92592) |inline$P'$0$anon8_Else_correct|)))))
(let ((|inline$P'$0$Entry_correct|  (=> (and (= |inline$P'$0$pid@0| (|pid#P_PA| inline$INV2$0$choice@0)) (= (ControlFlow 0 92556) 92562)) |inline$P'$0$anon0_correct|)))
(let ((inline$INV2$0$Return_correct  (=> (exists ((pa@@5 T@PA) ) (!  (and (is-P_PA pa@@5) (> (select inline$INV2$0$PAs@0 pa@@5) 0))
 :qid |unknown.0:0|
 :skolemid |77|
)) (and (=> (= (ControlFlow 0 92700) (- 0 120727)) (and (is-P_PA inline$INV2$0$choice@0) (> (select inline$INV2$0$PAs@0 inline$INV2$0$choice@0) 0))) (=> (and (is-P_PA inline$INV2$0$choice@0) (> (select inline$INV2$0$PAs@0 inline$INV2$0$choice@0) 0)) (=> (and (= PAs@0 (store inline$INV2$0$PAs@0 inline$INV2$0$choice@0 (- (select inline$INV2$0$PAs@0 inline$INV2$0$choice@0) 1))) (is-P_PA inline$INV2$0$choice@0)) (and (=> (= (ControlFlow 0 92700) (- 0 120762)) (and (<= 1 (|pid#P_PA| inline$INV2$0$choice@0)) (<= (|pid#P_PA| inline$INV2$0$choice@0) n))) (=> (and (<= 1 (|pid#P_PA| inline$INV2$0$choice@0)) (<= (|pid#P_PA| inline$INV2$0$choice@0) n)) (and (=> (= (ControlFlow 0 92700) (- 0 120767)) (> (select pendingAsyncs@0 (P_PA (|pid#P_PA| inline$INV2$0$choice@0))) 0)) (=> (> (select pendingAsyncs@0 (P_PA (|pid#P_PA| inline$INV2$0$choice@0))) 0) (and (=> (= (ControlFlow 0 92700) (- 0 120779)) (forall ((m Int) ) (!  (=> (> (select (select channel@0 (|pid#P_PA| inline$INV2$0$choice@0)) m) 0) (<= m (select id@@0 (q@max id@@0))))
 :qid |ChangRob.113:18|
 :skolemid |9|
))) (=> (forall ((m@@0 Int) ) (!  (=> (> (select (select channel@0 (|pid#P_PA| inline$INV2$0$choice@0)) m@@0) 0) (<= m@@0 (select id@@0 (q@max id@@0))))
 :qid |ChangRob.113:18|
 :skolemid |9|
)) (and (=> (= (ControlFlow 0 92700) (- 0 120810)) (forall ((j@@0 Int) ) (!  (=> (and (and (<= 1 j@@0) (<= j@@0 n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 j@@0) (<= j@@0 n))) (and (<= 1 (|pid#P_PA| inline$INV2$0$choice@0)) (<= (|pid#P_PA| inline$INV2$0$choice@0) n))) (or (or (or (and (< (q@max id@@0) j@@0) (< j@@0 (|pid#P_PA| inline$INV2$0$choice@0))) (and (< (|pid#P_PA| inline$INV2$0$choice@0) (q@max id@@0)) (< (q@max id@@0) j@@0))) (and (< j@@0 (|pid#P_PA| inline$INV2$0$choice@0)) (< (|pid#P_PA| inline$INV2$0$choice@0) (q@max id@@0)))) (and (= (q@max id@@0) (|pid#P_PA| inline$INV2$0$choice@0)) (not (= (q@max id@@0) j@@0)))))) (= (select pendingAsyncs@0 (P_PA j@@0)) 0))
 :qid |ChangRob.115:18|
 :skolemid |10|
))) (=> (forall ((j@@1 Int) ) (!  (=> (and (and (<= 1 j@@1) (<= j@@1 n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 j@@1) (<= j@@1 n))) (and (<= 1 (|pid#P_PA| inline$INV2$0$choice@0)) (<= (|pid#P_PA| inline$INV2$0$choice@0) n))) (or (or (or (and (< (q@max id@@0) j@@1) (< j@@1 (|pid#P_PA| inline$INV2$0$choice@0))) (and (< (|pid#P_PA| inline$INV2$0$choice@0) (q@max id@@0)) (< (q@max id@@0) j@@1))) (and (< j@@1 (|pid#P_PA| inline$INV2$0$choice@0)) (< (|pid#P_PA| inline$INV2$0$choice@0) (q@max id@@0)))) (and (= (q@max id@@0) (|pid#P_PA| inline$INV2$0$choice@0)) (not (= (q@max id@@0) j@@1)))))) (= (select pendingAsyncs@0 (P_PA j@@1)) 0))
 :qid |ChangRob.115:18|
 :skolemid |10|
)) (=> (= (ControlFlow 0 92700) 92556) |inline$P'$0$Entry_correct|)))))))))))))))
(let ((inline$INV2$0$anon0_correct  (=> (exists ((k@@0 Int) ) (!  (and (and (and (and (and (and (trigger k@@0) (trigger (ite (< k@@0 n) (+ k@@0 1) 1))) (trigger (+ n 1))) (<= 1 k@@0)) (<= k@@0 (+ n 1))) (= inline$INV2$0$PAs@0 (|lambda#4|  (and (<= 1 k@@0) (<= k@@0 n)) (q@max id@@0) k@@0 1 0))) (= inline$INV2$0$choice@0 (P_PA k@@0)))
 :qid |ChangRob.92:11|
 :skolemid |5|
 :pattern ( (trigger k@@0))
)) (=> (and (and (forall ((i@@5 Int) (msg@@0 Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg@@0) 0)) (and (<= msg@@0 (select id@@0 (q@max id@@0))) (forall ((j@@2 Int) ) (!  (=> (and (and (and (and (<= 1 i@@5) (<= i@@5 n)) (and (<= 1 j@@2) (<= j@@2 n))) (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n))) (or (or (and (<= i@@5 j@@2) (< j@@2 (q@max id@@0))) (and (< (q@max id@@0) i@@5) (<= i@@5 j@@2))) (and (< j@@2 (q@max id@@0)) (< (q@max id@@0) i@@5)))) (not (= msg@@0 (select id@@0 j@@2))))
 :qid |ChangRob.98:100|
 :skolemid |6|
))))
 :qid |ChangRob.98:18|
 :skolemid |7|
)) (forall ((i@@6 Int) ) (!  (=> (and (and (<= 1 i@@6) (<= i@@6 n)) (not (= i@@6 (q@max id@@0)))) (not (select leader@0 i@@6)))
 :qid |ChangRob.99:18|
 :skolemid |8|
))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV2$0$PAs@0)) (= (ControlFlow 0 92220) 92700))) inline$INV2$0$Return_correct))))
(let ((inline$INV2$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@7 Int) (j@@3 Int) ) (!  (=> (= (select id@@0 i@@7) (select id@@0 j@@3)) (= i@@7 j@@3))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 120233) 92220)) inline$INV2$0$anon0_correct)))
inline$INV2$0$Entry_correct)))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$MAIN1$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun leader () (Array Int Bool))
(declare-fun pids () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id IS_base_MAIN1)
(assert (not
 (=> (= (ControlFlow 0 0) 121293) (let ((inline$MAIN1$0$Return_correct  (=> (= (ControlFlow 0 92983) (- 0 121591)) (and (and (and (exists ((k Int) ) (!  (and (and (and (and (and (and (and (or (and (<= 1 k) (<= k n)) (= k 0)) (trigger (+ k 1))) (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 k)) (= (select channel (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.176:13|
 :skolemid |14|
))) (forall ((i@@4 Int) ) (!  (=> (and (< k i@@4) (<= i@@4 n)) (= (select channel (ite (< i@@4 n) (+ i@@4 1) 1)) (|lambda#0| 0)))
 :qid |ChangRob.177:13|
 :skolemid |15|
))) (forall ((i@@5 Int) ) (!  (=> (or (< i@@5 1) (> i@@5 n)) (= (select channel i@@5) (|lambda#0| 0)))
 :qid |ChangRob.178:13|
 :skolemid |16|
))) (= inline$MAIN1$0$PAs@1 (|lambda#6| k n 1 1 k 1 0))) true) (=> (< k n) (> (select inline$MAIN1$0$PAs@1 (PInit_PA n)) 0)))
 :qid |ChangRob.175:11|
 :skolemid |17|
 :pattern ( (trigger k))
)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN1$0$PAs@1))) (= id@@0 id@@0)) (= leader leader)))))
(let ((inline$MAIN1$0$anon0_correct  (=> (= inline$MAIN1$0$PAs@1 (|lambda#7| 1 0)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN1$0$PAs@1)) (= (ControlFlow 0 92975) 92983)) inline$MAIN1$0$Return_correct))))
(let ((init_correct  (and (=> (= (ControlFlow 0 92981) (- 0 121541)) (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j)) (= i@@6 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@7 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@7) (select id@@0 j@@0)) (= i@@7 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (=> (= (ControlFlow 0 92981) (- 0 121553)) (trigger 0)) (=> (trigger 0) (=> (= (ControlFlow 0 92981) 92975) inline$MAIN1$0$anon0_correct)))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@8 Int) (j@@1 Int) ) (!  (=> (= (select id@@0 i@@8) (select id@@0 j@@1)) (= i@@8 j@@1))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 121293) 92981)) init_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$INV1$0$PAs@0 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun leader () (Array Int Bool))
(declare-fun inline$INV1$0$choice@0 () T@PA)
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id IS_conclusion_MAIN1)
(assert (not
 (=> (= (ControlFlow 0 0) 121803) (let ((inline$INV1$0$Return_correct  (=> (and (forall ((pa@@5 T@PA) ) (!  (=> (> (select inline$INV1$0$PAs@0 pa@@5) 0) (not (is-PInit_PA pa@@5)))
 :qid |unknown.0:0|
 :skolemid |78|
)) (= (ControlFlow 0 93599) (- 0 122262))) (and (and (and (and (and (and (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 n)) (= (select channel@0 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.158:18|
 :skolemid |11|
)) (forall ((i@@4 Int) ) (!  (=> (or (< i@@4 1) (> i@@4 n)) (= (select channel@0 i@@4) (|lambda#0| 0)))
 :qid |ChangRob.159:18|
 :skolemid |12|
))) (forall ((i@@5 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg) 0)) (= msg (select id@@0 (ite (> i@@5 1) (- i@@5 1) n))))
 :qid |ChangRob.160:18|
 :skolemid |13|
))) (= inline$INV1$0$PAs@0 (|lambda#5| 1 0))) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV1$0$PAs@0))) (= id@@0 id@@0)) (= leader leader)))))
(let ((inline$INV1$0$anon0_correct  (=> (exists ((k Int) ) (!  (and (and (and (and (and (and (and (or (and (<= 1 k) (<= k n)) (= k 0)) (trigger (+ k 1))) (forall ((i@@6 Int) ) (!  (=> (and (<= 1 i@@6) (<= i@@6 k)) (= (select channel@0 (ite (< i@@6 n) (+ i@@6 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@6) 1)))
 :qid |ChangRob.176:13|
 :skolemid |14|
))) (forall ((i@@7 Int) ) (!  (=> (and (< k i@@7) (<= i@@7 n)) (= (select channel@0 (ite (< i@@7 n) (+ i@@7 1) 1)) (|lambda#0| 0)))
 :qid |ChangRob.177:13|
 :skolemid |15|
))) (forall ((i@@8 Int) ) (!  (=> (or (< i@@8 1) (> i@@8 n)) (= (select channel@0 i@@8) (|lambda#0| 0)))
 :qid |ChangRob.178:13|
 :skolemid |16|
))) (= inline$INV1$0$PAs@0 (|lambda#6| k n 1 1 k 1 0))) (= inline$INV1$0$choice@0 (PInit_PA (+ k 1)))) (=> (< k n) (> (select inline$INV1$0$PAs@0 (PInit_PA n)) 0)))
 :qid |ChangRob.175:11|
 :skolemid |17|
 :pattern ( (trigger k))
)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV1$0$PAs@0)) (= (ControlFlow 0 93568) 93599)) inline$INV1$0$Return_correct))))
(let ((init_correct  (and (=> (= (ControlFlow 0 93576) (- 0 122008)) (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@9 Int) (j Int) ) (!  (=> (= (select id@@0 i@@9) (select id@@0 j)) (= i@@9 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@10 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@10) (select id@@0 j@@0)) (= i@@10 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (=> (= (ControlFlow 0 93576) 93568) inline$INV1$0$anon0_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@11 Int) (j@@1 Int) ) (!  (=> (= (select id@@0 i@@11) (select id@@0 j@@1)) (= i@@11 j@@1))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1)) (= (ControlFlow 0 121803) 93576))) init_correct)))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun PAs@1 () (Array T@PA Int))
(declare-fun PAs@0 () (Array T@PA Int))
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun leader () (Array Int Bool))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun inline$PInit$0$pid@0 () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun inline$INV1$0$choice@0 () T@PA)
(declare-fun inline$INV1$0$PAs@0 () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id IS_step_MAIN1)
(assert (not
 (=> (= (ControlFlow 0 0) 122410) (let ((inline$PInit$0$Return_correct  (=> (and (= PAs@1 ((_ map (+ (Int Int) Int)) PAs@0 inline$PInit$0$PAs@1)) (= (ControlFlow 0 94435) (- 0 123088))) (and (and (and (exists ((k Int) ) (!  (and (and (and (and (and (and (and (or (and (<= 1 k) (<= k n)) (= k 0)) (trigger (+ k 1))) (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 k)) (= (select channel@1 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.176:13|
 :skolemid |14|
))) (forall ((i@@4 Int) ) (!  (=> (and (< k i@@4) (<= i@@4 n)) (= (select channel@1 (ite (< i@@4 n) (+ i@@4 1) 1)) (|lambda#0| 0)))
 :qid |ChangRob.177:13|
 :skolemid |15|
))) (forall ((i@@5 Int) ) (!  (=> (or (< i@@5 1) (> i@@5 n)) (= (select channel@1 i@@5) (|lambda#0| 0)))
 :qid |ChangRob.178:13|
 :skolemid |16|
))) (= PAs@1 (|lambda#6| k n 1 1 k 1 0))) true) (=> (< k n) (> (select PAs@1 (PInit_PA n)) 0)))
 :qid |ChangRob.175:11|
 :skolemid |17|
 :pattern ( (trigger k))
)) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs PAs@1))) (= id@@0 id@@0)) (= leader leader)))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@1 (store channel@0 (ite (< inline$PInit$0$pid@0 n) (+ inline$PInit$0$pid@0 1) 1) (store (select channel@0 (ite (< inline$PInit$0$pid@0 n) (+ inline$PInit$0$pid@0 1) 1)) (select id@@0 inline$PInit$0$pid@0) (+ (select (select channel@0 (ite (< inline$PInit$0$pid@0 n) (+ inline$PInit$0$pid@0 1) 1)) (select id@@0 inline$PInit$0$pid@0)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA inline$PInit$0$pid@0) 1)) (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 inline$PInit$0$PAs@1))) (and (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) pendingAsyncs@1 (store (|lambda#1| 0) (PInit_PA inline$PInit$0$pid@0) 1))) (= (ControlFlow 0 94421) 94435))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (and (= inline$PInit$0$pid@0 (|pid#PInit_PA| inline$INV1$0$choice@0)) (= (ControlFlow 0 94373) 94421)) inline$PInit$0$anon0_correct)))
(let ((inline$INV1$0$Return_correct  (=> (exists ((pa@@5 T@PA) ) (!  (and (is-PInit_PA pa@@5) (> (select inline$INV1$0$PAs@0 pa@@5) 0))
 :qid |unknown.0:0|
 :skolemid |79|
)) (and (=> (= (ControlFlow 0 94427) (- 0 122924)) (and (is-PInit_PA inline$INV1$0$choice@0) (> (select inline$INV1$0$PAs@0 inline$INV1$0$choice@0) 0))) (=> (and (is-PInit_PA inline$INV1$0$choice@0) (> (select inline$INV1$0$PAs@0 inline$INV1$0$choice@0) 0)) (=> (and (= PAs@0 (store inline$INV1$0$PAs@0 inline$INV1$0$choice@0 (- (select inline$INV1$0$PAs@0 inline$INV1$0$choice@0) 1))) (is-PInit_PA inline$INV1$0$choice@0)) (and (=> (= (ControlFlow 0 94427) (- 0 122959)) (and (<= 1 (|pid#PInit_PA| inline$INV1$0$choice@0)) (<= (|pid#PInit_PA| inline$INV1$0$choice@0) n))) (=> (and (<= 1 (|pid#PInit_PA| inline$INV1$0$choice@0)) (<= (|pid#PInit_PA| inline$INV1$0$choice@0) n)) (and (=> (= (ControlFlow 0 94427) (- 0 122964)) (> (select pendingAsyncs@0 (PInit_PA (|pid#PInit_PA| inline$INV1$0$choice@0))) 0)) (=> (> (select pendingAsyncs@0 (PInit_PA (|pid#PInit_PA| inline$INV1$0$choice@0))) 0) (=> (= (ControlFlow 0 94427) 94373) inline$PInit$0$Entry_correct)))))))))))
(let ((inline$INV1$0$anon0_correct  (=> (exists ((k@@0 Int) ) (!  (and (and (and (and (and (and (and (or (and (<= 1 k@@0) (<= k@@0 n)) (= k@@0 0)) (trigger (+ k@@0 1))) (forall ((i@@6 Int) ) (!  (=> (and (<= 1 i@@6) (<= i@@6 k@@0)) (= (select channel@0 (ite (< i@@6 n) (+ i@@6 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@6) 1)))
 :qid |ChangRob.176:13|
 :skolemid |14|
))) (forall ((i@@7 Int) ) (!  (=> (and (< k@@0 i@@7) (<= i@@7 n)) (= (select channel@0 (ite (< i@@7 n) (+ i@@7 1) 1)) (|lambda#0| 0)))
 :qid |ChangRob.177:13|
 :skolemid |15|
))) (forall ((i@@8 Int) ) (!  (=> (or (< i@@8 1) (> i@@8 n)) (= (select channel@0 i@@8) (|lambda#0| 0)))
 :qid |ChangRob.178:13|
 :skolemid |16|
))) (= inline$INV1$0$PAs@0 (|lambda#6| k@@0 n 1 1 k@@0 1 0))) (= inline$INV1$0$choice@0 (PInit_PA (+ k@@0 1)))) (=> (< k@@0 n) (> (select inline$INV1$0$PAs@0 (PInit_PA n)) 0)))
 :qid |ChangRob.175:11|
 :skolemid |17|
 :pattern ( (trigger k@@0))
)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV1$0$PAs@0)) (= (ControlFlow 0 94203) 94427)) inline$INV1$0$Return_correct))))
(let ((inline$INV1$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@9 Int) (j Int) ) (!  (=> (= (select id@@0 i@@9) (select id@@0 j)) (= i@@9 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 122410) 94203)) inline$INV1$0$anon0_correct)))
inline$INV1$0$Entry_correct)))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pid () Int)
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(declare-fun Trigger_P_msg (Int) Bool)
(push 1)
(set-info :boogie-vc-id |AbstractionCheck_P_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 123296) (let ((inline$P$0$Return_correct  (=> (= (ControlFlow 0 94960) (- 0 124302)) (or (or (or (and (and (and (and (= inline$P$0$PAs@4 (|lambda#1| 0)) (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel@3 channel)) (= leader@1 leader)) (= id@@0 id@@0)) (exists ((|msg#0| Int) ) (!  (and (and (and (and (and (and (> (select (select channel pid) |msg#0|) 0) (= |msg#0| (select id@@0 pid))) (= channel@3 (store channel pid (store (select channel pid) |msg#0| (- (select (select channel pid) |msg#0|) 1))))) (= leader@1 (store leader pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |80|
))) (exists ((|msg#0@@0| Int) ) (!  (and (and (and (and (and (and (and (> (select (select channel pid) |msg#0@@0|) 0) (not (= |msg#0@@0| (select id@@0 pid)))) (> |msg#0@@0| (select id@@0 pid))) (= channel@3 (store (store channel pid (store (select channel pid) |msg#0@@0| (- (select (select channel pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store channel pid (store (select channel pid) |msg#0@@0| (- (select (select channel pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@0| (+ (select (select (store channel pid (store (select channel pid) |msg#0@@0| (- (select (select channel pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@0|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA pid) 1)))) (= leader@1 leader)) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |81|
))) (exists ((|msg#0@@1| Int) ) (!  (and (and (and (and (and (and (and (> (select (select channel pid) |msg#0@@1|) 0) (not (= |msg#0@@1| (select id@@0 pid)))) (>= (select id@@0 pid) |msg#0@@1|)) (= channel@3 (store channel pid (store (select channel pid) |msg#0@@1| (- (select (select channel pid) |msg#0@@1|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA pid) 1)))) (= leader@1 leader)) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |82|
))))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA pid) 1))) (= (ControlFlow 0 94904) 94960)) inline$P$0$Return_correct))))
(let ((inline$P$0$anon6_correct  (=> (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA pid) 1)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@3) (= channel@3 channel@2)) (and (= leader@1 leader) (= (ControlFlow 0 94886) 94904))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon10_Else_correct  (=> (>= (select id@@0 pid) inline$P$0$msg@0) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 94874) 94886)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon10_Then_correct  (=> (and (and (> inline$P$0$msg@0 (select id@@0 pid)) (= channel@1 (store channel@0 (ite (< pid n) (+ pid 1) 1) (store (select channel@0 (ite (< pid n) (+ pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< pid n) (+ pid 1) 1)) inline$P$0$msg@0) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 94932) 94886))) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 pid))) (and (=> (= (ControlFlow 0 94862) 94932) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 94862) 94874) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (= inline$P$0$msg@0 (select id@@0 pid)) (=> (and (= leader@0 (store leader pid true)) (= inline$P$0$PAs@2 (|lambda#1| 0))) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@2) (= channel@3 channel@0)) (and (= leader@1 leader@0) (= (ControlFlow 0 94948) 94904))) inline$P$0$anon7_correct)))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel pid) inline$P$0$msg@0) 0) (= channel@0 (store channel pid (store (select channel pid) inline$P$0$msg@0 (- (select (select channel pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 94850) 94948) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 94850) 94862) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (= inline$P$0$PAs@1 (|lambda#1| 0)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@1) (= channel@3 channel)) (and (= leader@1 leader) (= (ControlFlow 0 94952) 94904))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 94816) 94952) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 94816) 94850) inline$P$0$anon8_Else_correct)))))
(let ((init_correct  (and (=> (= (ControlFlow 0 94958) (- 0 123996)) (and (<= 1 pid) (<= pid n))) (=> (and (<= 1 pid) (<= pid n)) (and (=> (= (ControlFlow 0 94958) (- 0 124000)) (> (select pendingAsyncs (P_PA pid)) 0)) (=> (> (select pendingAsyncs (P_PA pid)) 0) (and (=> (= (ControlFlow 0 94958) (- 0 124012)) (forall ((m Int) ) (!  (=> (> (select (select channel pid) m) 0) (<= m (select id@@0 (q@max id@@0))))
 :qid |ChangRob.224:18|
 :skolemid |18|
))) (=> (forall ((m@@0 Int) ) (!  (=> (> (select (select channel pid) m@@0) 0) (<= m@@0 (select id@@0 (q@max id@@0))))
 :qid |ChangRob.224:18|
 :skolemid |18|
)) (=> (= (ControlFlow 0 94958) 94816) inline$P$0$anon0_correct)))))))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (<= 1 pid) (<= pid n)) (=> (and (and (> (select pendingAsyncs (P_PA pid)) 0) (forall ((m@@1 Int) ) (!  (=> (> (select (select channel pid) m@@1) 0) (<= m@@1 (select id@@0 (q@max id@@0))))
 :qid |ChangRob.113:18|
 :skolemid |9|
))) (and (forall ((j Int) ) (!  (=> (and (and (<= 1 j) (<= j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 j) (<= j n))) (and (<= 1 pid) (<= pid n))) (or (or (or (and (< (q@max id@@0) j) (< j pid)) (and (< pid (q@max id@@0)) (< (q@max id@@0) j))) (and (< j pid) (< pid (q@max id@@0)))) (and (= (q@max id@@0) pid) (not (= (q@max id@@0) j)))))) (= (select pendingAsyncs (P_PA j)) 0))
 :qid |ChangRob.115:18|
 :skolemid |10|
)) (= (ControlFlow 0 123296) 94958))) init_correct))))
PreconditionGeneratedEntry_correct)))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$MAIN2$0$PAs@1 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_MAIN2)
(assert (not
 (=> (= (ControlFlow 0 0) 124779) (let ((inline$MAIN2$0$Return_correct  (and (=> (= (ControlFlow 0 95350) (- 0 125007)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$MAIN2$0$PAs@1 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |83|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$MAIN2$0$PAs@1 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |83|
)) (=> (= (ControlFlow 0 95350) (- 0 125019)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$MAIN2$0$PAs@1 pa@@7) 0) (is-P_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |84|
)))))))
(let ((inline$MAIN2$0$anon0_correct  (=> (and (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 n)) (= (select channel@0 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.158:18|
 :skolemid |11|
)) (forall ((i@@4 Int) ) (!  (=> (or (< i@@4 1) (> i@@4 n)) (= (select channel@0 i@@4) (|lambda#0| 0)))
 :qid |ChangRob.159:18|
 :skolemid |12|
))) (=> (and (and (forall ((i@@5 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg) 0)) (= msg (select id@@0 (ite (> i@@5 1) (- i@@5 1) n))))
 :qid |ChangRob.160:18|
 :skolemid |13|
)) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN2$0$PAs@1)) (= (ControlFlow 0 95342) 95350))) inline$MAIN2$0$Return_correct))))
(let ((inline$MAIN2$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j)) (= i@@6 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1)) (= (ControlFlow 0 124779) 95342))) inline$MAIN2$0$anon0_correct)))
inline$MAIN2$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$MAIN1$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(declare-fun id@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_MAIN1)
(assert (not
 (=> (= (ControlFlow 0 0) 125042) (let ((inline$MAIN1$0$Return_correct  (and (=> (= (ControlFlow 0 95490) (- 0 125150)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$MAIN1$0$PAs@1 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |85|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$MAIN1$0$PAs@1 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |85|
)) (=> (= (ControlFlow 0 95490) (- 0 125162)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$MAIN1$0$PAs@1 pa@@7) 0) (is-PInit_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |86|
)))))))
(let ((inline$MAIN1$0$anon0_correct  (=> (= inline$MAIN1$0$PAs@1 (|lambda#7| 1 0)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN1$0$PAs@1)) (= (ControlFlow 0 95482) 95490)) inline$MAIN1$0$Return_correct))))
(let ((inline$MAIN1$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@@0 i@@3) (select id@@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (trigger 0) (= (ControlFlow 0 125042) 95482))) inline$MAIN1$0$anon0_correct)))
inline$MAIN1$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun pid () Int)
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 125185) (let ((inline$PInit$0$Return_correct  (and (=> (= (ControlFlow 0 95669) (- 0 125369)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$PInit$0$PAs@1 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |87|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$PInit$0$PAs@1 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |87|
)) (=> (= (ControlFlow 0 95669) (- 0 125381)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$PInit$0$PAs@1 pa@@7) 0) (is-P_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |88|
)))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< pid n) (+ pid 1) 1) (store (select channel (ite (< pid n) (+ pid 1) 1)) (select id@@0 pid) (+ (select (select channel (ite (< pid n) (+ pid 1) 1)) (select id@@0 pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA pid) 1))) (= (ControlFlow 0 95661) 95669))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (and (and (<= 1 pid) (<= pid n)) (and (> (select pendingAsyncs (PInit_PA pid)) 0) (= (ControlFlow 0 125185) 95661))) inline$PInit$0$anon0_correct)))
inline$PInit$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pid () Int)
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(declare-fun Trigger_P_msg (Int) Bool)
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_P)
(assert (not
 (=> (= (ControlFlow 0 0) 125404) (let ((inline$P$0$Return_correct  (and (=> (= (ControlFlow 0 96056) (- 0 125784)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$P$0$PAs@4 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |89|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$P$0$PAs@4 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |89|
)) (=> (= (ControlFlow 0 96056) (- 0 125796)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$P$0$PAs@4 pa@@7) 0) (is-P_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |90|
)))))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA pid) 1))) (= (ControlFlow 0 96000) 96056)) inline$P$0$Return_correct))))
(let ((inline$P$0$anon6_correct  (=> (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA pid) 1)) (=> (and (= inline$P$0$PAs@4 inline$P$0$PAs@3) (= (ControlFlow 0 95982) 96000)) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon10_Else_correct  (=> (and (>= (select id@@0 pid) inline$P$0$msg@0) (= (ControlFlow 0 95970) 95982)) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon10_Then_correct  (=> (> inline$P$0$msg@0 (select id@@0 pid)) (=> (and (= channel@1 (store channel@0 (ite (< pid n) (+ pid 1) 1) (store (select channel@0 (ite (< pid n) (+ pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< pid n) (+ pid 1) 1)) inline$P$0$msg@0) 1)))) (= (ControlFlow 0 96028) 95982)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 pid))) (and (=> (= (ControlFlow 0 95958) 96028) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 95958) 95970) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (= inline$P$0$msg@0 (select id@@0 pid)) (=> (and (and (= leader@0 (store leader pid true)) (= inline$P$0$PAs@2 (|lambda#1| 0))) (and (= inline$P$0$PAs@4 inline$P$0$PAs@2) (= (ControlFlow 0 96044) 96000))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel pid) inline$P$0$msg@0) 0) (= channel@0 (store channel pid (store (select channel pid) inline$P$0$msg@0 (- (select (select channel pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 95946) 96044) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 95946) 95958) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (= inline$P$0$PAs@1 (|lambda#1| 0)) (=> (and (= inline$P$0$PAs@4 inline$P$0$PAs@1) (= (ControlFlow 0 96048) 96000)) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 95912) 96048) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 95912) 95946) inline$P$0$anon8_Else_correct)))))
(let ((inline$P$0$Entry_correct  (=> (and (and (and (<= 1 pid) (<= pid n)) (> (select pendingAsyncs (P_PA pid)) 0)) (and (forall ((m Int) ) (!  (=> (> (select (select channel pid) m) 0) (<= m (select id@@0 (q@max id@@0))))
 :qid |ChangRob.224:18|
 :skolemid |18|
)) (= (ControlFlow 0 125404) 95912))) inline$P$0$anon0_correct)))
inline$P$0$Entry_correct))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$INV2$0$PAs@0 () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$INV2$0$choice@0 () T@PA)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_INV2)
(assert (not
 (=> (= (ControlFlow 0 0) 125820) (let ((inline$INV2$0$Return_correct  (and (=> (= (ControlFlow 0 96596) (- 0 126098)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$INV2$0$PAs@0 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |91|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$INV2$0$PAs@0 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |91|
)) (=> (= (ControlFlow 0 96596) (- 0 126110)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$INV2$0$PAs@0 pa@@7) 0) (is-P_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |92|
)))))))
(let ((inline$INV2$0$anon0_correct  (=> (exists ((k Int) ) (!  (and (and (and (and (and (and (trigger k) (trigger (ite (< k n) (+ k 1) 1))) (trigger (+ n 1))) (<= 1 k)) (<= k (+ n 1))) (= inline$INV2$0$PAs@0 (|lambda#4|  (and (<= 1 k) (<= k n)) (q@max id@@0) k 1 0))) (= inline$INV2$0$choice@0 (P_PA k)))
 :qid |ChangRob.92:11|
 :skolemid |5|
 :pattern ( (trigger k))
)) (=> (and (and (forall ((i@@3 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@3) (<= i@@3 n)) (> (select (select channel@0 i@@3) msg) 0)) (and (<= msg (select id@@0 (q@max id@@0))) (forall ((j Int) ) (!  (=> (and (and (and (and (<= 1 i@@3) (<= i@@3 n)) (and (<= 1 j) (<= j n))) (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n))) (or (or (and (<= i@@3 j) (< j (q@max id@@0))) (and (< (q@max id@@0) i@@3) (<= i@@3 j))) (and (< j (q@max id@@0)) (< (q@max id@@0) i@@3)))) (not (= msg (select id@@0 j))))
 :qid |ChangRob.98:100|
 :skolemid |6|
))))
 :qid |ChangRob.98:18|
 :skolemid |7|
)) (forall ((i@@4 Int) ) (!  (=> (and (and (<= 1 i@@4) (<= i@@4 n)) (not (= i@@4 (q@max id@@0)))) (not (select leader@0 i@@4)))
 :qid |ChangRob.99:18|
 :skolemid |8|
))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV2$0$PAs@0)) (= (ControlFlow 0 96586) 96596))) inline$INV2$0$Return_correct))))
(let ((inline$INV2$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@5 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@5) (select id@@0 j@@0)) (= i@@5 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 125820) 96586)) inline$INV2$0$anon0_correct)))
inline$INV2$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$INV1$0$PAs@0 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$INV1$0$choice@0 () T@PA)
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id PendingAsyncChecker_INV1)
(assert (not
 (=> (= (ControlFlow 0 0) 126134) (let ((inline$INV1$0$Return_correct  (and (=> (= (ControlFlow 0 97199) (- 0 126430)) (forall ((pa@@5 T@PA) ) (! (>= (select inline$INV1$0$PAs@0 pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |93|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select inline$INV1$0$PAs@0 pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |93|
)) (=> (= (ControlFlow 0 97199) (- 0 126442)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select inline$INV1$0$PAs@0 pa@@7) 0) (or (is-PInit_PA pa@@7) (is-P_PA pa@@7)))
 :qid |unknown.0:0|
 :skolemid |94|
)))))))
(let ((inline$INV1$0$anon0_correct  (=> (exists ((k Int) ) (!  (and (and (and (and (and (and (and (or (and (<= 1 k) (<= k n)) (= k 0)) (trigger (+ k 1))) (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 k)) (= (select channel@0 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.176:13|
 :skolemid |14|
))) (forall ((i@@4 Int) ) (!  (=> (and (< k i@@4) (<= i@@4 n)) (= (select channel@0 (ite (< i@@4 n) (+ i@@4 1) 1)) (|lambda#0| 0)))
 :qid |ChangRob.177:13|
 :skolemid |15|
))) (forall ((i@@5 Int) ) (!  (=> (or (< i@@5 1) (> i@@5 n)) (= (select channel@0 i@@5) (|lambda#0| 0)))
 :qid |ChangRob.178:13|
 :skolemid |16|
))) (= inline$INV1$0$PAs@0 (|lambda#6| k n 1 1 k 1 0))) (= inline$INV1$0$choice@0 (PInit_PA (+ k 1)))) (=> (< k n) (> (select inline$INV1$0$PAs@0 (PInit_PA n)) 0)))
 :qid |ChangRob.175:11|
 :skolemid |17|
 :pattern ( (trigger k))
)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$INV1$0$PAs@0)) (= (ControlFlow 0 97189) 97199)) inline$INV1$0$Return_correct))))
(let ((inline$INV1$0$Entry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j)) (= i@@6 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 126134) 97189)) inline$INV1$0$anon0_correct)))
inline$INV1$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pid () Int)
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun |Trigger_P'_msg| (Int) Bool)
(push 1)
(set-info :boogie-vc-id |PendingAsyncChecker_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 126471) (let ((|inline$P'$0$Return_correct|  (and (=> (= (ControlFlow 0 97593) (- 0 126913)) (forall ((pa@@5 T@PA) ) (! (>= (select |inline$P'$0$PAs@4| pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |95|
))) (=> (forall ((pa@@6 T@PA) ) (! (>= (select |inline$P'$0$PAs@4| pa@@6) 0)
 :qid |unknown.0:0|
 :skolemid |95|
)) (=> (= (ControlFlow 0 97593) (- 0 126925)) (forall ((pa@@7 T@PA) ) (!  (=> (> (select |inline$P'$0$PAs@4| pa@@7) 0) (is-P_PA pa@@7))
 :qid |unknown.0:0|
 :skolemid |96|
)))))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA pid) 1))) (= (ControlFlow 0 97537) 97593)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA pid) 1)) (=> (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|) (= (ControlFlow 0 97519) 97537)) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (and (>= (select id@@0 pid) |inline$P'$0$msg@0|) (= (ControlFlow 0 97507) 97519)) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (> |inline$P'$0$msg@0| (select id@@0 pid)) (=> (and (= channel@1 (store channel@0 (ite (< pid n) (+ pid 1) 1) (store (select channel@0 (ite (< pid n) (+ pid 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@0 (ite (< pid n) (+ pid 1) 1)) |inline$P'$0$msg@0|) 1)))) (= (ControlFlow 0 97565) 97519)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 pid))) (and (=> (= (ControlFlow 0 97495) 97565) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 97495) 97507) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (= |inline$P'$0$msg@0| (select id@@0 pid)) (=> (and (and (= leader@0 (store leader pid true)) (= |inline$P'$0$PAs@2| (|lambda#1| 0))) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|) (= (ControlFlow 0 97581) 97537))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel pid) |inline$P'$0$msg@0|) 0) (= channel@0 (store channel pid (store (select channel pid) |inline$P'$0$msg@0| (- (select (select channel pid) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 97483) 97581) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 97483) 97495) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (=> (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|) (= (ControlFlow 0 97585) 97537)) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 97453) 97585) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 97453) 97483) |inline$P'$0$anon8_Else_correct|)))))
(let ((|inline$P'$0$Entry_correct|  (=> (and (<= 1 pid) (<= pid n)) (=> (and (and (> (select pendingAsyncs (P_PA pid)) 0) (forall ((m Int) ) (!  (=> (> (select (select channel pid) m) 0) (<= m (select id@@0 (q@max id@@0))))
 :qid |ChangRob.113:18|
 :skolemid |9|
))) (and (forall ((j Int) ) (!  (=> (and (and (<= 1 j) (<= j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 j) (<= j n))) (and (<= 1 pid) (<= pid n))) (or (or (or (and (< (q@max id@@0) j) (< j pid)) (and (< pid (q@max id@@0)) (< (q@max id@@0) j))) (and (< j pid) (< pid (q@max id@@0)))) (and (= (q@max id@@0) pid) (not (= (q@max id@@0) j)))))) (= (select pendingAsyncs (P_PA j)) 0))
 :qid |ChangRob.115:18|
 :skolemid |10|
)) (= (ControlFlow 0 126471) 97453))) |inline$P'$0$anon0_correct|))))
|inline$P'$0$Entry_correct|))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun inline$MAIN1$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun leader () (Array Int Bool))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun first_pids () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_MAIN1_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 126950) (let ((inline$PInit$0$Return_correct  (=> (= (ControlFlow 0 97896) (- 0 127379)) (=> true (and (and (and (and (and (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$MAIN1$0$PAs@1 (|lambda#7| 1 0))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$MAIN1$0$PAs@1))) (= id@@0 id@@0)) (= leader leader))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 inline$PInit$0$PAs@1))) (and (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) pendingAsyncs@1 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 97888) 97896))) inline$PInit$0$Return_correct))))
(let ((inline$MAIN1$0$anon0_correct  (=> (= inline$MAIN1$0$PAs@1 (|lambda#7| 1 0)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN1$0$PAs@1)) (= (ControlFlow 0 97743) 97888)) inline$PInit$0$anon0_correct))))
(let ((inline$MAIN1$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) first_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |20|
)) (=> (and (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@@0 i@@3) (select id@@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0)) (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 126950) 97743)))) inline$MAIN1$0$anon0_correct))))
inline$MAIN1$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun inline$MAIN1$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun second_pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(declare-fun id@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id GatePreservationChecker_PInit_MAIN1)
(assert (not
 (=> (= (ControlFlow 0 0) 127494) (let ((inline$MAIN1$0$Return_correct  (and (=> (= (ControlFlow 0 98064) (- 0 127712)) (=> true (and (<= 1 first_pid) (<= first_pid n)))) (=> (=> true (and (<= 1 first_pid) (<= first_pid n))) (=> (= (ControlFlow 0 98064) (- 0 127720)) (=> true (> (select pendingAsyncs@0 (PInit_PA first_pid)) 0)))))))
(let ((inline$MAIN1$0$anon0_correct  (=> (= inline$MAIN1$0$PAs@1 (|lambda#7| 1 0)) (=> (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN1$0$PAs@1)) (= (ControlFlow 0 98056) 98064)) inline$MAIN1$0$Return_correct))))
(let ((inline$MAIN1$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) second_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |21|
)) (=> (and (and (and (and (and (and (= second_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@@0 i@@3) (select id@@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0)) (and (and (<= 1 first_pid) (<= first_pid n)) (and (> (select pendingAsyncs (PInit_PA first_pid)) 0) (= (ControlFlow 0 127494) 98056)))) inline$MAIN1$0$anon0_correct))))
inline$MAIN1$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pids () (Array Int Bool))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun leader () (Array Int Bool))
(declare-fun id@@0 () (Array Int Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id FailurePreservationChecker_MAIN1_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 127742) (let ((inline$PInit$0$Return_correct  (=> (= (ControlFlow 0 98245) (- 0 128045)) (=> true (not (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel@0 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@1 (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@@0 i@@3) (select id@@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0)))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 98237) 98245))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) first_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |22|
)) (not (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@4 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@4) (select id@@0 j@@0)) (= i@@4 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0)))) (=> (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 127742) 98237))) inline$PInit$0$anon0_correct))))
inline$PInit$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun inline$PInit$1$PAs@1 () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun first_pid () Int)
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_PInit_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 128074) (let ((inline$PInit$1$Return_correct  (=> (= (ControlFlow 0 98584) (- 0 128693)) (=> true (and (and (and (and (= inline$PInit$1$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= channel@1 (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) (select id@@0 first_pid) (+ (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) (select id@@0 first_pid)) 1))))) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$1$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA first_pid) 1)))) (= id@@0 id@@0))))))
(let ((inline$PInit$1$anon0_correct  (=> (= channel@1 (store channel@0 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$1$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs@1 inline$PInit$1$PAs@1))) (and (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) pendingAsyncs@2 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 98576) 98584))) inline$PInit$1$Return_correct))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< first_pid n) (+ first_pid 1) 1) (store (select channel (ite (< first_pid n) (+ first_pid 1) 1)) (select id@@0 first_pid) (+ (select (select channel (ite (< first_pid n) (+ first_pid 1) 1)) (select id@@0 first_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA first_pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA first_pid) 1))) (= (ControlFlow 0 98431) 98576))) inline$PInit$1$anon0_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |23|
)) (=> (and (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs (PInit_PA first_pid)) 0)) (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 128074) 98431)))) inline$PInit$0$anon0_correct))))
inline$PInit$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id GatePreservationChecker_PInit_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 128933) (let ((inline$PInit$0$Return_correct  (and (=> (= (ControlFlow 0 98819) (- 0 129227)) (=> true (and (<= 1 first_pid) (<= first_pid n)))) (=> (=> true (and (<= 1 first_pid) (<= first_pid n))) (=> (= (ControlFlow 0 98819) (- 0 129235)) (=> true (> (select pendingAsyncs@1 (PInit_PA first_pid)) 0)))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 98811) 98819))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |24|
)) (=> (and (and (and (<= 1 second_pid) (<= second_pid n)) (> (select pendingAsyncs (PInit_PA second_pid)) 0)) (and (and (<= 1 first_pid) (<= first_pid n)) (and (> (select pendingAsyncs (PInit_PA first_pid)) 0) (= (ControlFlow 0 128933) 98811)))) inline$PInit$0$anon0_correct))))
inline$PInit$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id FailurePreservationChecker_PInit_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 129257) (let ((inline$PInit$0$Return_correct  (=> (= (ControlFlow 0 99012) (- 0 129558)) (=> true (not (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs@1 (PInit_PA first_pid)) 0)))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 99004) 99012))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |25|
)) (not (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs (PInit_PA first_pid)) 0)))) (=> (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 129257) 99004))) inline$PInit$0$anon0_correct))))
inline$PInit$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun first_pid () Int)
(declare-fun leader@1 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun Trigger_P_msg (Int) Bool)
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_P_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 129588) (let ((inline$PInit$0$Return_correct  (=> (= (ControlFlow 0 99546) (- 0 131589)) (=> true (or (or (or (and (and (and (and (and (= channel@4 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@1 leader)) (exists ((|first_msg#0| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |first_msg#0|) (> (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0|) 0)) (= |first_msg#0| (select id@@0 first_pid))) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@4 (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0| (- (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0|) 1))))) (= leader@1 (store leader first_pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |27|
 :pattern ( (Trigger_P_msg |first_msg#0|))
))) (exists ((|first_msg#0@@0| Int) ) (!  (and (and (and (and (and (and (and (and (and (trigger |first_msg#0@@0|) (> (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0|) 0)) (not (= |first_msg#0@@0| (select id@@0 first_pid)))) (> |first_msg#0@@0| (select id@@0 first_pid))) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@4 (store (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0| (- (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0| (- (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@0| (+ (select (select (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0| (- (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@0|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@1 leader))
 :qid |unknown.0:0|
 :skolemid |28|
 :pattern ( (Trigger_P_msg |first_msg#0@@0|))
))) (exists ((|first_msg#0@@1| Int) ) (!  (and (and (and (and (and (and (and (and (and (trigger |first_msg#0@@1|) (> (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@1|) 0)) (not (= |first_msg#0@@1| (select id@@0 first_pid)))) (>= (select id@@0 first_pid) |first_msg#0@@1|)) (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@4 (store (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid (store (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@1| (- (select (select (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1))) first_pid) |first_msg#0@@1|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1) (store (|lambda#1| 0) (PInit_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@1 leader))
 :qid |unknown.0:0|
 :skolemid |29|
 :pattern ( (Trigger_P_msg |first_msg#0@@1|))
)))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@4 (store channel@3 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@3 (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel@3 (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs@1 inline$PInit$0$PAs@1))) (and (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) pendingAsyncs@2 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 99538) 99546))) inline$PInit$0$Return_correct))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= (ControlFlow 0 99345) 99538)) inline$PInit$0$anon0_correct))))
(let ((inline$P$0$anon6_correct  (=> (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA first_pid) 1)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@3) (= channel@3 channel@2)) (and (= leader@1 leader) (= (ControlFlow 0 99327) 99345))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon10_Else_correct  (=> (>= (select id@@0 first_pid) inline$P$0$msg@0) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 99315) 99327)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon10_Then_correct  (=> (and (and (> inline$P$0$msg@0 (select id@@0 first_pid)) (= channel@1 (store channel@0 (ite (< first_pid n) (+ first_pid 1) 1) (store (select channel@0 (ite (< first_pid n) (+ first_pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< first_pid n) (+ first_pid 1) 1)) inline$P$0$msg@0) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 99373) 99327))) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 first_pid))) (and (=> (= (ControlFlow 0 99303) 99373) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 99303) 99315) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (= inline$P$0$msg@0 (select id@@0 first_pid)) (=> (and (= leader@0 (store leader first_pid true)) (= inline$P$0$PAs@2 (|lambda#1| 0))) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@2) (= channel@3 channel@0)) (and (= leader@1 leader@0) (= (ControlFlow 0 99389) 99345))) inline$P$0$anon7_correct)))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel first_pid) inline$P$0$msg@0) 0) (= channel@0 (store channel first_pid (store (select channel first_pid) inline$P$0$msg@0 (- (select (select channel first_pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 99291) 99389) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 99291) 99303) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (= inline$P$0$PAs@1 (|lambda#1| 0)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@1) (= channel@3 channel)) (and (= leader@1 leader) (= (ControlFlow 0 99393) 99345))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 99257) 99393) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 99257) 99291) inline$P$0$anon8_Else_correct)))))
(let ((inline$P$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |26|
)) (=> (and (and (and (<= 1 first_pid) (<= first_pid n)) (and (> (select pendingAsyncs (P_PA first_pid)) 0) (forall ((first_m Int) ) (!  (=> (> (select (select channel first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
)))) (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 129588) 99257)))) inline$P$0$anon0_correct))))
inline$P$0$Entry_correct)))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(declare-fun Trigger_P_msg (Int) Bool)
(push 1)
(set-info :boogie-vc-id GatePreservationChecker_PInit_P)
(assert (not
 (=> (= (ControlFlow 0 0) 132965) (let ((inline$P$0$Return_correct  (and (=> (= (ControlFlow 0 99999) (- 0 133455)) (=> true (and (<= 1 first_pid) (<= first_pid n)))) (=> (=> true (and (<= 1 first_pid) (<= first_pid n))) (=> (= (ControlFlow 0 99999) (- 0 133463)) (=> true (> (select pendingAsyncs@1 (PInit_PA first_pid)) 0)))))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 99943) 99999)) inline$P$0$Return_correct))))
(let ((inline$P$0$anon6_correct  (=> (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA second_pid) 1)) (=> (and (= inline$P$0$PAs@4 inline$P$0$PAs@3) (= (ControlFlow 0 99925) 99943)) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon10_Else_correct  (=> (and (>= (select id@@0 second_pid) inline$P$0$msg@0) (= (ControlFlow 0 99913) 99925)) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon10_Then_correct  (=> (> inline$P$0$msg@0 (select id@@0 second_pid)) (=> (and (= channel@1 (store channel@0 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) inline$P$0$msg@0) 1)))) (= (ControlFlow 0 99971) 99925)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 99901) 99971) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 99901) 99913) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (= inline$P$0$msg@0 (select id@@0 second_pid)) (=> (and (and (= leader@0 (store leader second_pid true)) (= inline$P$0$PAs@2 (|lambda#1| 0))) (and (= inline$P$0$PAs@4 inline$P$0$PAs@2) (= (ControlFlow 0 99987) 99943))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel second_pid) inline$P$0$msg@0) 0) (= channel@0 (store channel second_pid (store (select channel second_pid) inline$P$0$msg@0 (- (select (select channel second_pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 99889) 99987) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 99889) 99901) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (= inline$P$0$PAs@1 (|lambda#1| 0)) (=> (and (= inline$P$0$PAs@4 inline$P$0$PAs@1) (= (ControlFlow 0 99991) 99943)) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 99855) 99991) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 99855) 99889) inline$P$0$anon8_Else_correct)))))
(let ((inline$P$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |30|
)) (=> (and (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
)))) (and (and (<= 1 first_pid) (<= first_pid n)) (and (> (select pendingAsyncs (PInit_PA first_pid)) 0) (= (ControlFlow 0 132965) 99855)))) inline$P$0$anon0_correct))))
inline$P$0$Entry_correct))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun inline$PInit$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id FailurePreservationChecker_P_PInit)
(assert (not
 (=> (= (ControlFlow 0 0) 133485) (let ((inline$PInit$0$Return_correct  (=> (= (ControlFlow 0 100214) (- 0 133883)) (=> true (not (and (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs@1 (P_PA first_pid)) 0)) (forall ((first_m Int) ) (!  (=> (> (select (select channel@0 first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))))))))
(let ((inline$PInit$0$anon0_correct  (=> (= channel@0 (store channel (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid) (+ (select (select channel (ite (< second_pid n) (+ second_pid 1) 1)) (select id@@0 second_pid)) 1)))) (=> (and (and (= inline$PInit$0$PAs@1 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$PInit$0$PAs@1))) (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (PInit_PA second_pid) 1))) (= (ControlFlow 0 100206) 100214))) inline$PInit$0$Return_correct))))
(let ((inline$PInit$0$Entry_correct  (=> (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |31|
)) (not (and (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs (P_PA first_pid)) 0)) (forall ((first_m@@0 Int) ) (!  (=> (> (select (select channel first_pid) first_m@@0) 0) (<= first_m@@0 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))))) (=> (and (and (<= 1 second_pid) (<= second_pid n)) (and (> (select pendingAsyncs (PInit_PA second_pid)) 0) (= (ControlFlow 0 133485) 100206))) inline$PInit$0$anon0_correct))))
inline$PInit$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun leader@1 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun second_pid () Int)
(declare-fun first_pid () Int)
(declare-fun leader@0 () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_SET_LEADER_SET_LEADER)
(assert (not
 (=> (= (ControlFlow 0 0) 133943) (let ((inline$SET_LEADER$1$Return_correct  (=> (= (ControlFlow 0 100332) (- 0 134106)) (=> true (= leader@1 (store (store leader second_pid true) first_pid true))))))
(let ((inline$SET_LEADER$1$anon0_correct  (=> (and (= leader@1 (store leader@0 second_pid true)) (= (ControlFlow 0 100326) 100332)) inline$SET_LEADER$1$Return_correct)))
(let ((inline$SET_LEADER$0$anon0_correct  (=> (and (= leader@0 (store leader first_pid true)) (= (ControlFlow 0 100291) 100326)) inline$SET_LEADER$1$anon0_correct)))
(let ((inline$SET_LEADER$0$Entry_correct  (=> (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |32|
)) (= (ControlFlow 0 133943) 100291)) inline$SET_LEADER$0$anon0_correct)))
inline$SET_LEADER$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun second_m () Int)
(declare-fun first_pid () Int)
(declare-fun first_m () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_SEND_SEND)
(assert (not
 (=> (= (ControlFlow 0 0) 134133) (let ((inline$SEND$1$Return_correct  (=> (= (ControlFlow 0 100476) (- 0 134354)) (=> true (= channel@1 (store (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid) first_m (+ (select (select (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid) first_m) 1))))))))
(let ((inline$SEND$1$anon0_correct  (=> (and (= channel@1 (store channel@0 second_pid (store (select channel@0 second_pid) second_m (+ (select (select channel@0 second_pid) second_m) 1)))) (= (ControlFlow 0 100470) 100476)) inline$SEND$1$Return_correct)))
(let ((inline$SEND$0$anon0_correct  (=> (and (= channel@0 (store channel first_pid (store (select channel first_pid) first_m (+ (select (select channel first_pid) first_m) 1)))) (= (ControlFlow 0 100405) 100470)) inline$SEND$1$anon0_correct)))
(let ((inline$SEND$0$Entry_correct  (=> (= (ControlFlow 0 134133) 100405) inline$SEND$0$anon0_correct)))
inline$SEND$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun second_m () Int)
(declare-fun first_pid () Int)
(declare-fun inline$RECEIVE$0$m@0 () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_RECEIVE_SEND)
(assert (not
 (=> (= (ControlFlow 0 0) 134473) (let ((inline$SEND$0$Return_correct  (=> (= (ControlFlow 0 100664) (- 0 134748)) (=> true (and (> (select (select (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid) inline$RECEIVE$0$m@0) 0) (= channel@1 (store (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid) inline$RECEIVE$0$m@0 (- (select (select (store channel second_pid (store (select channel second_pid) second_m (+ (select (select channel second_pid) second_m) 1))) first_pid) inline$RECEIVE$0$m@0) 1)))))))))
(let ((inline$SEND$0$anon0_correct  (=> (and (= channel@1 (store channel@0 second_pid (store (select channel@0 second_pid) second_m (+ (select (select channel@0 second_pid) second_m) 1)))) (= (ControlFlow 0 100658) 100664)) inline$SEND$0$Return_correct)))
(let ((inline$RECEIVE$0$anon0_correct  (=> (> (select (select channel first_pid) inline$RECEIVE$0$m@0) 0) (=> (and (= channel@0 (store channel first_pid (store (select channel first_pid) inline$RECEIVE$0$m@0 (- (select (select channel first_pid) inline$RECEIVE$0$m@0) 1)))) (= (ControlFlow 0 100591) 100658)) inline$SEND$0$anon0_correct))))
(let ((inline$RECEIVE$0$Entry_correct  (=> (= (ControlFlow 0 134473) 100591) inline$RECEIVE$0$anon0_correct)))
inline$RECEIVE$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun second_pid () Int)
(declare-fun inline$RECEIVE$1$m@0 () Int)
(declare-fun first_pid () Int)
(declare-fun inline$RECEIVE$0$m@0 () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(push 1)
(set-info :boogie-vc-id CommutativityChecker_RECEIVE_RECEIVE)
(assert (not
 (=> (= (ControlFlow 0 0) 134905) (let ((inline$RECEIVE$1$Return_correct  (=> (= (ControlFlow 0 100882) (- 0 135208)) (=> true (and (and (> (select (select channel second_pid) inline$RECEIVE$1$m@0) 0) (> (select (select (store channel second_pid (store (select channel second_pid) inline$RECEIVE$1$m@0 (- (select (select channel second_pid) inline$RECEIVE$1$m@0) 1))) first_pid) inline$RECEIVE$0$m@0) 0)) (= channel@1 (store (store channel second_pid (store (select channel second_pid) inline$RECEIVE$1$m@0 (- (select (select channel second_pid) inline$RECEIVE$1$m@0) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) inline$RECEIVE$1$m@0 (- (select (select channel second_pid) inline$RECEIVE$1$m@0) 1))) first_pid) inline$RECEIVE$0$m@0 (- (select (select (store channel second_pid (store (select channel second_pid) inline$RECEIVE$1$m@0 (- (select (select channel second_pid) inline$RECEIVE$1$m@0) 1))) first_pid) inline$RECEIVE$0$m@0) 1)))))))))
(let ((inline$RECEIVE$1$anon0_correct  (=> (> (select (select channel@0 second_pid) inline$RECEIVE$1$m@0) 0) (=> (and (= channel@1 (store channel@0 second_pid (store (select channel@0 second_pid) inline$RECEIVE$1$m@0 (- (select (select channel@0 second_pid) inline$RECEIVE$1$m@0) 1)))) (= (ControlFlow 0 100874) 100882)) inline$RECEIVE$1$Return_correct))))
(let ((inline$RECEIVE$0$anon0_correct  (=> (> (select (select channel first_pid) inline$RECEIVE$0$m@0) 0) (=> (and (= channel@0 (store channel first_pid (store (select channel first_pid) inline$RECEIVE$0$m@0 (- (select (select channel first_pid) inline$RECEIVE$0$m@0) 1)))) (= (ControlFlow 0 100781) 100874)) inline$RECEIVE$1$anon0_correct))))
(let ((inline$RECEIVE$0$Entry_correct  (=> (= (ControlFlow 0 134905) 100781) inline$RECEIVE$0$anon0_correct)))
inline$RECEIVE$0$Entry_correct)))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun inline$MAIN2$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun leader@1 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun |Trigger_P'_msg| (Int) Bool)
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun first_pids () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id |CommutativityChecker_MAIN2_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 135371) (let ((|inline$P'$0$Return_correct|  (=> (= (ControlFlow 0 101565) (- 0 136925)) (=> true (or (or (or (and (and (and (and (and (and (and (forall ((first_i Int) ) (!  (=> (and (<= 1 first_i) (<= first_i n)) (= (select channel@4 (ite (< first_i n) (+ first_i 1) 1)) (store (|lambda#0| 0) (select id@@0 first_i) 1)))
 :qid |unknown.0:0|
 :skolemid |11|
)) (forall ((first_i@@0 Int) ) (!  (=> (or (< first_i@@0 1) (> first_i@@0 n)) (= (select channel@4 first_i@@0) (|lambda#0| 0)))
 :qid |unknown.0:0|
 :skolemid |12|
))) (forall ((first_i@@1 Int) (first_msg Int) ) (!  (=> (and (and (<= 1 first_i@@1) (<= first_i@@1 n)) (> (select (select channel@4 first_i@@1) first_msg) 0)) (= first_msg (select id@@0 (ite (> first_i@@1 1) (- first_i@@1 1) n))))
 :qid |unknown.0:0|
 :skolemid |13|
))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$MAIN2$0$PAs@1))) (= id@@0 id@@0)) (= leader@1 leader)) (exists ((|second_msg#0| Int) ) (!  (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0|) 0) (= |second_msg#0| (select id@@0 second_pid))) (forall ((first_i@@2 Int) ) (!  (=> (and (<= 1 first_i@@2) (<= first_i@@2 n)) (= (select channel@4 (ite (< first_i@@2 n) (+ first_i@@2 1) 1)) (store (|lambda#0| 0) (select id@@0 first_i@@2) 1)))
 :qid |unknown.0:0|
 :skolemid |11|
))) (forall ((first_i@@3 Int) ) (!  (=> (or (< first_i@@3 1) (> first_i@@3 n)) (= (select channel@4 first_i@@3) (|lambda#0| 0)))
 :qid |unknown.0:0|
 :skolemid |12|
))) (forall ((first_i@@4 Int) (first_msg@@0 Int) ) (!  (=> (and (and (<= 1 first_i@@4) (<= first_i@@4 n)) (> (select (select channel@4 first_i@@4) first_msg@@0) 0)) (= first_msg@@0 (select id@@0 (ite (> first_i@@4 1) (- first_i@@4 1) n))))
 :qid |unknown.0:0|
 :skolemid |13|
))) (= leader@1 (store leader second_pid true))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$MAIN2$0$PAs@1))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |34|
 :pattern ( (|Trigger_P'_msg| |second_msg#0|))
))) (exists ((|second_msg#0@@0| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@0|) 0) (not (= |second_msg#0@@0| (select id@@0 second_pid)))) (> |second_msg#0@@0| (select id@@0 second_pid))) (forall ((first_i@@5 Int) ) (!  (=> (and (<= 1 first_i@@5) (<= first_i@@5 n)) (= (select channel@4 (ite (< first_i@@5 n) (+ first_i@@5 1) 1)) (store (|lambda#0| 0) (select id@@0 first_i@@5) 1)))
 :qid |unknown.0:0|
 :skolemid |11|
))) (forall ((first_i@@6 Int) ) (!  (=> (or (< first_i@@6 1) (> first_i@@6 n)) (= (select channel@4 first_i@@6) (|lambda#0| 0)))
 :qid |unknown.0:0|
 :skolemid |12|
))) (forall ((first_i@@7 Int) (first_msg@@1 Int) ) (!  (=> (and (and (<= 1 first_i@@7) (<= first_i@@7 n)) (> (select (select channel@4 first_i@@7) first_msg@@1) 0)) (= first_msg@@1 (select id@@0 (ite (> first_i@@7 1) (- first_i@@7 1) n))))
 :qid |unknown.0:0|
 :skolemid |13|
))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$MAIN2$0$PAs@1))) (= id@@0 id@@0)) (= leader@1 leader))
 :qid |unknown.0:0|
 :skolemid |35|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@0|))
))) (exists ((|second_msg#0@@1| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@1|) 0) (not (= |second_msg#0@@1| (select id@@0 second_pid)))) (>= (select id@@0 second_pid) |second_msg#0@@1|)) (forall ((first_i@@8 Int) ) (!  (=> (and (<= 1 first_i@@8) (<= first_i@@8 n)) (= (select channel@4 (ite (< first_i@@8 n) (+ first_i@@8 1) 1)) (store (|lambda#0| 0) (select id@@0 first_i@@8) 1)))
 :qid |unknown.0:0|
 :skolemid |11|
))) (forall ((first_i@@9 Int) ) (!  (=> (or (< first_i@@9 1) (> first_i@@9 n)) (= (select channel@4 first_i@@9) (|lambda#0| 0)))
 :qid |unknown.0:0|
 :skolemid |12|
))) (forall ((first_i@@10 Int) (first_msg@@2 Int) ) (!  (=> (and (and (<= 1 first_i@@10) (<= first_i@@10 n)) (> (select (select channel@4 first_i@@10) first_msg@@2) 0)) (= first_msg@@2 (select id@@0 (ite (> first_i@@10 1) (- first_i@@10 1) n))))
 :qid |unknown.0:0|
 :skolemid |13|
))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$MAIN2$0$PAs@1))) (= id@@0 id@@0)) (= leader@1 leader))
 :qid |unknown.0:0|
 :skolemid |36|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@1|))
)))))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) pendingAsyncs@1 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 101509) 101565)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA second_pid) 1)) (=> (and (and (= channel@4 channel@3) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|)) (and (= leader@1 leader) (= (ControlFlow 0 101491) 101509))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (>= (select id@@0 second_pid) |inline$P'$0$msg@0|) (=> (and (= channel@3 channel@1) (= (ControlFlow 0 101479) 101491)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (and (and (> |inline$P'$0$msg@0| (select id@@0 second_pid)) (= channel@2 (store channel@1 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@1 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@1 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0|) 1))))) (and (= channel@3 channel@2) (= (ControlFlow 0 101537) 101491))) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 101467) 101537) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 101467) 101479) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (= |inline$P'$0$msg@0| (select id@@0 second_pid)) (=> (and (= leader@0 (store leader second_pid true)) (= |inline$P'$0$PAs@2| (|lambda#1| 0))) (=> (and (and (= channel@4 channel@1) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|)) (and (= leader@1 leader@0) (= (ControlFlow 0 101553) 101509))) |inline$P'$0$anon7_correct|)))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel@0 second_pid) |inline$P'$0$msg@0|) 0) (= channel@1 (store channel@0 second_pid (store (select channel@0 second_pid) |inline$P'$0$msg@0| (- (select (select channel@0 second_pid) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 101455) 101553) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 101455) 101467) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (=> (and (and (= channel@4 channel@0) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|)) (and (= leader@1 leader) (= (ControlFlow 0 101557) 101509))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 101425) 101557) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 101425) 101455) |inline$P'$0$anon8_Else_correct|)))))
(let ((inline$MAIN2$0$anon0_correct  (=> (and (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 n)) (= (select channel@0 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.158:18|
 :skolemid |11|
)) (forall ((i@@4 Int) ) (!  (=> (or (< i@@4 1) (> i@@4 n)) (= (select channel@0 i@@4) (|lambda#0| 0)))
 :qid |ChangRob.159:18|
 :skolemid |12|
))) (=> (and (and (forall ((i@@5 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg) 0)) (= msg (select id@@0 (ite (> i@@5 1) (- i@@5 1) n))))
 :qid |ChangRob.160:18|
 :skolemid |13|
)) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN2$0$PAs@1)) (= (ControlFlow 0 101224) 101425))) |inline$P'$0$anon0_correct|))))
(let ((inline$MAIN2$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) first_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |33|
)) (=> (and (and (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j)) (= i@@6 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1))) (and (<= 1 second_pid) (<= second_pid n))) (and (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((second_j Int) ) (!  (=> (and (and (<= 1 second_j) (<= second_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 second_j) (<= second_j n))) (and (<= 1 second_pid) (<= second_pid n))) (or (or (or (and (< (q@max id@@0) second_j) (< second_j second_pid)) (and (< second_pid (q@max id@@0)) (< (q@max id@@0) second_j))) (and (< second_j second_pid) (< second_pid (q@max id@@0)))) (and (= (q@max id@@0) second_pid) (not (= (q@max id@@0) second_j)))))) (= (select pendingAsyncs (P_PA second_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 135371) 101224)))) inline$MAIN2$0$anon0_correct))))
inline$MAIN2$0$Entry_correct)))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun inline$MAIN2$0$PAs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun second_pids () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id |GatePreservationChecker_P'_MAIN2|)
(assert (not
 (=> (= (ControlFlow 0 0) 137729) (let ((inline$MAIN2$0$Return_correct  (and (=> (= (ControlFlow 0 101997) (- 0 138265)) (=> true (and (<= 1 first_pid) (<= first_pid n)))) (=> (=> true (and (<= 1 first_pid) (<= first_pid n))) (and (=> (= (ControlFlow 0 101997) (- 0 138273)) (=> true (> (select pendingAsyncs@0 (P_PA first_pid)) 0))) (=> (=> true (> (select pendingAsyncs@0 (P_PA first_pid)) 0)) (and (=> (= (ControlFlow 0 101997) (- 0 138288)) (=> true (forall ((first_m Int) ) (!  (=> (> (select (select channel@0 first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
)))) (=> (=> true (forall ((first_m@@0 Int) ) (!  (=> (> (select (select channel@0 first_pid) first_m@@0) 0) (<= first_m@@0 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (= (ControlFlow 0 101997) (- 0 138322)) (=> true (forall ((first_j Int) ) (!  (=> (and (and (<= 1 first_j) (<= first_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 first_j) (<= first_j n))) (and (<= 1 first_pid) (<= first_pid n))) (or (or (or (and (< (q@max id@@0) first_j) (< first_j first_pid)) (and (< first_pid (q@max id@@0)) (< (q@max id@@0) first_j))) (and (< first_j first_pid) (< first_pid (q@max id@@0)))) (and (= (q@max id@@0) first_pid) (not (= (q@max id@@0) first_j)))))) (= (select pendingAsyncs@0 (P_PA first_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
))))))))))))
(let ((inline$MAIN2$0$anon0_correct  (=> (and (forall ((i@@3 Int) ) (!  (=> (and (<= 1 i@@3) (<= i@@3 n)) (= (select channel@0 (ite (< i@@3 n) (+ i@@3 1) 1)) (store (|lambda#0| 0) (select id@@0 i@@3) 1)))
 :qid |ChangRob.158:18|
 :skolemid |11|
)) (forall ((i@@4 Int) ) (!  (=> (or (< i@@4 1) (> i@@4 n)) (= (select channel@0 i@@4) (|lambda#0| 0)))
 :qid |ChangRob.159:18|
 :skolemid |12|
))) (=> (and (and (forall ((i@@5 Int) (msg Int) ) (!  (=> (and (and (<= 1 i@@5) (<= i@@5 n)) (> (select (select channel@0 i@@5) msg) 0)) (= msg (select id@@0 (ite (> i@@5 1) (- i@@5 1) n))))
 :qid |ChangRob.160:18|
 :skolemid |13|
)) (= inline$MAIN2$0$PAs@1 (|lambda#5| 1 0))) (and (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$MAIN2$0$PAs@1)) (= (ControlFlow 0 101989) 101997))) inline$MAIN2$0$Return_correct))))
(let ((inline$MAIN2$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) second_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |37|
)) (=> (and (and (and (and (and (and (and (= second_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j)) (= i@@6 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1))) (and (<= 1 first_pid) (<= first_pid n))) (and (and (> (select pendingAsyncs (P_PA first_pid)) 0) (forall ((first_m@@1 Int) ) (!  (=> (> (select (select channel first_pid) first_m@@1) 0) (<= first_m@@1 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((first_j@@0 Int) ) (!  (=> (and (and (<= 1 first_j@@0) (<= first_j@@0 n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 first_j@@0) (<= first_j@@0 n))) (and (<= 1 first_pid) (<= first_pid n))) (or (or (or (and (< (q@max id@@0) first_j@@0) (< first_j@@0 first_pid)) (and (< first_pid (q@max id@@0)) (< (q@max id@@0) first_j@@0))) (and (< first_j@@0 first_pid) (< first_pid (q@max id@@0)))) (and (= (q@max id@@0) first_pid) (not (= (q@max id@@0) first_j@@0)))))) (= (select pendingAsyncs (P_PA first_j@@0)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 137729) 101989)))) inline$MAIN2$0$anon0_correct))))
inline$MAIN2$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pids () (Array Int Bool))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun leader () (Array Int Bool))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun |Trigger_P'_msg| (Int) Bool)
(push 1)
(set-info :boogie-vc-id |FailurePreservationChecker_MAIN2_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 138365) (let ((|inline$P'$0$Return_correct|  (=> (= (ControlFlow 0 102382) (- 0 138974)) (=> true (not (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel@3 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@1 (|lambda#1| 0))) (= leader@1 (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@@0 i@@3) (select id@@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1))))))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 102326) 102382)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA second_pid) 1)) (=> (and (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|) (= channel@3 channel@2)) (and (= leader@1 leader) (= (ControlFlow 0 102308) 102326))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (>= (select id@@0 second_pid) |inline$P'$0$msg@0|) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 102296) 102308)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (and (and (> |inline$P'$0$msg@0| (select id@@0 second_pid)) (= channel@1 (store channel@0 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0|) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 102354) 102308))) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 102284) 102354) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 102284) 102296) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (= |inline$P'$0$msg@0| (select id@@0 second_pid)) (=> (and (= leader@0 (store leader second_pid true)) (= |inline$P'$0$PAs@2| (|lambda#1| 0))) (=> (and (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|) (= channel@3 channel@0)) (and (= leader@1 leader@0) (= (ControlFlow 0 102370) 102326))) |inline$P'$0$anon7_correct|)))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel second_pid) |inline$P'$0$msg@0|) 0) (= channel@0 (store channel second_pid (store (select channel second_pid) |inline$P'$0$msg@0| (- (select (select channel second_pid) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 102272) 102370) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 102272) 102284) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (=> (and (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|) (= channel@3 channel)) (and (= leader@1 leader) (= (ControlFlow 0 102374) 102326))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 102242) 102374) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 102242) 102272) |inline$P'$0$anon8_Else_correct|)))))
(let ((|inline$P'$0$Entry_correct|  (=> (and (and (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) first_pids ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |38|
)) (not (and (and (and (and (and (= first_pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@4 Int) (j@@0 Int) ) (!  (=> (= (select id@@0 i@@4) (select id@@0 j@@0)) (= i@@4 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger (ite (< (q@max id@@0) n) (+ (q@max id@@0) 1) 1))))) (and (<= 1 second_pid) (<= second_pid n))) (and (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((second_j Int) ) (!  (=> (and (and (<= 1 second_j) (<= second_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 second_j) (<= second_j n))) (and (<= 1 second_pid) (<= second_pid n))) (or (or (or (and (< (q@max id@@0) second_j) (< second_j second_pid)) (and (< second_pid (q@max id@@0)) (< (q@max id@@0) second_j))) (and (< second_j second_pid) (< second_pid (q@max id@@0)))) (and (= (q@max id@@0) second_pid) (not (= (q@max id@@0) second_j)))))) (= (select pendingAsyncs (P_PA second_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 138365) 102242)))) |inline$P'$0$anon0_correct|)))
|inline$P'$0$Entry_correct|))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun first_pid () Int)
(declare-fun channel@7 () (Array Int (Array Int Int)))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun leader@3 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun Trigger_P_msg (Int) Bool)
(declare-fun |Trigger_P'_msg| (Int) Bool)
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun channel@6 () (Array Int (Array Int Int)))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun channel@5 () (Array Int (Array Int Int)))
(declare-fun leader@2 () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id |CommutativityChecker_P_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 139006) (let ((|inline$P'$0$Return_correct|  (=> (= (ControlFlow 0 103127) (- 0 146102)) (=> true (or (or (or (or (or (or (or (or (or (or (or (or (or (or (or (and (and (and (and (and (= |inline$P'$0$PAs@4| (|lambda#1| 0)) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= channel@7 channel)) (= id@@0 id@@0)) (= leader@3 leader)) (exists ((|first_msg#0| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |first_msg#0|) (> (select (select channel first_pid) |first_msg#0|) 0)) (= |first_msg#0| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store channel first_pid (store (select channel first_pid) |first_msg#0| (- (select (select channel first_pid) |first_msg#0|) 1))))) (= leader@3 (store leader first_pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |40|
 :pattern ( (Trigger_P_msg |first_msg#0|))
))) (exists ((|first_msg#0@@0| Int) ) (!  (and (and (and (and (and (and (and (and (and (trigger |first_msg#0@@0|) (> (select (select channel first_pid) |first_msg#0@@0|) 0)) (not (= |first_msg#0@@0| (select id@@0 first_pid)))) (> |first_msg#0@@0| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store (store channel first_pid (store (select channel first_pid) |first_msg#0@@0| (- (select (select channel first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store channel first_pid (store (select channel first_pid) |first_msg#0@@0| (- (select (select channel first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@0| (+ (select (select (store channel first_pid (store (select channel first_pid) |first_msg#0@@0| (- (select (select channel first_pid) |first_msg#0@@0|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@0|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |41|
 :pattern ( (Trigger_P_msg |first_msg#0@@0|))
))) (exists ((|first_msg#0@@1| Int) ) (!  (and (and (and (and (and (and (and (and (and (trigger |first_msg#0@@1|) (> (select (select channel first_pid) |first_msg#0@@1|) 0)) (not (= |first_msg#0@@1| (select id@@0 first_pid)))) (>= (select id@@0 first_pid) |first_msg#0@@1|)) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store channel first_pid (store (select channel first_pid) |first_msg#0@@1| (- (select (select channel first_pid) |first_msg#0@@1|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |42|
 :pattern ( (Trigger_P_msg |first_msg#0@@1|))
))) (exists ((|second_msg#0| Int) ) (!  (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0|) 0) (= |second_msg#0| (select id@@0 second_pid))) (= channel@7 (store channel second_pid (store (select channel second_pid) |second_msg#0| (- (select (select channel second_pid) |second_msg#0|) 1))))) (= leader@3 (store leader second_pid true))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |43|
 :pattern ( (|Trigger_P'_msg| |second_msg#0|))
))) (exists ((|second_msg#0@@0| Int) (|first_msg#0@@2| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@0|) 0) (= |second_msg#0@@0| (select id@@0 second_pid))) (trigger |first_msg#0@@2|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@0| (- (select (select channel second_pid) |second_msg#0@@0|) 1))) first_pid) |first_msg#0@@2|) 0)) (= |first_msg#0@@2| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@0| (- (select (select channel second_pid) |second_msg#0@@0|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@0| (- (select (select channel second_pid) |second_msg#0@@0|) 1))) first_pid) |first_msg#0@@2| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@0| (- (select (select channel second_pid) |second_msg#0@@0|) 1))) first_pid) |first_msg#0@@2|) 1))))) (= leader@3 (store (store leader second_pid true) first_pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |44|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@0|) (Trigger_P_msg |first_msg#0@@2|))
))) (exists ((|second_msg#0@@1| Int) (|first_msg#0@@3| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@1|) 0) (= |second_msg#0@@1| (select id@@0 second_pid))) (trigger |first_msg#0@@3|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3|) 0)) (not (= |first_msg#0@@3| (select id@@0 first_pid)))) (> |first_msg#0@@3| (select id@@0 first_pid))) (= leader@3 (store leader second_pid true))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3|) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@3| (+ (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@1| (- (select (select channel second_pid) |second_msg#0@@1|) 1))) first_pid) |first_msg#0@@3|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@3|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |45|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@1|) (Trigger_P_msg |first_msg#0@@3|))
))) (exists ((|second_msg#0@@2| Int) (|first_msg#0@@4| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@2|) 0) (= |second_msg#0@@2| (select id@@0 second_pid))) (trigger |first_msg#0@@4|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@2| (- (select (select channel second_pid) |second_msg#0@@2|) 1))) first_pid) |first_msg#0@@4|) 0)) (not (= |first_msg#0@@4| (select id@@0 first_pid)))) (>= (select id@@0 first_pid) |first_msg#0@@4|)) (= leader@3 (store leader second_pid true))) (= |inline$P'$0$PAs@4| (|lambda#1| 0))) (= channel@7 (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@2| (- (select (select channel second_pid) |second_msg#0@@2|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@2| (- (select (select channel second_pid) |second_msg#0@@2|) 1))) first_pid) |first_msg#0@@4| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@2| (- (select (select channel second_pid) |second_msg#0@@2|) 1))) first_pid) |first_msg#0@@4|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |46|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@2|) (Trigger_P_msg |first_msg#0@@4|))
))) (exists ((|second_msg#0@@3| Int) ) (!  (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@3|) 0) (not (= |second_msg#0@@3| (select id@@0 second_pid)))) (> |second_msg#0@@3| (select id@@0 second_pid))) (= channel@7 (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@3| (- (select (select channel second_pid) |second_msg#0@@3|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@3| (- (select (select channel second_pid) |second_msg#0@@3|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@3| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@3| (- (select (select channel second_pid) |second_msg#0@@3|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@3|) 1))))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |47|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@3|))
))) (exists ((|second_msg#0@@4| Int) (|first_msg#0@@5| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@4|) 0) (not (= |second_msg#0@@4| (select id@@0 second_pid)))) (> |second_msg#0@@4| (select id@@0 second_pid))) (trigger |first_msg#0@@5|)) (> (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4|) 1))) first_pid) |first_msg#0@@5|) 0)) (= |first_msg#0@@5| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4|) 1))) first_pid (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4|) 1))) first_pid) |first_msg#0@@5| (- (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@4| (- (select (select channel second_pid) |second_msg#0@@4|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@4|) 1))) first_pid) |first_msg#0@@5|) 1))))) (= leader@3 (store leader first_pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |48|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@4|) (Trigger_P_msg |first_msg#0@@5|))
))) (exists ((|second_msg#0@@5| Int) (|first_msg#0@@6| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@5|) 0) (not (= |second_msg#0@@5| (select id@@0 second_pid)))) (> |second_msg#0@@5| (select id@@0 second_pid))) (trigger |first_msg#0@@6|)) (> (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6|) 0)) (not (= |first_msg#0@@6| (select id@@0 first_pid)))) (> |first_msg#0@@6| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6| (- (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6|) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6| (- (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@6| (+ (select (select (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6| (- (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@5| (- (select (select channel second_pid) |second_msg#0@@5|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@5|) 1))) first_pid) |first_msg#0@@6|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@6|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |49|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@5|) (Trigger_P_msg |first_msg#0@@6|))
))) (exists ((|second_msg#0@@6| Int) (|first_msg#0@@7| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@6|) 0) (not (= |second_msg#0@@6| (select id@@0 second_pid)))) (> |second_msg#0@@6| (select id@@0 second_pid))) (trigger |first_msg#0@@7|)) (> (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6|) 1))) first_pid) |first_msg#0@@7|) 0)) (not (= |first_msg#0@@7| (select id@@0 first_pid)))) (>= (select id@@0 first_pid) |first_msg#0@@7|)) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6|) 1))) first_pid (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6|) 1))) first_pid) |first_msg#0@@7| (- (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1) (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6| (+ (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@6| (- (select (select channel second_pid) |second_msg#0@@6|) 1))) (ite (< second_pid n) (+ second_pid 1) 1)) |second_msg#0@@6|) 1))) first_pid) |first_msg#0@@7|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |50|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@6|) (Trigger_P_msg |first_msg#0@@7|))
))) (exists ((|second_msg#0@@7| Int) ) (!  (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@7|) 0) (not (= |second_msg#0@@7| (select id@@0 second_pid)))) (>= (select id@@0 second_pid) |second_msg#0@@7|)) (= channel@7 (store channel second_pid (store (select channel second_pid) |second_msg#0@@7| (- (select (select channel second_pid) |second_msg#0@@7|) 1))))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |51|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@7|))
))) (exists ((|second_msg#0@@8| Int) (|first_msg#0@@8| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@8|) 0) (not (= |second_msg#0@@8| (select id@@0 second_pid)))) (>= (select id@@0 second_pid) |second_msg#0@@8|)) (trigger |first_msg#0@@8|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@8| (- (select (select channel second_pid) |second_msg#0@@8|) 1))) first_pid) |first_msg#0@@8|) 0)) (= |first_msg#0@@8| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@8| (- (select (select channel second_pid) |second_msg#0@@8|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@8| (- (select (select channel second_pid) |second_msg#0@@8|) 1))) first_pid) |first_msg#0@@8| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@8| (- (select (select channel second_pid) |second_msg#0@@8|) 1))) first_pid) |first_msg#0@@8|) 1))))) (= leader@3 (store leader first_pid true))) (= inline$P$0$PAs@4 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |52|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@8|) (Trigger_P_msg |first_msg#0@@8|))
))) (exists ((|second_msg#0@@9| Int) (|first_msg#0@@9| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@9|) 0) (not (= |second_msg#0@@9| (select id@@0 second_pid)))) (>= (select id@@0 second_pid) |second_msg#0@@9|)) (trigger |first_msg#0@@9|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9|) 0)) (not (= |first_msg#0@@9| (select id@@0 first_pid)))) (> |first_msg#0@@9| (select id@@0 first_pid))) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9|) 1))) (ite (< first_pid n) (+ first_pid 1) 1) (store (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@9| (+ (select (select (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@9| (- (select (select channel second_pid) |second_msg#0@@9|) 1))) first_pid) |first_msg#0@@9|) 1))) (ite (< first_pid n) (+ first_pid 1) 1)) |first_msg#0@@9|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |53|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@9|) (Trigger_P_msg |first_msg#0@@9|))
))) (exists ((|second_msg#0@@10| Int) (|first_msg#0@@10| Int) ) (!  (and (and (and (and (and (and (and (and (and (and (and (and (> (select (select channel second_pid) |second_msg#0@@10|) 0) (not (= |second_msg#0@@10| (select id@@0 second_pid)))) (>= (select id@@0 second_pid) |second_msg#0@@10|)) (trigger |first_msg#0@@10|)) (> (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@10| (- (select (select channel second_pid) |second_msg#0@@10|) 1))) first_pid) |first_msg#0@@10|) 0)) (not (= |first_msg#0@@10| (select id@@0 first_pid)))) (>= (select id@@0 first_pid) |first_msg#0@@10|)) (= |inline$P'$0$PAs@4| (store (|lambda#1| 0) (P_PA second_pid) 1))) (= channel@7 (store (store channel second_pid (store (select channel second_pid) |second_msg#0@@10| (- (select (select channel second_pid) |second_msg#0@@10|) 1))) first_pid (store (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@10| (- (select (select channel second_pid) |second_msg#0@@10|) 1))) first_pid) |first_msg#0@@10| (- (select (select (store channel second_pid (store (select channel second_pid) |second_msg#0@@10| (- (select (select channel second_pid) |second_msg#0@@10|) 1))) first_pid) |first_msg#0@@10|) 1))))) (= inline$P$0$PAs@4 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|) (store (|lambda#1| 0) (P_PA second_pid) 1)) inline$P$0$PAs@4) (store (|lambda#1| 0) (P_PA first_pid) 1)))) (= id@@0 id@@0)) (= leader@3 leader))
 :qid |unknown.0:0|
 :skolemid |54|
 :pattern ( (|Trigger_P'_msg| |second_msg#0@@10|) (Trigger_P_msg |first_msg#0@@10|))
)))))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs@1 |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) pendingAsyncs@2 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 103071) 103127)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA second_pid) 1)) (=> (and (and (= channel@7 channel@6) (= leader@3 leader@1)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|) (= (ControlFlow 0 103053) 103071))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (>= (select id@@0 second_pid) |inline$P'$0$msg@0|) (=> (and (= channel@6 channel@4) (= (ControlFlow 0 103041) 103053)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (and (and (> |inline$P'$0$msg@0| (select id@@0 second_pid)) (= channel@5 (store channel@4 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@4 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@4 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0|) 1))))) (and (= channel@6 channel@5) (= (ControlFlow 0 103099) 103053))) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 103029) 103099) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 103029) 103041) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (= |inline$P'$0$msg@0| (select id@@0 second_pid)) (=> (and (= leader@2 (store leader@1 second_pid true)) (= |inline$P'$0$PAs@2| (|lambda#1| 0))) (=> (and (and (= channel@7 channel@4) (= leader@3 leader@2)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|) (= (ControlFlow 0 103115) 103071))) |inline$P'$0$anon7_correct|)))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel@3 second_pid) |inline$P'$0$msg@0|) 0) (= channel@4 (store channel@3 second_pid (store (select channel@3 second_pid) |inline$P'$0$msg@0| (- (select (select channel@3 second_pid) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 103017) 103115) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 103017) 103029) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (=> (and (and (= channel@7 channel@3) (= leader@3 leader@1)) (and (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|) (= (ControlFlow 0 103119) 103071))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 102987) 103119) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 102987) 103017) |inline$P'$0$anon8_Else_correct|)))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA first_pid) 1))) (= (ControlFlow 0 102738) 102987)) |inline$P'$0$anon0_correct|))))
(let ((inline$P$0$anon6_correct  (=> (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA first_pid) 1)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@3) (= channel@3 channel@2)) (and (= leader@1 leader) (= (ControlFlow 0 102720) 102738))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon10_Else_correct  (=> (>= (select id@@0 first_pid) inline$P$0$msg@0) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 102708) 102720)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon10_Then_correct  (=> (and (and (> inline$P$0$msg@0 (select id@@0 first_pid)) (= channel@1 (store channel@0 (ite (< first_pid n) (+ first_pid 1) 1) (store (select channel@0 (ite (< first_pid n) (+ first_pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< first_pid n) (+ first_pid 1) 1)) inline$P$0$msg@0) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 102766) 102720))) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 first_pid))) (and (=> (= (ControlFlow 0 102696) 102766) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 102696) 102708) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (= inline$P$0$msg@0 (select id@@0 first_pid)) (=> (and (= leader@0 (store leader first_pid true)) (= inline$P$0$PAs@2 (|lambda#1| 0))) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@2) (= channel@3 channel@0)) (and (= leader@1 leader@0) (= (ControlFlow 0 102782) 102738))) inline$P$0$anon7_correct)))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel first_pid) inline$P$0$msg@0) 0) (= channel@0 (store channel first_pid (store (select channel first_pid) inline$P$0$msg@0 (- (select (select channel first_pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 102684) 102782) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 102684) 102696) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (= inline$P$0$PAs@1 (|lambda#1| 0)) (=> (and (and (= inline$P$0$PAs@4 inline$P$0$PAs@1) (= channel@3 channel)) (and (= leader@1 leader) (= (ControlFlow 0 102786) 102738))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 102650) 102786) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 102650) 102684) inline$P$0$anon8_Else_correct)))))
(let ((inline$P$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |39|
)) (=> (and (<= 1 first_pid) (<= first_pid n)) (=> (and (and (and (> (select pendingAsyncs (P_PA first_pid)) 0) (forall ((first_m Int) ) (!  (=> (> (select (select channel first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))) (and (<= 1 second_pid) (<= second_pid n))) (and (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((second_j Int) ) (!  (=> (and (and (<= 1 second_j) (<= second_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 second_j) (<= second_j n))) (and (<= 1 second_pid) (<= second_pid n))) (or (or (or (and (< (q@max id@@0) second_j) (< second_j second_pid)) (and (< second_pid (q@max id@@0)) (< (q@max id@@0) second_j))) (and (< second_j second_pid) (< second_pid (q@max id@@0)))) (and (= (q@max id@@0) second_pid) (not (= (q@max id@@0) second_j)))))) (= (select pendingAsyncs (P_PA second_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 139006) 102650)))) inline$P$0$anon0_correct)))))
inline$P$0$Entry_correct)))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun inline$P$0$PAs@4 () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun inline$P$0$PAs@3 () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun inline$P$0$msg@0 () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun inline$P$0$PAs@2 () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun inline$P$0$PAs@1 () (Array T@PA Int))
(declare-fun Trigger_P_msg (Int) Bool)
(push 1)
(set-info :boogie-vc-id |GatePreservationChecker_P'_P|)
(assert (not
 (=> (= (ControlFlow 0 0) 152057) (let ((inline$P$0$Return_correct  (and (=> (= (ControlFlow 0 103602) (- 0 152767)) (=> true (and (<= 1 first_pid) (<= first_pid n)))) (=> (=> true (and (<= 1 first_pid) (<= first_pid n))) (and (=> (= (ControlFlow 0 103602) (- 0 152775)) (=> true (> (select pendingAsyncs@1 (P_PA first_pid)) 0))) (=> (=> true (> (select pendingAsyncs@1 (P_PA first_pid)) 0)) (and (=> (= (ControlFlow 0 103602) (- 0 152790)) (=> true (forall ((first_m Int) ) (!  (=> (> (select (select channel@3 first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
)))) (=> (=> true (forall ((first_m@@0 Int) ) (!  (=> (> (select (select channel@3 first_pid) first_m@@0) 0) (<= first_m@@0 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (=> (= (ControlFlow 0 103602) (- 0 152824)) (=> true (forall ((first_j Int) ) (!  (=> (and (and (<= 1 first_j) (<= first_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 first_j) (<= first_j n))) (and (<= 1 first_pid) (<= first_pid n))) (or (or (or (and (< (q@max id@@0) first_j) (< first_j first_pid)) (and (< first_pid (q@max id@@0)) (< (q@max id@@0) first_j))) (and (< first_j first_pid) (< first_pid (q@max id@@0)))) (and (= (q@max id@@0) first_pid) (not (= (q@max id@@0) first_j)))))) (= (select pendingAsyncs@1 (P_PA first_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
))))))))))))
(let ((inline$P$0$anon7_correct  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs inline$P$0$PAs@4)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 103546) 103602)) inline$P$0$Return_correct))))
(let ((inline$P$0$anon6_correct  (=> (and (and (= inline$P$0$PAs@3 (store (|lambda#1| 0) (P_PA second_pid) 1)) (= inline$P$0$PAs@4 inline$P$0$PAs@3)) (and (= channel@3 channel@2) (= (ControlFlow 0 103528) 103546))) inline$P$0$anon7_correct)))
(let ((inline$P$0$anon10_Else_correct  (=> (>= (select id@@0 second_pid) inline$P$0$msg@0) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 103516) 103528)) inline$P$0$anon6_correct))))
(let ((inline$P$0$anon10_Then_correct  (=> (and (and (> inline$P$0$msg@0 (select id@@0 second_pid)) (= channel@1 (store channel@0 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) inline$P$0$msg@0 (+ (select (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) inline$P$0$msg@0) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 103574) 103528))) inline$P$0$anon6_correct)))
(let ((inline$P$0$anon9_Else_correct  (=> (not (= inline$P$0$msg@0 (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 103504) 103574) inline$P$0$anon10_Then_correct) (=> (= (ControlFlow 0 103504) 103516) inline$P$0$anon10_Else_correct)))))
(let ((inline$P$0$anon9_Then_correct  (=> (and (= inline$P$0$msg@0 (select id@@0 second_pid)) (= leader@0 (store leader second_pid true))) (=> (and (and (= inline$P$0$PAs@2 (|lambda#1| 0)) (= inline$P$0$PAs@4 inline$P$0$PAs@2)) (and (= channel@3 channel@0) (= (ControlFlow 0 103590) 103546))) inline$P$0$anon7_correct))))
(let ((inline$P$0$anon8_Else_correct  (=> (trigger inline$P$0$msg@0) (=> (and (> (select (select channel second_pid) inline$P$0$msg@0) 0) (= channel@0 (store channel second_pid (store (select channel second_pid) inline$P$0$msg@0 (- (select (select channel second_pid) inline$P$0$msg@0) 1))))) (and (=> (= (ControlFlow 0 103492) 103590) inline$P$0$anon9_Then_correct) (=> (= (ControlFlow 0 103492) 103504) inline$P$0$anon9_Else_correct))))))
(let ((inline$P$0$anon8_Then_correct  (=> (and (and (= inline$P$0$PAs@1 (|lambda#1| 0)) (= inline$P$0$PAs@4 inline$P$0$PAs@1)) (and (= channel@3 channel) (= (ControlFlow 0 103594) 103546))) inline$P$0$anon7_correct)))
(let ((inline$P$0$anon0_correct  (=> (Trigger_P_msg inline$P$0$msg@0) (and (=> (= (ControlFlow 0 103458) 103594) inline$P$0$anon8_Then_correct) (=> (= (ControlFlow 0 103458) 103492) inline$P$0$anon8_Else_correct)))))
(let ((inline$P$0$Entry_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |55|
)) (=> (and (<= 1 second_pid) (<= second_pid n)) (=> (and (and (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))) (and (<= 1 first_pid) (<= first_pid n))) (and (and (> (select pendingAsyncs (P_PA first_pid)) 0) (forall ((first_m@@1 Int) ) (!  (=> (> (select (select channel first_pid) first_m@@1) 0) (<= first_m@@1 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((first_j@@0 Int) ) (!  (=> (and (and (<= 1 first_j@@0) (<= first_j@@0 n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 first_j@@0) (<= first_j@@0 n))) (and (<= 1 first_pid) (<= first_pid n))) (or (or (or (and (< (q@max id@@0) first_j@@0) (< first_j@@0 first_pid)) (and (< first_pid (q@max id@@0)) (< (q@max id@@0) first_j@@0))) (and (< first_j@@0 first_pid) (< first_pid (q@max id@@0)))) (and (= (q@max id@@0) first_pid) (not (= (q@max id@@0) first_j@@0)))))) (= (select pendingAsyncs (P_PA first_j@@0)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 152057) 103458)))) inline$P$0$anon0_correct)))))
inline$P$0$Entry_correct))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun first_pid () Int)
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun |inline$P'$0$PAs@4| () (Array T@PA Int))
(declare-fun second_pid () Int)
(declare-fun |inline$P'$0$PAs@3| () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$msg@0| () Int)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(declare-fun |inline$P'$0$PAs@2| () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun |inline$P'$0$PAs@1| () (Array T@PA Int))
(declare-fun |Trigger_P'_msg| (Int) Bool)
(push 1)
(set-info :boogie-vc-id |FailurePreservationChecker_P_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 152867) (let ((|inline$P'$0$Return_correct|  (=> (= (ControlFlow 0 104005) (- 0 153545)) (=> true (not (and (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs@1 (P_PA first_pid)) 0)) (forall ((first_m Int) ) (!  (=> (> (select (select channel@3 first_pid) first_m) 0) (<= first_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))))))))
(let ((|inline$P'$0$anon7_correct|  (=> (= pendingAsyncs@0 ((_ map (+ (Int Int) Int)) pendingAsyncs |inline$P'$0$PAs@4|)) (=> (and (= pendingAsyncs@1 ((_ map (- (Int Int) Int)) pendingAsyncs@0 (store (|lambda#1| 0) (P_PA second_pid) 1))) (= (ControlFlow 0 103949) 104005)) |inline$P'$0$Return_correct|))))
(let ((|inline$P'$0$anon6_correct|  (=> (and (and (= |inline$P'$0$PAs@3| (store (|lambda#1| 0) (P_PA second_pid) 1)) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@3|)) (and (= channel@3 channel@2) (= (ControlFlow 0 103931) 103949))) |inline$P'$0$anon7_correct|)))
(let ((|inline$P'$0$anon10_Else_correct|  (=> (>= (select id@@0 second_pid) |inline$P'$0$msg@0|) (=> (and (= channel@2 channel@0) (= (ControlFlow 0 103919) 103931)) |inline$P'$0$anon6_correct|))))
(let ((|inline$P'$0$anon10_Then_correct|  (=> (and (and (> |inline$P'$0$msg@0| (select id@@0 second_pid)) (= channel@1 (store channel@0 (ite (< second_pid n) (+ second_pid 1) 1) (store (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0| (+ (select (select channel@0 (ite (< second_pid n) (+ second_pid 1) 1)) |inline$P'$0$msg@0|) 1))))) (and (= channel@2 channel@1) (= (ControlFlow 0 103977) 103931))) |inline$P'$0$anon6_correct|)))
(let ((|inline$P'$0$anon9_Else_correct|  (=> (not (= |inline$P'$0$msg@0| (select id@@0 second_pid))) (and (=> (= (ControlFlow 0 103907) 103977) |inline$P'$0$anon10_Then_correct|) (=> (= (ControlFlow 0 103907) 103919) |inline$P'$0$anon10_Else_correct|)))))
(let ((|inline$P'$0$anon9_Then_correct|  (=> (and (= |inline$P'$0$msg@0| (select id@@0 second_pid)) (= leader@0 (store leader second_pid true))) (=> (and (and (= |inline$P'$0$PAs@2| (|lambda#1| 0)) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@2|)) (and (= channel@3 channel@0) (= (ControlFlow 0 103993) 103949))) |inline$P'$0$anon7_correct|))))
(let ((|inline$P'$0$anon8_Else_correct|  (=> (and (> (select (select channel second_pid) |inline$P'$0$msg@0|) 0) (= channel@0 (store channel second_pid (store (select channel second_pid) |inline$P'$0$msg@0| (- (select (select channel second_pid) |inline$P'$0$msg@0|) 1))))) (and (=> (= (ControlFlow 0 103895) 103993) |inline$P'$0$anon9_Then_correct|) (=> (= (ControlFlow 0 103895) 103907) |inline$P'$0$anon9_Else_correct|)))))
(let ((|inline$P'$0$anon8_Then_correct|  (=> (and (and (= |inline$P'$0$PAs@1| (|lambda#1| 0)) (= |inline$P'$0$PAs@4| |inline$P'$0$PAs@1|)) (and (= channel@3 channel) (= (ControlFlow 0 103997) 103949))) |inline$P'$0$anon7_correct|)))
(let ((|inline$P'$0$anon0_correct|  (=> (|Trigger_P'_msg| |inline$P'$0$msg@0|) (and (=> (= (ControlFlow 0 103865) 103997) |inline$P'$0$anon8_Then_correct|) (=> (= (ControlFlow 0 103865) 103895) |inline$P'$0$anon8_Else_correct|)))))
(let ((|inline$P'$0$Entry_correct|  (=> (and (and (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) first_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) (store ((as const (Array Int Bool)) false) second_pid true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |56|
)) (not (and (and (and (<= 1 first_pid) (<= first_pid n)) (> (select pendingAsyncs (P_PA first_pid)) 0)) (forall ((first_m@@0 Int) ) (!  (=> (> (select (select channel first_pid) first_m@@0) 0) (<= first_m@@0 (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |18|
))))) (and (<= 1 second_pid) (<= second_pid n))) (and (and (> (select pendingAsyncs (P_PA second_pid)) 0) (forall ((second_m Int) ) (!  (=> (> (select (select channel second_pid) second_m) 0) (<= second_m (select id@@0 (q@max id@@0))))
 :qid |unknown.0:0|
 :skolemid |9|
))) (and (forall ((second_j Int) ) (!  (=> (and (and (<= 1 second_j) (<= second_j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 second_j) (<= second_j n))) (and (<= 1 second_pid) (<= second_pid n))) (or (or (or (and (< (q@max id@@0) second_j) (< second_j second_pid)) (and (< second_pid (q@max id@@0)) (< (q@max id@@0) second_j))) (and (< second_j second_pid) (< second_pid (q@max id@@0)))) (and (= (q@max id@@0) second_pid) (not (= (q@max id@@0) second_j)))))) (= (select pendingAsyncs (P_PA second_j)) 0))
 :qid |unknown.0:0|
 :skolemid |10|
)) (= (ControlFlow 0 152867) 103865)))) |inline$P'$0$anon0_correct|)))
|inline$P'$0$Entry_correct|))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun pid () Int)
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun id@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id |NonBlockingChecker_P'|)
(assert (not
 (=> (= (ControlFlow 0 0) 153604) (let ((L_correct  (=> (= (ControlFlow 0 73839) (- 0 153765)) true)))
(let ((PreconditionGeneratedEntry_correct  (=> (and (<= 1 pid) (<= pid n)) (=> (and (and (> (select pendingAsyncs (P_PA pid)) 0) (forall ((m Int) ) (!  (=> (> (select (select channel pid) m) 0) (<= m (select id@@0 (q@max id@@0))))
 :qid |ChangRob.113:18|
 :skolemid |9|
))) (and (forall ((j Int) ) (!  (=> (and (and (<= 1 j) (<= j n)) (and (and (and (and (<= 1 (q@max id@@0)) (<= (q@max id@@0) n)) (and (<= 1 j) (<= j n))) (and (<= 1 pid) (<= pid n))) (or (or (or (and (< (q@max id@@0) j) (< j pid)) (and (< pid (q@max id@@0)) (< (q@max id@@0) j))) (and (< j pid) (< pid (q@max id@@0)))) (and (= (q@max id@@0) pid) (not (= (q@max id@@0) j)))))) (= (select pendingAsyncs (P_PA j)) 0))
 :qid |ChangRob.115:18|
 :skolemid |10|
)) (= (ControlFlow 0 153604) 73839))) L_correct))))
PreconditionGeneratedEntry_correct)))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun linear_pid_available@6 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun linear_pid_available@4 () (Array Int Bool))
(declare-fun |call7formal@pids'@0| () (Array Int Bool))
(declare-fun call6formal@p@0 () Int)
(declare-fun i@1 () Int)
(declare-fun i@0 () Int)
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun |pids'@0| () (Array Int Bool))
(declare-fun pids () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id main_0)
(assert (not
 (=> (= (ControlFlow 0 0) 153814) (let ((anon2_0_correct true))
(let ((anon3_LoopBody_0_@2_anon3_LoopHead_correct true))
(let ((RefinementCheckerForYieldingLoops_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L0_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L0_correct true))
(let ((anon3_LoopDone_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@6 linear_pid_available@3) (and (and (and (and (and (and (=> (= (ControlFlow 0 153830) 104887) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 153830) 104891) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 153830) 104905) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 153830) 104725) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 153830) 104729) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 153830) 104520) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 153830) 104567) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon3_LoopBody_0_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@6 linear_pid_available@4) (and (and (and (and (and (and (=> (= (ControlFlow 0 153828) 104887) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 153828) 104891) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 153828) 104905) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 153828) 104725) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 153828) 104729) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 153828) 104520) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 153828) 104567) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon3_LoopBody_0_correct  (=> (= linear_pid_available@4 ((_ map or) |call7formal@pids'@0| ((_ map or) (store ((as const (Array Int Bool)) false) call6formal@p@0 true) ((as const (Array Int Bool)) false)))) (=> (and (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) (store ((as const (Array Int Bool)) false) call6formal@p@0 true) ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) |call7formal@pids'@0| ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |60|
)) (= i@1 (+ i@0 1))) (and (and (=> (= (ControlFlow 0 104226) 153778) anon3_LoopBody_0_@2_anon3_LoopHead_correct) (=> (= (ControlFlow 0 104226) 153828) anon3_LoopBody_0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 104226) 104913) RefinementCheckerForYieldingLoops_correct))))))
(let ((anon3_LoopBody_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@6 linear_pid_available@3) (and (and (and (and (and (and (=> (= (ControlFlow 0 153826) 104887) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 153826) 104891) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 153826) 104905) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 153826) 104725) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 153826) 104729) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 153826) 104520) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 153826) 104567) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon3_LoopBody_correct  (=> (<= i@0 n) (and (and (=> (= (ControlFlow 0 104149) 104226) anon3_LoopBody_0_correct) (=> (= (ControlFlow 0 104149) 153826) anon3_LoopBody_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 104149) 104913) RefinementCheckerForYieldingLoops_correct)))))
(let ((anon0_0_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@6 linear_pid_available@1) (and (and (and (and (and (and (=> (= (ControlFlow 0 153824) 104887) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 153824) 104891) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 153824) 104905) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 153824) 104725) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 153824) 104729) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 153824) 104520) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 153824) 104567) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@6 linear_pid_available@0) (and (and (and (and (and (and (=> (= (ControlFlow 0 153822) 104887) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 153822) 104891) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 153822) 104905) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 153822) 104725) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 153822) 104729) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 153822) 104520) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 153822) 104567) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((RefinementChecker_correct true))
(let ((anon3_LoopDone_correct  (=> (< n i@0) (and (and (=> (= (ControlFlow 0 104234) 104254) anon2_0_correct) (=> (= (ControlFlow 0 104234) 153830) anon3_LoopDone_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 104234) 104909) RefinementChecker_correct)))))
(let ((anon3_LoopHead_correct  (=> (= linear_pid_available@3 ((_ map or) |pids'@0| ((as const (Array Int Bool)) false))) (and (=> (= (ControlFlow 0 104141) 104234) anon3_LoopDone_correct) (=> (= (ControlFlow 0 104141) 104149) anon3_LoopBody_correct)))))
(let ((anon0_0_correct  (=> (= linear_pid_available@1 ((_ map or) pids ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 104121) 153824) anon0_0_@2_NoninterferenceChecker_correct) (=> (= (ControlFlow 0 104121) 104909) RefinementChecker_correct)) (=> (= (ControlFlow 0 104121) 104141) anon3_LoopHead_correct)))))
(let ((anon0_correct  (=> (= linear_pid_available@0 ((_ map or) pids ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 104097) 104121) anon0_0_correct) (=> (= (ControlFlow 0 104097) 153822) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 104097) 104909) RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 153814) 104097) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun linear_pid_available@5 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun linear_pid_available@2 () (Array Int Bool))
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun call0formal@pid@0 () Int)
(declare-fun pid () Int)
(push 1)
(set-info :boogie-vc-id pinit_0)
(assert (not
 (=> (= (ControlFlow 0 0) 154554) (let ((anon0_0_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L0_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L0_correct true))
(let ((anon0_1_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@5 linear_pid_available@3) (and (and (and (and (and (and (=> (= (ControlFlow 0 154570) 105843) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 154570) 105847) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 154570) 105861) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 154570) 105681) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 154570) 105685) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 154570) 105476) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 154570) 105523) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_2_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@5 linear_pid_available@2) (and (and (and (and (and (and (=> (= (ControlFlow 0 154568) 105843) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 154568) 105847) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 154568) 105861) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 154568) 105681) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 154568) 105685) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 154568) 105476) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 154568) 105523) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_3_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@5 linear_pid_available@1) (and (and (and (and (and (and (=> (= (ControlFlow 0 154566) 105843) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 154566) 105847) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 154566) 105861) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 154566) 105681) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 154566) 105685) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 154566) 105476) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 154566) 105523) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@5 linear_pid_available@0) (and (and (and (and (and (and (=> (= (ControlFlow 0 154564) 105843) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 154564) 105847) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 154564) 105861) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 154564) 105681) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 154564) 105685) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 154564) 105476) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 154564) 105523) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((RefinementChecker_correct true))
(let ((anon0_1_correct  (=> (and (= call0formal@pid@0 (ite (< pid n) (+ pid 1) 1)) (= linear_pid_available@3 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false)))) (and (and (=> (= (ControlFlow 0 105196) 105210) anon0_0_correct) (=> (= (ControlFlow 0 105196) 154570) anon0_1_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 105196) 105865) RefinementChecker_correct)))))
(let ((anon0_2_correct  (=> (= linear_pid_available@2 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 105176) 105196) anon0_1_correct) (=> (= (ControlFlow 0 105176) 154568) anon0_2_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 105176) 105865) RefinementChecker_correct)))))
(let ((anon0_3_correct  (=> (= linear_pid_available@1 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 105156) 105176) anon0_2_correct) (=> (= (ControlFlow 0 105156) 154566) anon0_3_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 105156) 105865) RefinementChecker_correct)))))
(let ((anon0_correct  (=> (= linear_pid_available@0 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 105136) 105156) anon0_3_correct) (=> (= (ControlFlow 0 105136) 154564) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 105136) 105865) RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 154554) 105136) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun linear_pid_available@9 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun linear_pid_available@7 () (Array Int Bool))
(declare-fun linear_pid_available@2 () (Array Int Bool))
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun linear_pid_available@6 () (Array Int Bool))
(declare-fun pid () Int)
(declare-fun call5formal@m@0 () Int)
(declare-fun call5formal@i@0 () Int)
(declare-fun linear_pid_available@5 () (Array Int Bool))
(declare-fun call0formal@pid@0 () Int)
(declare-fun linear_pid_available@4 () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id p_0)
(assert (not
 (=> (= (ControlFlow 0 0) 155218) (let ((anon5_0_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_0$0$L0_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_0$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_0$0$L0_correct true))
(let ((anon6_Then_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@3) (and (and (and (and (and (and (=> (= (ControlFlow 0 155242) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155242) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155242) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155242) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155242) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155242) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155242) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon7_Then_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@3) (and (and (and (and (and (and (=> (= (ControlFlow 0 155240) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155240) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155240) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155240) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155240) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155240) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155240) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon5_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@7) (and (and (and (and (and (and (=> (= (ControlFlow 0 155238) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155238) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155238) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155238) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155238) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155238) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155238) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_1_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@2) (and (and (and (and (and (and (=> (= (ControlFlow 0 155236) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155236) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155236) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155236) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155236) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155236) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155236) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_2_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@1) (and (and (and (and (and (and (=> (= (ControlFlow 0 155234) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155234) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155234) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155234) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155234) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155234) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155234) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= linear_pid_available@9 linear_pid_available@0) (and (and (and (and (and (and (=> (= (ControlFlow 0 155232) 106858) inline$NoninterferenceChecker_p_0$0$L0_correct) (=> (= (ControlFlow 0 155232) 106862) inline$NoninterferenceChecker_p_0$0$L1_correct)) (=> (= (ControlFlow 0 155232) 106876) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 155232) 106696) inline$NoninterferenceChecker_pinit_0$0$L0_correct)) (=> (= (ControlFlow 0 155232) 106700) inline$NoninterferenceChecker_pinit_0$0$L1_correct)) (=> (= (ControlFlow 0 155232) 106491) inline$NoninterferenceChecker_main_0$0$L0_correct)) (=> (= (ControlFlow 0 155232) 106538) inline$NoninterferenceChecker_main_0$0$L1_correct)))))
(let ((RefinementChecker_correct true))
(let ((anon6_Then_0_correct  (=> (and (= linear_pid_available@6 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (= linear_pid_available@7 linear_pid_available@6)) (and (and (=> (= (ControlFlow 0 106225) 106169) anon5_0_correct) (=> (= (ControlFlow 0 106225) 155238) anon5_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106225) 106880) RefinementChecker_correct)))))
(let ((anon6_Then_correct  (=> (= call5formal@m@0 call5formal@i@0) (and (and (=> (= (ControlFlow 0 106205) 106225) anon6_Then_0_correct) (=> (= (ControlFlow 0 106205) 155242) anon6_Then_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106205) 106880) RefinementChecker_correct)))))
(let ((anon4_correct  (=> (= linear_pid_available@7 linear_pid_available@5) (and (and (=> (= (ControlFlow 0 106153) 106169) anon5_0_correct) (=> (= (ControlFlow 0 106153) 155238) anon5_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106153) 106880) RefinementChecker_correct)))))
(let ((anon7_Then_0_correct  (=> (and (and (= call0formal@pid@0 (ite (< pid n) (+ pid 1) 1)) (= linear_pid_available@4 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false)))) (and (= linear_pid_available@5 linear_pid_available@4) (= (ControlFlow 0 106197) 106153))) anon4_correct)))
(let ((anon7_Then_correct  (=> (> call5formal@m@0 call5formal@i@0) (and (and (=> (= (ControlFlow 0 106177) 106197) anon7_Then_0_correct) (=> (= (ControlFlow 0 106177) 155240) anon7_Then_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106177) 106880) RefinementChecker_correct)))))
(let ((anon7_Else_correct  (=> (>= call5formal@i@0 call5formal@m@0) (=> (and (= linear_pid_available@5 linear_pid_available@3) (= (ControlFlow 0 106151) 106153)) anon4_correct))))
(let ((anon6_Else_correct  (=> (not (= call5formal@m@0 call5formal@i@0)) (and (=> (= (ControlFlow 0 106143) 106177) anon7_Then_correct) (=> (= (ControlFlow 0 106143) 106151) anon7_Else_correct)))))
(let ((anon0_0_correct  (=> (= linear_pid_available@3 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (=> (= (ControlFlow 0 106135) 106205) anon6_Then_correct) (=> (= (ControlFlow 0 106135) 106143) anon6_Else_correct)))))
(let ((anon0_1_correct  (=> (= linear_pid_available@2 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 106115) 106135) anon0_0_correct) (=> (= (ControlFlow 0 106115) 155236) anon0_1_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106115) 106880) RefinementChecker_correct)))))
(let ((anon0_2_correct  (=> (= linear_pid_available@1 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 106095) 106115) anon0_1_correct) (=> (= (ControlFlow 0 106095) 155234) anon0_2_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106095) 106880) RefinementChecker_correct)))))
(let ((anon0_correct  (=> (= linear_pid_available@0 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (and (and (=> (= (ControlFlow 0 106075) 106095) anon0_2_correct) (=> (= (ControlFlow 0 106075) 155232) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 106075) 106880) RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (= (ControlFlow 0 155218) 106075) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun civl_pc@1 () Bool)
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun id@0 () (Array Int Int))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun civl_pc@0 () Bool)
(declare-fun civl_ok@1 () Bool)
(declare-fun PAs@0 () (Array T@PA Int))
(declare-fun PAs () (Array T@PA Int))
(declare-fun civl_ok@0 () Bool)
(declare-fun pids () (Array Int Bool))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun id@1 () (Array Int Int))
(declare-fun linear_pid_available@2 () (Array Int Bool))
(declare-fun |pids'@0| () (Array Int Bool))
(declare-fun civl_pc@2 () Bool)
(declare-fun civl_ok@2 () Bool)
(declare-fun i@0 () Int)
(declare-fun PAs@1 () (Array T@PA Int))
(declare-fun i@1 () Int)
(declare-fun |inline$LINEAR_TRANSFER$0$pids'@2| () (Array Int Bool))
(declare-fun inline$NoninterferenceChecker_main_1$0$pids@0 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun civl_global_old_channel@0 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_pendingAsyncs@0 () (Array T@PA Int))
(declare-fun civl_global_old_leader@0 () (Array Int Bool))
(declare-fun civl_global_old_id@0 () (Array Int Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun leader@2 () (Array Int Bool))
(declare-fun id@2 () (Array Int Int))
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun leader () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun civl_pc@3 () Bool)
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_channel@1 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@4 () (Array T@PA Int))
(declare-fun civl_global_old_pendingAsyncs@1 () (Array T@PA Int))
(declare-fun id@3 () (Array Int Int))
(declare-fun civl_global_old_id@1 () (Array Int Int))
(declare-fun leader@3 () (Array Int Bool))
(declare-fun civl_global_old_leader@1 () (Array Int Bool))
(declare-fun PAs@2 () (Array T@PA Int))
(declare-fun civl_old_PAs@0 () (Array T@PA Int))
(push 1)
(set-info :boogie-vc-id main_1)
(assert (not
 (=> (= (ControlFlow 0 0) 156144) (let ((anon2_0_correct  (=> (and (and (and (= civl_pc@1  (=> (and (and (and (= channel@0 channel@0) (= pendingAsyncs@1 pendingAsyncs@0)) (= id@0 id@0)) (= leader@0 leader@0)) civl_pc@0)) (= civl_ok@1  (or (and (and (and (and (= PAs@0 (|lambda#7| 1 0)) (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 PAs@0))) (= channel@0 channel@0)) (= id@0 id@0)) (= leader@0 leader@0)) (and (= PAs@0 PAs) civl_ok@0)))) (and (or civl_pc@1 (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel@1 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@2 (|lambda#1| 0))) (= leader@1 (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select id@1 i@@3) (select id@1 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0))) (= linear_pid_available@2 ((_ map or) |pids'@0| ((as const (Array Int Bool)) false))))) (and (and (= civl_pc@2  (=> (and (and (and (= channel@1 channel@1) (= pendingAsyncs@2 pendingAsyncs@2)) (= id@1 id@1)) (= leader@1 leader@1)) civl_pc@1)) (= civl_ok@2  (or (and (and (and (and (= PAs@0 (|lambda#7| 1 0)) (= pendingAsyncs@2 ((_ map (+ (Int Int) Int)) pendingAsyncs@2 PAs@0))) (= channel@1 channel@1)) (= id@1 id@1)) (= leader@1 leader@1)) (and (= PAs@0 PAs@0) civl_ok@1)))) (= (ControlFlow 0 107799) (- 0 156987)))) civl_ok@2)))
(let ((anon3_LoopBody$1_correct  (and (=> (= (ControlFlow 0 107492) (- 0 156675)) (and (<= 1 i@0) (<= i@0 n))) (=> (and (<= 1 i@0) (<= i@0 n)) (=> (and (= PAs@1 (store PAs@0 (PInit_PA i@0) (+ (select PAs@0 (PInit_PA i@0)) 1))) (= i@1 (+ i@0 1))) (and (=> (= (ControlFlow 0 107492) (- 0 156711)) (and (<= 1 i@1) (<= i@1 (+ n 1)))) (=> (and (<= 1 i@1) (<= i@1 (+ n 1))) (and (=> (= (ControlFlow 0 107492) (- 0 156727)) (forall ((ii Int) ) (!  (=> (and (and (<= 1 ii) (<= ii n)) (>= ii i@1)) (select |inline$LINEAR_TRANSFER$0$pids'@2| ii))
 :qid |ChangRob.271:32|
 :skolemid |19|
))) (=> (forall ((ii@@0 Int) ) (!  (=> (and (and (<= 1 ii@@0) (<= ii@@0 n)) (>= ii@@0 i@1)) (select |inline$LINEAR_TRANSFER$0$pids'@2| ii@@0))
 :qid |ChangRob.271:32|
 :skolemid |19|
)) (=> (= (ControlFlow 0 107492) (- 0 156748)) (= PAs@1 (|lambda#33| i@1 1 0))))))))))))
(let ((inline$LINEAR_TRANSFER$0$anon0_correct  (=> (and (= |inline$LINEAR_TRANSFER$0$pids'@2| (store |pids'@0| i@0 false)) (= (ControlFlow 0 107456) 107492)) anon3_LoopBody$1_correct)))
(let ((anon3_LoopBody_correct  (=> (<= i@0 n) (and (=> (= (ControlFlow 0 107464) (- 0 156641)) (select |pids'@0| i@0)) (=> (select |pids'@0| i@0) (=> (= (ControlFlow 0 107464) 107456) inline$LINEAR_TRANSFER$0$anon0_correct))))))
(let ((inline$NoninterferenceChecker_main_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_1$0$L0_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) inline$NoninterferenceChecker_main_1$0$pids@0 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) linear_pid_available@3 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |68|
)) (=> (and (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= civl_global_old_channel@0 (|lambda#2| (|lambda#0| 0)))) (= civl_global_old_pendingAsyncs@0 (|lambda#1| 0))) (= civl_global_old_leader@0 (|lambda#3| false))) (forall ((i@@4 Int) (j@@0 Int) ) (!  (=> (= (select civl_global_old_id@0 i@@4) (select civl_global_old_id@0 j@@0)) (= i@@4 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 108109) (- 0 157263))) (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= channel@2 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@3 (|lambda#1| 0))) (= leader@2 (|lambda#3| false))) (forall ((i@@5 Int) (j@@1 Int) ) (!  (=> (= (select id@2 i@@5) (select id@2 j@@1)) (= i@@5 j@@1))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))))))
(let ((inline$NoninterferenceChecker_pinit_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_1$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L0_correct true))
(let ((anon3_LoopDone$1_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel@0) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs@0) (= civl_global_old_id@0 id@0)) (and (= civl_global_old_leader@0 leader@0) (= linear_pid_available@3 linear_pid_available@1))) (and (and (= channel@2 channel@0) (= pendingAsyncs@3 pendingAsyncs@1)) (and (= id@2 id@0) (= leader@2 leader@0)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 156163) 108476) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 156163) 108480) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 156163) 108494) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 156163) 108314) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 156163) 108318) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 156163) 108109) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 156163) 108156) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs) (= civl_global_old_id@0 id@@0)) (and (= civl_global_old_leader@0 leader) (= linear_pid_available@3 linear_pid_available@0))) (and (and (= channel@2 channel) (= pendingAsyncs@3 pendingAsyncs)) (and (= id@2 id@@0) (= leader@2 leader)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 156161) 108476) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 156161) 108480) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 156161) 108494) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 156161) 108314) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 156161) 108318) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 156161) 108109) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 156161) 108156) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((RefinementChecker_correct  (and (=> (= (ControlFlow 0 108636) (- 0 157421)) (or civl_pc@3 (or (and (and (and (= channel@3 civl_global_old_channel@1) (= pendingAsyncs@4 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (and (and (and (and (= PAs@2 (|lambda#7| 1 0)) (= pendingAsyncs@4 ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 PAs@2))) (= channel@3 civl_global_old_channel@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1))))) (=> (or civl_pc@3 (or (and (and (and (= channel@3 civl_global_old_channel@1) (= pendingAsyncs@4 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (and (and (and (and (= PAs@2 (|lambda#7| 1 0)) (= pendingAsyncs@4 ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 PAs@2))) (= channel@3 civl_global_old_channel@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)))) (=> (= (ControlFlow 0 108636) (- 0 157484)) (=> civl_pc@3 (and (and (and (and (= channel@3 civl_global_old_channel@1) (= pendingAsyncs@4 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (= PAs@2 civl_old_PAs@0))))))))
(let ((anon3_LoopDone$1_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel@0) (= civl_global_old_pendingAsyncs@1 pendingAsyncs@0)) (and (= civl_global_old_id@1 id@0) (= civl_global_old_leader@1 leader@0))) (=> (and (and (and (= civl_pc@3 civl_pc@0) (= civl_old_PAs@0 PAs)) (and (= channel@3 channel@0) (= pendingAsyncs@4 pendingAsyncs@1))) (and (and (= id@3 id@0) (= leader@3 leader@0)) (and (= PAs@2 PAs@0) (= (ControlFlow 0 156159) 108636)))) RefinementChecker_correct))))
(let ((inline$AddPendingAsyncs$0$anon0_correct  (=> (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 PAs@0)) (and (and (=> (= (ControlFlow 0 107535) 107799) anon2_0_correct) (=> (= (ControlFlow 0 107535) 156163) anon3_LoopDone$1_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 107535) 156159) anon3_LoopDone$1_@2_RefinementChecker_correct)))))
(let ((anon3_LoopDone_correct  (=> (and (< n i@0) (= (ControlFlow 0 107539) 107535)) inline$AddPendingAsyncs$0$anon0_correct)))
(let ((anon3_LoopHead_correct  (=> (and (and (<= 1 i@0) (<= i@0 (+ n 1))) (and (forall ((ii@@1 Int) ) (!  (=> (and (and (<= 1 ii@@1) (<= ii@@1 n)) (>= ii@@1 i@0)) (select |pids'@0| ii@@1))
 :qid |ChangRob.271:32|
 :skolemid |19|
)) (= PAs@0 (|lambda#33| i@0 1 0)))) (and (=> (= (ControlFlow 0 107390) 107539) anon3_LoopDone_correct) (=> (= (ControlFlow 0 107390) 107464) anon3_LoopBody_correct)))))
(let ((anon0_0_correct  (=> (and (= civl_pc@0  (=> (and (and (and (= channel channel) (= pendingAsyncs pendingAsyncs)) (= id@@0 id@@0)) (= leader leader)) false)) (= civl_ok@0  (or (and (and (and (and (= PAs (|lambda#7| 1 0)) (= pendingAsyncs ((_ map (+ (Int Int) Int)) pendingAsyncs PAs))) (= channel channel)) (= id@@0 id@@0)) (= leader leader)) (and (= PAs PAs) false)))) (and (=> (= (ControlFlow 0 107313) (- 0 156433)) (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@6 Int) (j@@2 Int) ) (!  (=> (= (select id@@0 i@@6) (select id@@0 j@@2)) (= i@@6 j@@2))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@7 Int) (j@@3 Int) ) (!  (=> (= (select id@@0 i@@7) (select id@@0 j@@3)) (= i@@7 j@@3))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (=> (and (or civl_pc@0 (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel@0 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@0 (|lambda#1| 0))) (= leader@0 (|lambda#3| false))) (forall ((i@@8 Int) (j@@4 Int) ) (!  (=> (= (select id@0 i@@8) (select id@0 j@@4)) (= i@@8 j@@4))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (trigger 0))) (= linear_pid_available@1 ((_ map or) pids ((as const (Array Int Bool)) false)))) (=> (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel@0 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@0 (|lambda#1| 0))) (= leader@0 (|lambda#3| false))) (forall ((i@@9 Int) (j@@5 Int) ) (!  (=> (= (select id@0 i@@9) (select id@0 j@@5)) (= i@@9 j@@5))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (and (=> (= (ControlFlow 0 107313) (- 0 156512)) (and (<= 1 1) (<= 1 (+ n 1)))) (=> (and (<= 1 1) (<= 1 (+ n 1))) (and (=> (= (ControlFlow 0 107313) (- 0 156528)) (forall ((ii@@2 Int) ) (!  (=> (and (and (<= 1 ii@@2) (<= ii@@2 n)) (>= ii@@2 1)) (select pids ii@@2))
 :qid |ChangRob.271:32|
 :skolemid |19|
))) (=> (forall ((ii@@3 Int) ) (!  (=> (and (and (<= 1 ii@@3) (<= ii@@3 n)) (>= ii@@3 1)) (select pids ii@@3))
 :qid |ChangRob.271:32|
 :skolemid |19|
)) (and (=> (= (ControlFlow 0 107313) (- 0 156549)) (= PAs (|lambda#33| 1 1 0))) (=> (= PAs (|lambda#33| 1 1 0)) (=> (= (ControlFlow 0 107313) 107390) anon3_LoopHead_correct))))))))))))))
(let ((anon0_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel) (= civl_global_old_pendingAsyncs@1 pendingAsyncs)) (and (= civl_global_old_id@1 id@@0) (= civl_global_old_leader@1 leader))) (=> (and (and (and (= civl_pc@3 false) (= civl_old_PAs@0 PAs)) (and (= channel@3 channel) (= pendingAsyncs@4 pendingAsyncs))) (and (and (= id@3 id@@0) (= leader@3 leader)) (and (= PAs@2 PAs) (= (ControlFlow 0 156157) 108636)))) RefinementChecker_correct))))
(let ((anon0_correct  (=> (and (= linear_pid_available@0 ((_ map or) pids ((as const (Array Int Bool)) false))) (forall ((pa@@5 T@PA) ) (! (= (select PAs pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |65|
))) (and (and (=> (= (ControlFlow 0 107135) 107313) anon0_0_correct) (=> (= (ControlFlow 0 107135) 156161) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 107135) 156157) anon0_@2_RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (and (and (and (= pids ((as const (Array Int Bool)) true)) (= channel (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs (|lambda#1| 0))) (= leader (|lambda#3| false))) (forall ((i@@10 Int) (j@@6 Int) ) (!  (=> (= (select id@@0 i@@10) (select id@@0 j@@6)) (= i@@10 j@@6))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 156144) 107135)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun civl_pc@1 () Bool)
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun id@0 () (Array Int Int))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun civl_pc@0 () Bool)
(declare-fun civl_ok@1 () Bool)
(declare-fun pid () Int)
(declare-fun collectedPAs@0 () (Array T@PA Int))
(declare-fun collectedPAs () (Array T@PA Int))
(declare-fun civl_ok@0 () Bool)
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun linear_pid_available@2 () (Array Int Bool))
(declare-fun civl_pc@2 () Bool)
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun id@1 () (Array Int Int))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun civl_ok@2 () Bool)
(declare-fun inline$NoninterferenceChecker_main_1$0$pids@0 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun civl_global_old_channel@0 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_pendingAsyncs@0 () (Array T@PA Int))
(declare-fun civl_global_old_leader@0 () (Array Int Bool))
(declare-fun civl_global_old_id@0 () (Array Int Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@4 () (Array T@PA Int))
(declare-fun leader@2 () (Array Int Bool))
(declare-fun id@2 () (Array Int Int))
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun leader () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun civl_pc@3 () Bool)
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_channel@1 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@5 () (Array T@PA Int))
(declare-fun civl_global_old_pendingAsyncs@1 () (Array T@PA Int))
(declare-fun id@3 () (Array Int Int))
(declare-fun civl_global_old_id@1 () (Array Int Int))
(declare-fun leader@3 () (Array Int Bool))
(declare-fun civl_global_old_leader@1 () (Array Int Bool))
(declare-fun collectedPAs@1 () (Array T@PA Int))
(declare-fun civl_old_collectedPAs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun inline$RemovePendingAsyncs$0$PAs@0 () (Array T@PA Int))
(declare-fun inline$AddPendingAsyncs$0$PAs@0 () (Array T@PA Int))
(declare-fun inline$SEND$0$pid@0 () Int)
(declare-fun inline$GET_ID$0$i@1 () Int)
(push 1)
(set-info :boogie-vc-id pinit_1)
(assert (not
 (=> (= (ControlFlow 0 0) 157547) (let ((anon0_0_correct  (=> (and (and (and (= civl_pc@1  (=> (and (and (and (= channel@1 channel@0) (= pendingAsyncs@2 pendingAsyncs@0)) (= id@0 id@0)) (= leader@0 leader@0)) civl_pc@0)) (= civl_ok@1  (or (and (and (and (and (= channel@1 (store channel@0 (ite (< pid n) (+ pid 1) 1) (store (select channel@0 (ite (< pid n) (+ pid 1) 1)) (select id@0 pid) (+ (select (select channel@0 (ite (< pid n) (+ pid 1) 1)) (select id@0 pid)) 1)))) (= collectedPAs@0 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@0 collectedPAs@0) (store (|lambda#1| 0) (PInit_PA pid) 1)))) (= id@0 id@0)) (= leader@0 leader@0)) (and (= collectedPAs@0 collectedPAs) civl_ok@0)))) (and (or civl_pc@1 (and (and (<= 1 pid) (<= pid n)) (> (select pendingAsyncs@3 (PInit_PA pid)) 0))) (= linear_pid_available@2 ((as const (Array Int Bool)) false)))) (and (and (= civl_pc@2  (=> (and (and (and (= channel@2 channel@2) (= pendingAsyncs@3 pendingAsyncs@3)) (= id@1 id@1)) (= leader@1 leader@1)) civl_pc@1)) (= civl_ok@2  (or (and (and (and (and (= channel@2 (store channel@2 (ite (< pid n) (+ pid 1) 1) (store (select channel@2 (ite (< pid n) (+ pid 1) 1)) (select id@1 pid) (+ (select (select channel@2 (ite (< pid n) (+ pid 1) 1)) (select id@1 pid)) 1)))) (= collectedPAs@0 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@3 collectedPAs@0) (store (|lambda#1| 0) (PInit_PA pid) 1)))) (= id@1 id@1)) (= leader@1 leader@1)) (and (= collectedPAs@0 collectedPAs@0) civl_ok@1)))) (= (ControlFlow 0 109848) (- 0 158387)))) civl_ok@2)))
(let ((inline$NoninterferenceChecker_main_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_1$0$L0_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) inline$NoninterferenceChecker_main_1$0$pids@0 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) linear_pid_available@3 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |68|
)) (=> (and (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= civl_global_old_channel@0 (|lambda#2| (|lambda#0| 0)))) (= civl_global_old_pendingAsyncs@0 (|lambda#1| 0))) (= civl_global_old_leader@0 (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select civl_global_old_id@0 i@@3) (select civl_global_old_id@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 110158) (- 0 158663))) (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= channel@3 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@4 (|lambda#1| 0))) (= leader@2 (|lambda#3| false))) (forall ((i@@4 Int) (j@@0 Int) ) (!  (=> (= (select id@2 i@@4) (select id@2 j@@0)) (= i@@4 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))))))
(let ((inline$NoninterferenceChecker_pinit_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_1$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L0_correct true))
(let ((anon0_1$4_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel@0) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs@0) (= civl_global_old_id@0 id@0)) (and (= civl_global_old_leader@0 leader@0) (= linear_pid_available@3 linear_pid_available@1))) (and (and (= channel@3 channel@1) (= pendingAsyncs@4 pendingAsyncs@2)) (and (= id@2 id@0) (= leader@2 leader@0)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 157558) 110525) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 157558) 110529) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 157558) 110543) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 157558) 110363) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 157558) 110367) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 157558) 110158) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 157558) 110205) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs) (= civl_global_old_id@0 id@@0)) (and (= civl_global_old_leader@0 leader) (= linear_pid_available@3 linear_pid_available@0))) (and (and (= channel@3 channel) (= pendingAsyncs@4 pendingAsyncs)) (and (= id@2 id@@0) (= leader@2 leader)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 157556) 110525) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 157556) 110529) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 157556) 110543) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 157556) 110363) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 157556) 110367) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 157556) 110158) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 157556) 110205) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((RefinementChecker_correct  (and (=> (= (ControlFlow 0 110725) (- 0 158821)) (or civl_pc@3 (or (and (and (and (= channel@4 civl_global_old_channel@1) (= pendingAsyncs@5 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (and (and (and (and (= channel@4 (store civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1) (store (select civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1)) (select id@3 pid) (+ (select (select civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1)) (select id@3 pid)) 1)))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@5 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@1) (store (|lambda#1| 0) (PInit_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1))))) (=> (or civl_pc@3 (or (and (and (and (= channel@4 civl_global_old_channel@1) (= pendingAsyncs@5 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (and (and (and (and (= channel@4 (store civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1) (store (select civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1)) (select id@3 pid) (+ (select (select civl_global_old_channel@1 (ite (< pid n) (+ pid 1) 1)) (select id@3 pid)) 1)))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@5 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@1) (store (|lambda#1| 0) (PInit_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)))) (=> (= (ControlFlow 0 110725) (- 0 158934)) (=> civl_pc@3 (and (and (and (and (= channel@4 civl_global_old_channel@1) (= pendingAsyncs@5 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@3 civl_global_old_leader@1)) (= collectedPAs@1 civl_old_collectedPAs@0))))))))
(let ((anon0_1$4_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel@0) (= civl_global_old_pendingAsyncs@1 pendingAsyncs@0)) (and (= civl_global_old_id@1 id@0) (= civl_global_old_leader@1 leader@0))) (=> (and (and (and (= civl_pc@3 civl_pc@0) (= civl_old_collectedPAs@0 collectedPAs)) (and (= channel@4 channel@1) (= pendingAsyncs@5 pendingAsyncs@2))) (and (and (= id@3 id@0) (= leader@3 leader@0)) (and (= collectedPAs@1 collectedPAs@0) (= (ControlFlow 0 157554) 110725)))) RefinementChecker_correct))))
(let ((inline$RemovePendingAsyncs$0$anon0_correct  (=> (= pendingAsyncs@2 ((_ map (- (Int Int) Int)) pendingAsyncs@1 inline$RemovePendingAsyncs$0$PAs@0)) (and (and (=> (= (ControlFlow 0 109510) 109848) anon0_0_correct) (=> (= (ControlFlow 0 109510) 157558) anon0_1$4_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 109510) 157554) anon0_1$4_@2_RefinementChecker_correct)))))
(let ((inline$RemovePendingAsyncs$0$Entry_correct  (=> (and (= inline$RemovePendingAsyncs$0$PAs@0 (store (|lambda#1| 0) (PInit_PA pid) 1)) (= (ControlFlow 0 109502) 109510)) inline$RemovePendingAsyncs$0$anon0_correct)))
(let ((inline$AddPendingAsyncs$0$anon0_correct  (=> (and (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 inline$AddPendingAsyncs$0$PAs@0)) (= (ControlFlow 0 109465) 109502)) inline$RemovePendingAsyncs$0$Entry_correct)))
(let ((inline$AddPendingAsyncs$0$Entry_correct  (=> (and (= inline$AddPendingAsyncs$0$PAs@0 (store (|lambda#1| 0) (P_PA pid) 1)) (= (ControlFlow 0 109457) 109465)) inline$AddPendingAsyncs$0$anon0_correct)))
(let ((anon0_1$2_correct  (and (=> (= (ControlFlow 0 109469) (- 0 157999)) (and (<= 1 pid) (<= pid n))) (=> (and (<= 1 pid) (<= pid n)) (=> (and (= collectedPAs@0 (store collectedPAs (P_PA pid) (+ (select collectedPAs (P_PA pid)) 1))) (= (ControlFlow 0 109469) 109457)) inline$AddPendingAsyncs$0$Entry_correct)))))
(let ((inline$SEND$0$anon0_correct  (=> (and (= channel@1 (store channel@0 inline$SEND$0$pid@0 (store (select channel@0 inline$SEND$0$pid@0) inline$GET_ID$0$i@1 (+ (select (select channel@0 inline$SEND$0$pid@0) inline$GET_ID$0$i@1) 1)))) (= (ControlFlow 0 109400) 109469)) anon0_1$2_correct)))
(let ((inline$SEND$0$Entry_correct  (=> (and (= inline$SEND$0$pid@0 (ite (< pid n) (+ pid 1) 1)) (= (ControlFlow 0 109384) 109400)) inline$SEND$0$anon0_correct)))
(let ((inline$GET_ID$0$anon0_correct  (=> (and (= inline$GET_ID$0$i@1 (select id@0 pid)) (= (ControlFlow 0 109331) 109384)) inline$SEND$0$Entry_correct)))
(let ((anon0_1_correct  (=> (and (and (and (= civl_pc@0  (=> (and (and (and (= channel channel) (= pendingAsyncs pendingAsyncs)) (= id@@0 id@@0)) (= leader leader)) false)) (= civl_ok@0  (or (and (and (and (and (= channel (store channel (ite (< pid n) (+ pid 1) 1) (store (select channel (ite (< pid n) (+ pid 1) 1)) (select id@@0 pid) (+ (select (select channel (ite (< pid n) (+ pid 1) 1)) (select id@@0 pid)) 1)))) (= collectedPAs (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs collectedPAs) (store (|lambda#1| 0) (PInit_PA pid) 1)))) (= id@@0 id@@0)) (= leader leader)) (and (= collectedPAs collectedPAs) false)))) (or civl_pc@0 (and (and (<= 1 pid) (<= pid n)) (> (select pendingAsyncs@0 (PInit_PA pid)) 0)))) (and (= linear_pid_available@1 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (= (ControlFlow 0 109337) 109331))) inline$GET_ID$0$anon0_correct)))
(let ((anon0_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel) (= civl_global_old_pendingAsyncs@1 pendingAsyncs)) (and (= civl_global_old_id@1 id@@0) (= civl_global_old_leader@1 leader))) (=> (and (and (and (= civl_pc@3 false) (= civl_old_collectedPAs@0 collectedPAs)) (and (= channel@4 channel) (= pendingAsyncs@5 pendingAsyncs))) (and (and (= id@3 id@@0) (= leader@3 leader)) (and (= collectedPAs@1 collectedPAs) (= (ControlFlow 0 157552) 110725)))) RefinementChecker_correct))))
(let ((anon0_correct  (=> (and (= linear_pid_available@0 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (forall ((pa@@5 T@PA) ) (! (= (select collectedPAs pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |66|
))) (and (and (=> (= (ControlFlow 0 109108) 109337) anon0_1_correct) (=> (= (ControlFlow 0 109108) 157556) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 109108) 157552) anon0_@2_RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (<= 1 pid) (<= pid n)) (= (ControlFlow 0 157547) 109108)) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun civl_pc@1 () Bool)
(declare-fun channel@4 () (Array Int (Array Int Int)))
(declare-fun channel@0 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@3 () (Array T@PA Int))
(declare-fun pendingAsyncs@0 () (Array T@PA Int))
(declare-fun id@0 () (Array Int Int))
(declare-fun leader@2 () (Array Int Bool))
(declare-fun leader@0 () (Array Int Bool))
(declare-fun civl_pc@0 () Bool)
(declare-fun civl_ok@1 () Bool)
(declare-fun collectedPAs@1 () (Array T@PA Int))
(declare-fun pid () Int)
(declare-fun collectedPAs () (Array T@PA Int))
(declare-fun civl_ok@0 () Bool)
(declare-fun pendingAsyncs@4 () (Array T@PA Int))
(declare-fun channel@5 () (Array Int (Array Int Int)))
(declare-fun id@1 () (Array Int Int))
(declare-fun linear_pid_available@2 () (Array Int Bool))
(declare-fun civl_pc@2 () Bool)
(declare-fun leader@3 () (Array Int Bool))
(declare-fun civl_ok@2 () Bool)
(declare-fun inline$NoninterferenceChecker_main_1$0$pids@0 () (Array Int Bool))
(declare-fun linear_pid_available@3 () (Array Int Bool))
(declare-fun civl_global_old_channel@0 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_pendingAsyncs@0 () (Array T@PA Int))
(declare-fun civl_global_old_leader@0 () (Array Int Bool))
(declare-fun civl_global_old_id@0 () (Array Int Int))
(declare-fun channel@6 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@5 () (Array T@PA Int))
(declare-fun leader@4 () (Array Int Bool))
(declare-fun id@2 () (Array Int Int))
(declare-fun linear_pid_available@1 () (Array Int Bool))
(declare-fun channel () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs () (Array T@PA Int))
(declare-fun id@@0 () (Array Int Int))
(declare-fun leader () (Array Int Bool))
(declare-fun linear_pid_available@0 () (Array Int Bool))
(declare-fun civl_pc@3 () Bool)
(declare-fun channel@7 () (Array Int (Array Int Int)))
(declare-fun civl_global_old_channel@1 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@6 () (Array T@PA Int))
(declare-fun civl_global_old_pendingAsyncs@1 () (Array T@PA Int))
(declare-fun id@3 () (Array Int Int))
(declare-fun civl_global_old_id@1 () (Array Int Int))
(declare-fun leader@5 () (Array Int Bool))
(declare-fun civl_global_old_leader@1 () (Array Int Bool))
(declare-fun collectedPAs@2 () (Array T@PA Int))
(declare-fun civl_old_collectedPAs@0 () (Array T@PA Int))
(declare-fun pendingAsyncs@2 () (Array T@PA Int))
(declare-fun inline$RemovePendingAsyncs$0$PAs@0 () (Array T@PA Int))
(declare-fun channel@1 () (Array Int (Array Int Int)))
(declare-fun leader@1 () (Array Int Bool))
(declare-fun inline$RECEIVE$0$m@0 () Int)
(declare-fun inline$GET_ID$0$i@1 () Int)
(declare-fun collectedPAs@0 () (Array T@PA Int))
(declare-fun channel@3 () (Array Int (Array Int Int)))
(declare-fun pendingAsyncs@1 () (Array T@PA Int))
(declare-fun inline$AddPendingAsyncs$0$PAs@0 () (Array T@PA Int))
(declare-fun channel@2 () (Array Int (Array Int Int)))
(declare-fun inline$SEND$0$pid@0 () Int)
(push 1)
(set-info :boogie-vc-id p_1)
(assert (not
 (=> (= (ControlFlow 0 0) 158996) (let ((anon5_0_correct  (=> (and (and (and (= civl_pc@1  (=> (and (and (and (= channel@4 channel@0) (= pendingAsyncs@3 pendingAsyncs@0)) (= id@0 id@0)) (= leader@2 leader@0)) civl_pc@0)) (= civl_ok@1  (or (or (or (or (and (and (and (and (= collectedPAs@1 (|lambda#1| 0)) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@0 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel@4 channel@0)) (= id@0 id@0)) (= leader@2 leader@0)) (exists ((|msg#0| Int) ) (!  (and (and (and (and (and (and (and (trigger |msg#0|) (> (select (select channel@0 pid) |msg#0|) 0)) (= |msg#0| (select id@0 pid))) (= channel@4 (store channel@0 pid (store (select channel@0 pid) |msg#0| (- (select (select channel@0 pid) |msg#0|) 1))))) (= leader@2 (store leader@0 pid true))) (= collectedPAs@1 (|lambda#1| 0))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@0 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@0 id@0))
 :qid |unknown.0:0|
 :skolemid |71|
))) (exists ((|msg#0@@0| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@0|) (> (select (select channel@0 pid) |msg#0@@0|) 0)) (not (= |msg#0@@0| (select id@0 pid)))) (> |msg#0@@0| (select id@0 pid))) (= channel@4 (store (store channel@0 pid (store (select channel@0 pid) |msg#0@@0| (- (select (select channel@0 pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store channel@0 pid (store (select channel@0 pid) |msg#0@@0| (- (select (select channel@0 pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@0| (+ (select (select (store channel@0 pid (store (select channel@0 pid) |msg#0@@0| (- (select (select channel@0 pid) |msg#0@@0|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@0|) 1))))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@0 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@0 id@0)) (= leader@2 leader@0))
 :qid |unknown.0:0|
 :skolemid |72|
))) (exists ((|msg#0@@1| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@1|) (> (select (select channel@0 pid) |msg#0@@1|) 0)) (not (= |msg#0@@1| (select id@0 pid)))) (>= (select id@0 pid) |msg#0@@1|)) (= channel@4 (store channel@0 pid (store (select channel@0 pid) |msg#0@@1| (- (select (select channel@0 pid) |msg#0@@1|) 1))))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@0 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@0 id@0)) (= leader@2 leader@0))
 :qid |unknown.0:0|
 :skolemid |73|
))) (and (= collectedPAs@1 collectedPAs) civl_ok@0)))) (and (or civl_pc@1 (and (and (and (<= 1 pid) (<= pid n)) (> (select pendingAsyncs@4 (P_PA pid)) 0)) (forall ((m Int) ) (!  (=> (> (select (select channel@5 pid) m) 0) (<= m (select id@1 (q@max id@1))))
 :qid |ChangRob.224:18|
 :skolemid |18|
)))) (= linear_pid_available@2 ((as const (Array Int Bool)) false)))) (and (and (= civl_pc@2  (=> (and (and (and (= channel@5 channel@5) (= pendingAsyncs@4 pendingAsyncs@4)) (= id@1 id@1)) (= leader@3 leader@3)) civl_pc@1)) (= civl_ok@2  (or (or (or (or (and (and (and (and (= collectedPAs@1 (|lambda#1| 0)) (= pendingAsyncs@4 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@4 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel@5 channel@5)) (= id@1 id@1)) (= leader@3 leader@3)) (exists ((|msg#0@@2| Int) ) (!  (and (and (and (and (and (and (and (trigger |msg#0@@2|) (> (select (select channel@5 pid) |msg#0@@2|) 0)) (= |msg#0@@2| (select id@1 pid))) (= channel@5 (store channel@5 pid (store (select channel@5 pid) |msg#0@@2| (- (select (select channel@5 pid) |msg#0@@2|) 1))))) (= leader@3 (store leader@3 pid true))) (= collectedPAs@1 (|lambda#1| 0))) (= pendingAsyncs@4 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@4 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@1 id@1))
 :qid |unknown.0:0|
 :skolemid |71|
))) (exists ((|msg#0@@3| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@3|) (> (select (select channel@5 pid) |msg#0@@3|) 0)) (not (= |msg#0@@3| (select id@1 pid)))) (> |msg#0@@3| (select id@1 pid))) (= channel@5 (store (store channel@5 pid (store (select channel@5 pid) |msg#0@@3| (- (select (select channel@5 pid) |msg#0@@3|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store channel@5 pid (store (select channel@5 pid) |msg#0@@3| (- (select (select channel@5 pid) |msg#0@@3|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@3| (+ (select (select (store channel@5 pid (store (select channel@5 pid) |msg#0@@3| (- (select (select channel@5 pid) |msg#0@@3|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@3|) 1))))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@4 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@4 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@1 id@1)) (= leader@3 leader@3))
 :qid |unknown.0:0|
 :skolemid |72|
))) (exists ((|msg#0@@4| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@4|) (> (select (select channel@5 pid) |msg#0@@4|) 0)) (not (= |msg#0@@4| (select id@1 pid)))) (>= (select id@1 pid) |msg#0@@4|)) (= channel@5 (store channel@5 pid (store (select channel@5 pid) |msg#0@@4| (- (select (select channel@5 pid) |msg#0@@4|) 1))))) (= collectedPAs@1 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@4 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs@4 collectedPAs@1) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@1 id@1)) (= leader@3 leader@3))
 :qid |unknown.0:0|
 :skolemid |73|
))) (and (= collectedPAs@1 collectedPAs@1) civl_ok@1)))) (= (ControlFlow 0 113348) (- 0 161240)))) civl_ok@2)))
(let ((inline$NoninterferenceChecker_main_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_main_1$0$L0_correct  (=> (exists ((partition_pid (Array Int Int)) ) (!  (and (= ((_ map =>) inline$NoninterferenceChecker_main_1$0$pids@0 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)) (= ((_ map =>) linear_pid_available@3 ((_ map (= (Int Int) Bool)) partition_pid ((as const (Array Int Int)) 1))) ((as const (Array Int Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |68|
)) (=> (and (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= civl_global_old_channel@0 (|lambda#2| (|lambda#0| 0)))) (= civl_global_old_pendingAsyncs@0 (|lambda#1| 0))) (= civl_global_old_leader@0 (|lambda#3| false))) (forall ((i@@3 Int) (j Int) ) (!  (=> (= (select civl_global_old_id@0 i@@3) (select civl_global_old_id@0 j)) (= i@@3 j))
 :qid |ChangRob.67:11|
 :skolemid |3|
))) (= (ControlFlow 0 113776) (- 0 161516))) (and (and (and (and (= inline$NoninterferenceChecker_main_1$0$pids@0 ((as const (Array Int Bool)) true)) (= channel@6 (|lambda#2| (|lambda#0| 0)))) (= pendingAsyncs@5 (|lambda#1| 0))) (= leader@4 (|lambda#3| false))) (forall ((i@@4 Int) (j@@0 Int) ) (!  (=> (= (select id@2 i@@4) (select id@2 j@@0)) (= i@@4 j@@0))
 :qid |ChangRob.67:11|
 :skolemid |3|
)))))))
(let ((inline$NoninterferenceChecker_pinit_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_pinit_1$0$L0_correct true))
(let ((NoninterferenceChecker$1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L1_correct true))
(let ((inline$NoninterferenceChecker_p_1$0$L0_correct true))
(let ((anon5$1_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel@0) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs@0) (= civl_global_old_id@0 id@0)) (and (= civl_global_old_leader@0 leader@0) (= linear_pid_available@3 linear_pid_available@1))) (and (and (= pendingAsyncs@5 pendingAsyncs@3) (= channel@6 channel@4)) (and (= id@2 id@0) (= leader@4 leader@2)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 159007) 114143) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 159007) 114147) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 159007) 114161) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 159007) 113981) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 159007) 113985) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 159007) 113776) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 159007) 113823) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((anon0_@2_NoninterferenceChecker_correct  (=> (= civl_global_old_channel@0 channel) (=> (and (and (and (= civl_global_old_pendingAsyncs@0 pendingAsyncs) (= civl_global_old_id@0 id@@0)) (and (= civl_global_old_leader@0 leader) (= linear_pid_available@3 linear_pid_available@0))) (and (and (= pendingAsyncs@5 pendingAsyncs) (= channel@6 channel)) (and (= id@2 id@@0) (= leader@4 leader)))) (and (and (and (and (and (and (=> (= (ControlFlow 0 159005) 114143) inline$NoninterferenceChecker_p_1$0$L0_correct) (=> (= (ControlFlow 0 159005) 114147) inline$NoninterferenceChecker_p_1$0$L1_correct)) (=> (= (ControlFlow 0 159005) 114161) NoninterferenceChecker$1_correct)) (=> (= (ControlFlow 0 159005) 113981) inline$NoninterferenceChecker_pinit_1$0$L0_correct)) (=> (= (ControlFlow 0 159005) 113985) inline$NoninterferenceChecker_pinit_1$0$L1_correct)) (=> (= (ControlFlow 0 159005) 113776) inline$NoninterferenceChecker_main_1$0$L0_correct)) (=> (= (ControlFlow 0 159005) 113823) inline$NoninterferenceChecker_main_1$0$L1_correct))))))
(let ((RefinementChecker_correct  (and (=> (= (ControlFlow 0 114780) (- 0 161674)) (or civl_pc@3 (or (and (and (and (= channel@7 civl_global_old_channel@1) (= pendingAsyncs@6 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1)) (or (or (or (and (and (and (and (= collectedPAs@2 (|lambda#1| 0)) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel@7 civl_global_old_channel@1)) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1)) (exists ((|msg#0@@5| Int) ) (!  (and (and (and (and (and (and (and (trigger |msg#0@@5|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@5|) 0)) (= |msg#0@@5| (select id@3 pid))) (= channel@7 (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@5| (- (select (select civl_global_old_channel@1 pid) |msg#0@@5|) 1))))) (= leader@5 (store civl_global_old_leader@1 pid true))) (= collectedPAs@2 (|lambda#1| 0))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1))
 :qid |unknown.0:0|
 :skolemid |71|
))) (exists ((|msg#0@@6| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@6|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@6|) 0)) (not (= |msg#0@@6| (select id@3 pid)))) (> |msg#0@@6| (select id@3 pid))) (= channel@7 (store (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@6| (- (select (select civl_global_old_channel@1 pid) |msg#0@@6|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@6| (- (select (select civl_global_old_channel@1 pid) |msg#0@@6|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@6| (+ (select (select (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@6| (- (select (select civl_global_old_channel@1 pid) |msg#0@@6|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@6|) 1))))) (= collectedPAs@2 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1))
 :qid |unknown.0:0|
 :skolemid |72|
))) (exists ((|msg#0@@7| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@7|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@7|) 0)) (not (= |msg#0@@7| (select id@3 pid)))) (>= (select id@3 pid) |msg#0@@7|)) (= channel@7 (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@7| (- (select (select civl_global_old_channel@1 pid) |msg#0@@7|) 1))))) (= collectedPAs@2 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1))
 :qid |unknown.0:0|
 :skolemid |73|
)))))) (=> (or civl_pc@3 (or (and (and (and (= channel@7 civl_global_old_channel@1) (= pendingAsyncs@6 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1)) (or (or (or (and (and (and (and (= collectedPAs@2 (|lambda#1| 0)) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel@7 civl_global_old_channel@1)) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1)) (exists ((|msg#0@@8| Int) ) (!  (and (and (and (and (and (and (and (trigger |msg#0@@8|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@8|) 0)) (= |msg#0@@8| (select id@3 pid))) (= channel@7 (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@8| (- (select (select civl_global_old_channel@1 pid) |msg#0@@8|) 1))))) (= leader@5 (store civl_global_old_leader@1 pid true))) (= collectedPAs@2 (|lambda#1| 0))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1))
 :qid |unknown.0:0|
 :skolemid |71|
))) (exists ((|msg#0@@9| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@9|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@9|) 0)) (not (= |msg#0@@9| (select id@3 pid)))) (> |msg#0@@9| (select id@3 pid))) (= channel@7 (store (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@9| (- (select (select civl_global_old_channel@1 pid) |msg#0@@9|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@9| (- (select (select civl_global_old_channel@1 pid) |msg#0@@9|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@9| (+ (select (select (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@9| (- (select (select civl_global_old_channel@1 pid) |msg#0@@9|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@9|) 1))))) (= collectedPAs@2 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1))
 :qid |unknown.0:0|
 :skolemid |72|
))) (exists ((|msg#0@@10| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@10|) (> (select (select civl_global_old_channel@1 pid) |msg#0@@10|) 0)) (not (= |msg#0@@10| (select id@3 pid)))) (>= (select id@3 pid) |msg#0@@10|)) (= channel@7 (store civl_global_old_channel@1 pid (store (select civl_global_old_channel@1 pid) |msg#0@@10| (- (select (select civl_global_old_channel@1 pid) |msg#0@@10|) 1))))) (= collectedPAs@2 (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs@6 ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) civl_global_old_pendingAsyncs@1 collectedPAs@2) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1))
 :qid |unknown.0:0|
 :skolemid |73|
))))) (=> (= (ControlFlow 0 114780) (- 0 162178)) (=> civl_pc@3 (and (and (and (and (= channel@7 civl_global_old_channel@1) (= pendingAsyncs@6 civl_global_old_pendingAsyncs@1)) (= id@3 civl_global_old_id@1)) (= leader@5 civl_global_old_leader@1)) (= collectedPAs@2 civl_old_collectedPAs@0))))))))
(let ((anon5$1_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel@0) (= civl_global_old_pendingAsyncs@1 pendingAsyncs@0)) (and (= civl_global_old_id@1 id@0) (= civl_global_old_leader@1 leader@0))) (=> (and (and (and (= civl_pc@3 civl_pc@0) (= civl_old_collectedPAs@0 collectedPAs)) (and (= pendingAsyncs@6 pendingAsyncs@3) (= channel@7 channel@4))) (and (and (= id@3 id@0) (= collectedPAs@2 collectedPAs@1)) (and (= leader@5 leader@2) (= (ControlFlow 0 159003) 114780)))) RefinementChecker_correct))))
(let ((inline$RemovePendingAsyncs$0$anon0_correct  (=> (= pendingAsyncs@3 ((_ map (- (Int Int) Int)) pendingAsyncs@2 inline$RemovePendingAsyncs$0$PAs@0)) (and (and (=> (= (ControlFlow 0 112103) 113348) anon5_0_correct) (=> (= (ControlFlow 0 112103) 159007) anon5$1_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 112103) 159003) anon5$1_@2_RefinementChecker_correct)))))
(let ((inline$RemovePendingAsyncs$0$Entry_correct  (=> (and (= inline$RemovePendingAsyncs$0$PAs@0 (store (|lambda#1| 0) (P_PA pid) 1)) (= (ControlFlow 0 112095) 112103)) inline$RemovePendingAsyncs$0$anon0_correct)))
(let ((anon6_Then$1_correct  (=> (= collectedPAs@1 collectedPAs) (=> (and (and (= channel@4 channel@1) (= pendingAsyncs@2 pendingAsyncs@0)) (and (= leader@2 leader@1) (= (ControlFlow 0 113466) 112095))) inline$RemovePendingAsyncs$0$Entry_correct))))
(let ((inline$SET_LEADER$0$anon0_correct  (=> (and (= leader@1 (store leader@0 pid true)) (= (ControlFlow 0 113460) 113466)) anon6_Then$1_correct)))
(let ((anon6_Then_correct  (=> (and (= inline$RECEIVE$0$m@0 inline$GET_ID$0$i@1) (= (ControlFlow 0 113464) 113460)) inline$SET_LEADER$0$anon0_correct)))
(let ((anon4$1_correct  (=> (= collectedPAs@1 collectedPAs@0) (=> (and (and (= channel@4 channel@3) (= pendingAsyncs@2 pendingAsyncs@1)) (and (= leader@2 leader@0) (= (ControlFlow 0 112062) 112095))) inline$RemovePendingAsyncs$0$Entry_correct))))
(let ((inline$AddPendingAsyncs$0$anon0_correct  (=> (and (= pendingAsyncs@1 ((_ map (+ (Int Int) Int)) pendingAsyncs@0 inline$AddPendingAsyncs$0$PAs@0)) (= (ControlFlow 0 112056) 112062)) anon4$1_correct)))
(let ((inline$AddPendingAsyncs$0$Entry_correct  (=> (and (= inline$AddPendingAsyncs$0$PAs@0 (store (|lambda#1| 0) (P_PA pid) 1)) (= (ControlFlow 0 112048) 112056)) inline$AddPendingAsyncs$0$anon0_correct)))
(let ((anon4_correct  (and (=> (= (ControlFlow 0 112060) (- 0 159985)) (and (<= 1 pid) (<= pid n))) (=> (and (<= 1 pid) (<= pid n)) (=> (and (= collectedPAs@0 (store collectedPAs (P_PA pid) (+ (select collectedPAs (P_PA pid)) 1))) (= (ControlFlow 0 112060) 112048)) inline$AddPendingAsyncs$0$Entry_correct)))))
(let ((anon7_Then$1_correct  (=> (and (= channel@3 channel@2) (= (ControlFlow 0 113423) 112060)) anon4_correct)))
(let ((inline$SEND$0$anon0_correct  (=> (and (= channel@2 (store channel@1 inline$SEND$0$pid@0 (store (select channel@1 inline$SEND$0$pid@0) inline$RECEIVE$0$m@0 (+ (select (select channel@1 inline$SEND$0$pid@0) inline$RECEIVE$0$m@0) 1)))) (= (ControlFlow 0 113417) 113423)) anon7_Then$1_correct)))
(let ((inline$SEND$0$Entry_correct  (=> (and (= inline$SEND$0$pid@0 (ite (< pid n) (+ pid 1) 1)) (= (ControlFlow 0 113401) 113417)) inline$SEND$0$anon0_correct)))
(let ((anon7_Then_correct  (=> (and (> inline$RECEIVE$0$m@0 inline$GET_ID$0$i@1) (= (ControlFlow 0 113421) 113401)) inline$SEND$0$Entry_correct)))
(let ((anon7_Else_correct  (=> (>= inline$GET_ID$0$i@1 inline$RECEIVE$0$m@0) (=> (and (= channel@3 channel@1) (= (ControlFlow 0 111995) 112060)) anon4_correct))))
(let ((anon6_Else_correct  (=> (not (= inline$RECEIVE$0$m@0 inline$GET_ID$0$i@1)) (and (=> (= (ControlFlow 0 111987) 113421) anon7_Then_correct) (=> (= (ControlFlow 0 111987) 111995) anon7_Else_correct)))))
(let ((inline$RECEIVE$0$anon0_correct  (=> (and (> (select (select channel@0 pid) inline$RECEIVE$0$m@0) 0) (= channel@1 (store channel@0 pid (store (select channel@0 pid) inline$RECEIVE$0$m@0 (- (select (select channel@0 pid) inline$RECEIVE$0$m@0) 1))))) (and (=> (= (ControlFlow 0 111971) 113464) anon6_Then_correct) (=> (= (ControlFlow 0 111971) 111987) anon6_Else_correct)))))
(let ((inline$GET_ID$0$anon0_correct  (=> (and (= inline$GET_ID$0$i@1 (select id@0 pid)) (= (ControlFlow 0 111878) 111971)) inline$RECEIVE$0$anon0_correct)))
(let ((anon0_0_correct  (=> (and (and (and (= civl_pc@0  (=> (and (and (and (= channel channel) (= pendingAsyncs pendingAsyncs)) (= id@@0 id@@0)) (= leader leader)) false)) (= civl_ok@0  (or (or (or (or (and (and (and (and (= collectedPAs (|lambda#1| 0)) (= pendingAsyncs ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs collectedPAs) (store (|lambda#1| 0) (P_PA pid) 1)))) (= channel channel)) (= id@@0 id@@0)) (= leader leader)) (exists ((|msg#0@@11| Int) ) (!  (and (and (and (and (and (and (and (trigger |msg#0@@11|) (> (select (select channel pid) |msg#0@@11|) 0)) (= |msg#0@@11| (select id@@0 pid))) (= channel (store channel pid (store (select channel pid) |msg#0@@11| (- (select (select channel pid) |msg#0@@11|) 1))))) (= leader (store leader pid true))) (= collectedPAs (|lambda#1| 0))) (= pendingAsyncs ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs collectedPAs) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@@0 id@@0))
 :qid |unknown.0:0|
 :skolemid |71|
))) (exists ((|msg#0@@12| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@12|) (> (select (select channel pid) |msg#0@@12|) 0)) (not (= |msg#0@@12| (select id@@0 pid)))) (> |msg#0@@12| (select id@@0 pid))) (= channel (store (store channel pid (store (select channel pid) |msg#0@@12| (- (select (select channel pid) |msg#0@@12|) 1))) (ite (< pid n) (+ pid 1) 1) (store (select (store channel pid (store (select channel pid) |msg#0@@12| (- (select (select channel pid) |msg#0@@12|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@12| (+ (select (select (store channel pid (store (select channel pid) |msg#0@@12| (- (select (select channel pid) |msg#0@@12|) 1))) (ite (< pid n) (+ pid 1) 1)) |msg#0@@12|) 1))))) (= collectedPAs (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs collectedPAs) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@@0 id@@0)) (= leader leader))
 :qid |unknown.0:0|
 :skolemid |72|
))) (exists ((|msg#0@@13| Int) ) (!  (and (and (and (and (and (and (and (and (trigger |msg#0@@13|) (> (select (select channel pid) |msg#0@@13|) 0)) (not (= |msg#0@@13| (select id@@0 pid)))) (>= (select id@@0 pid) |msg#0@@13|)) (= channel (store channel pid (store (select channel pid) |msg#0@@13| (- (select (select channel pid) |msg#0@@13|) 1))))) (= collectedPAs (store (|lambda#1| 0) (P_PA pid) 1))) (= pendingAsyncs ((_ map (- (Int Int) Int)) ((_ map (+ (Int Int) Int)) pendingAsyncs collectedPAs) (store (|lambda#1| 0) (P_PA pid) 1)))) (= id@@0 id@@0)) (= leader leader))
 :qid |unknown.0:0|
 :skolemid |73|
))) (and (= collectedPAs collectedPAs) false)))) (or civl_pc@0 (and (and (and (<= 1 pid) (<= pid n)) (> (select pendingAsyncs@0 (P_PA pid)) 0)) (forall ((m@@0 Int) ) (!  (=> (> (select (select channel@0 pid) m@@0) 0) (<= m@@0 (select id@0 (q@max id@0))))
 :qid |ChangRob.224:18|
 :skolemid |18|
))))) (and (= linear_pid_available@1 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (= (ControlFlow 0 111884) 111878))) inline$GET_ID$0$anon0_correct)))
(let ((anon0_@2_RefinementChecker_correct  (=> (and (and (= civl_global_old_channel@1 channel) (= civl_global_old_pendingAsyncs@1 pendingAsyncs)) (and (= civl_global_old_id@1 id@@0) (= civl_global_old_leader@1 leader))) (=> (and (and (and (= civl_pc@3 false) (= civl_old_collectedPAs@0 collectedPAs)) (and (= pendingAsyncs@6 pendingAsyncs) (= channel@7 channel))) (and (and (= id@3 id@@0) (= collectedPAs@2 collectedPAs)) (and (= leader@5 leader) (= (ControlFlow 0 159001) 114780)))) RefinementChecker_correct))))
(let ((anon0_correct  (=> (and (= linear_pid_available@0 ((_ map or) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Bool)) false))) (forall ((pa@@5 T@PA) ) (! (= (select collectedPAs pa@@5) 0)
 :qid |unknown.0:0|
 :skolemid |67|
))) (and (and (=> (= (ControlFlow 0 111185) 111884) anon0_0_correct) (=> (= (ControlFlow 0 111185) 159005) anon0_@2_NoninterferenceChecker_correct)) (=> (= (ControlFlow 0 111185) 159001) anon0_@2_RefinementChecker_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (and (and (<= 1 pid) (<= pid n)) (= (ControlFlow 0 158996) 111185)) anon0_correct)))
PreconditionGeneratedEntry_correct))))))))))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun pid () Int)
(declare-fun inline$GET_ID$0$i@1 () Int)
(declare-fun id@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id LinearityChecker_GET_ID)
(assert (not
 (=> (= (ControlFlow 0 0) 162224) (let ((inline$GET_ID$0$Return_correct  (=> (= (ControlFlow 0 115582) (- 0 162286)) (= ((_ map (<= (Int Int) Int)) ((_ map (ite (Bool Int Int) Int)) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0)) ((_ map (ite (Bool Int Int) Int)) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)))))
(let ((inline$GET_ID$0$anon0_correct  (=> (and (= inline$GET_ID$0$i@1 (select id@@0 pid)) (= (ControlFlow 0 115574) 115582)) inline$GET_ID$0$Return_correct)))
(let ((inline$GET_ID$0$Entry_correct  (=> (= (ControlFlow 0 162224) 115574) inline$GET_ID$0$anon0_correct)))
inline$GET_ID$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun pid () Int)
(declare-fun leader@0 () (Array Int Bool))
(declare-fun leader () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id LinearityChecker_SET_LEADER)
(assert (not
 (=> (= (ControlFlow 0 0) 162326) (let ((inline$SET_LEADER$0$Return_correct  (=> (= (ControlFlow 0 115620) (- 0 162390)) (= ((_ map (<= (Int Int) Int)) ((_ map (ite (Bool Int Int) Int)) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0)) ((_ map (ite (Bool Int Int) Int)) (store ((as const (Array Int Bool)) false) pid true) ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)))))
(let ((inline$SET_LEADER$0$anon0_correct  (=> (and (= leader@0 (store leader pid true)) (= (ControlFlow 0 115614) 115620)) inline$SET_LEADER$0$Return_correct)))
(let ((inline$SET_LEADER$0$Entry_correct  (=> (= (ControlFlow 0 162326) 115614) inline$SET_LEADER$0$anon0_correct)))
inline$SET_LEADER$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid
(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.mbqi false)
(set-option :model.compact false)
(set-option :model.v2 true)
(set-option :pp.bv_literals false)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes ((T@PA 0)) (((P_PA (|pid#P_PA| Int) ) (PInit_PA (|pid#PInit_PA| Int) ) ) ))
(declare-fun n () Int)
(declare-fun q@max ((Array Int Int)) Int)
(declare-fun trigger (Int) Bool)
(declare-fun |lambda#0| (Int) (Array Int Int))
(declare-fun |lambda#1| (Int) (Array T@PA Int))
(declare-fun |lambda#2| ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun |lambda#3| (Bool) (Array Int Bool))
(declare-fun |lambda#4| (Bool Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#5| (Int Int) (Array T@PA Int))
(declare-fun |lambda#6| (Int Int Int Int Int Int Int) (Array T@PA Int))
(declare-fun |lambda#7| (Int Int) (Array T@PA Int))
(declare-fun |lambda#33| (Int Int Int) (Array T@PA Int))
(assert (>= n 1))
(assert (forall ((id (Array Int Int)) ) (!  (and (and (<= 1 (q@max id)) (<= (q@max id) n)) (forall ((i Int) ) (!  (=> (and (and (<= 1 i) (<= i n)) (not (= i (q@max id)))) (< (select id i) (select id (q@max id))))
 :qid |ChangRob.44:54|
 :skolemid |0|
)))
 :qid |ChangRob.44:15|
 :skolemid |1|
)))
(assert (forall ((x Int) ) (! (= (trigger x) true)
 :qid |ChangRob.52:18|
 :skolemid |2|
 :pattern ( (trigger x))
)))
(assert (forall ((i@@0 Int) (|l#0| Int) ) (! (= (select (|lambda#0| |l#0|) i@@0) |l#0|)
 :qid |ChangRob.54:56|
 :skolemid |97|
 :pattern ( (select (|lambda#0| |l#0|) i@@0))
)))
(assert (forall ((pa T@PA) (|l#0@@0| Int) ) (! (= (select (|lambda#1| |l#0@@0|) pa) |l#0@@0|)
 :qid |ChangRob.55:48|
 :skolemid |98|
 :pattern ( (select (|lambda#1| |l#0@@0|) pa))
)))
(assert (forall ((i@@1 Int) (|l#0@@1| (Array Int Int)) ) (! (= (select (|lambda#2| |l#0@@1|) i@@1) |l#0@@1|)
 :qid |ChangRob.64:22|
 :skolemid |99|
 :pattern ( (select (|lambda#2| |l#0@@1|) i@@1))
)))
(assert (forall ((i@@2 Int) (|l#0@@2| Bool) ) (! (= (select (|lambda#3| |l#0@@2|) i@@2) |l#0@@2|)
 :qid |ChangRob.66:21|
 :skolemid |100|
 :pattern ( (select (|lambda#3| |l#0@@2|) i@@2))
)))
(assert (forall ((pa@@0 T@PA) (|l#0@@3| Bool) (|l#1| Int) (|l#2| Int) (|l#3| Int) (|l#4| Int) ) (! (= (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0) (ite  (and (and (and (is-P_PA pa@@0) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) |l#0@@3|) (not (and (and (and (and (<= 1 |l#1|) (<= |l#1| n)) (and (<= 1 (|pid#P_PA| pa@@0)) (<= (|pid#P_PA| pa@@0) n))) (and (<= 1 |l#2|) (<= |l#2| n))) (or (or (or (and (< |l#1| (|pid#P_PA| pa@@0)) (< (|pid#P_PA| pa@@0) |l#2|)) (and (< |l#2| |l#1|) (< |l#1| (|pid#P_PA| pa@@0)))) (and (< (|pid#P_PA| pa@@0) |l#2|) (< |l#2| |l#1|))) (and (= |l#1| |l#2|) (not (= |l#1| (|pid#P_PA| pa@@0)))))))) |l#3| |l#4|))
 :qid |ChangRob.94:20|
 :skolemid |101|
 :pattern ( (select (|lambda#4| |l#0@@3| |l#1| |l#2| |l#3| |l#4|) pa@@0))
)))
(assert (forall ((pa@@1 T@PA) (|l#0@@4| Int) (|l#1@@0| Int) ) (! (= (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1) (ite  (and (is-P_PA pa@@1) (and (<= 1 (|pid#P_PA| pa@@1)) (<= (|pid#P_PA| pa@@1) n))) |l#0@@4| |l#1@@0|))
 :qid |ChangRob.161:18|
 :skolemid |102|
 :pattern ( (select (|lambda#5| |l#0@@4| |l#1@@0|) pa@@1))
)))
(assert (forall ((pa@@2 T@PA) (|l#0@@5| Int) (|l#1@@1| Int) (|l#2@@0| Int) (|l#3@@0| Int) (|l#4@@0| Int) (|l#5| Int) (|l#6| Int) ) (! (= (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2) (ite  (and (and (is-PInit_PA pa@@2) (< |l#0@@5| (|pid#PInit_PA| pa@@2))) (<= (|pid#PInit_PA| pa@@2) |l#1@@1|)) |l#2@@0| (ite  (and (and (is-P_PA pa@@2) (<= |l#3@@0| (|pid#P_PA| pa@@2))) (<= (|pid#P_PA| pa@@2) |l#4@@0|)) |l#5| |l#6|)))
 :qid |ChangRob.179:20|
 :skolemid |103|
 :pattern ( (select (|lambda#6| |l#0@@5| |l#1@@1| |l#2@@0| |l#3@@0| |l#4@@0| |l#5| |l#6|) pa@@2))
)))
(assert (forall ((pa@@3 T@PA) (|l#0@@6| Int) (|l#1@@2| Int) ) (! (= (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3) (ite  (and (is-PInit_PA pa@@3) (and (<= 1 (|pid#PInit_PA| pa@@3)) (<= (|pid#PInit_PA| pa@@3) n))) |l#0@@6| |l#1@@2|))
 :qid |ChangRob.198:18|
 :skolemid |104|
 :pattern ( (select (|lambda#7| |l#0@@6| |l#1@@2|) pa@@3))
)))
(assert (forall ((pa@@4 T@PA) (|l#0@@7| Int) (|l#1@@3| Int) (|l#2@@1| Int) ) (! (= (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4) (ite  (and (and (is-PInit_PA pa@@4) (and (<= 1 (|pid#PInit_PA| pa@@4)) (<= (|pid#PInit_PA| pa@@4) n))) (< (|pid#PInit_PA| pa@@4) |l#0@@7|)) |l#1@@3| |l#2@@1|))
 :qid |ChangRob.272:39|
 :skolemid |105|
 :pattern ( (select (|lambda#33| |l#0@@7| |l#1@@3| |l#2@@1|) pa@@4))
)))
; Valid

(declare-fun ControlFlow (Int Int) Int)
(declare-fun i@@3 () Int)
(declare-fun |inline$LINEAR_TRANSFER$0$pids'@1| () (Array Int Bool))
(declare-fun pids () (Array Int Bool))
(push 1)
(set-info :boogie-vc-id LinearityChecker_LINEAR_TRANSFER)
(assert (not
 (=> (= (ControlFlow 0 0) 162433) (let ((inline$LINEAR_TRANSFER$0$Return_correct  (=> (= (ControlFlow 0 115690) (- 0 162537)) (= ((_ map (<= (Int Int) Int)) ((_ map (+ (Int Int) Int)) ((_ map (ite (Bool Int Int) Int)) (store ((as const (Array Int Bool)) false) i@@3 true) ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0)) ((_ map (ite (Bool Int Int) Int)) |inline$LINEAR_TRANSFER$0$pids'@1| ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0))) ((_ map (ite (Bool Int Int) Int)) pids ((as const (Array Int Int)) 1) ((as const (Array Int Int)) 0))) ((as const (Array Int Bool)) true)))))
(let ((inline$LINEAR_TRANSFER$0$anon0_correct  (=> (and (= |inline$LINEAR_TRANSFER$0$pids'@1| (store pids i@@3 false)) (= (ControlFlow 0 115680) 115690)) inline$LINEAR_TRANSFER$0$Return_correct)))
(let ((inline$LINEAR_TRANSFER$0$Entry_correct  (=> (and (select pids i@@3) (= (ControlFlow 0 162433) 115680)) inline$LINEAR_TRANSFER$0$anon0_correct)))
inline$LINEAR_TRANSFER$0$Entry_correct))))
))
(check-sat)
(pop 1)
; Valid