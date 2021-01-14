(set-option:fp.xform.slice false)
(set-option:fp.xform.inline_linear false)
(set-option:fp.xform.inline_eager false)
(declare-var match_str String)
(declare-var l_in (Array Int Int))
(declare-var ind_in Int)
(declare-var l_out1 (Array Int Int))
(declare-var ind_out1 Int)
(declare-var l_out2 (Array Int Int))
(declare-var ind_out2 Int)
(declare-var n1 Int)
(declare-var n2 Int)
(declare-var m_0_0_1 Bool)
(declare-var m_0_1_1 Bool)
(declare-var m_1_1_1 Bool)
(declare-var m_0_2_1 Bool)
(declare-var m_1_2_1 Bool)
(declare-var m_2_2_1 Bool)
(declare-var m_0_3_1 Bool)
(declare-var m_1_3_1 Bool)
(declare-var m_2_3_1 Bool)
(declare-var m_3_3_1 Bool)
(declare-var m_0_0_2 Bool)
(declare-var m_0_1_2 Bool)
(declare-var m_1_1_2 Bool)
(declare-var m_0_2_2 Bool)
(declare-var m_1_2_2 Bool)
(declare-var m_2_2_2 Bool)
(declare-var m_0_3_2 Bool)
(declare-var m_1_3_2 Bool)
(declare-var m_2_3_2 Bool)
(declare-var m_3_3_2 Bool)
(declare-var b_0_0_0 Bool)
(declare-var b_0_0_1 Bool)
(declare-var b_0_1_1 Bool)
(declare-var b_0_0_2 Bool)
(declare-var b_0_1_2 Bool)
(declare-var b_0_2_2 Bool)
(declare-var b_0_0_3 Bool)
(declare-var b_0_1_3 Bool)
(declare-var b_0_2_3 Bool)
(declare-var b_0_3_3 Bool)
(declare-var b_1_0_0 Bool)
(declare-var b_1_0_1 Bool)
(declare-var b_1_1_1 Bool)
(declare-var b_1_0_2 Bool)
(declare-var b_1_1_2 Bool)
(declare-var b_1_2_2 Bool)
(declare-var b_1_0_3 Bool)
(declare-var b_1_1_3 Bool)
(declare-var b_1_2_3 Bool)
(declare-var b_1_3_3 Bool)
(declare-var b_2_0_0 Bool)
(declare-var b_2_0_1 Bool)
(declare-var b_2_1_1 Bool)
(declare-var b_2_0_2 Bool)
(declare-var b_2_1_2 Bool)
(declare-var b_2_2_2 Bool)
(declare-var b_2_0_3 Bool)
(declare-var b_2_1_3 Bool)
(declare-var b_2_2_3 Bool)
(declare-var b_2_3_3 Bool)
(declare-var b_3_0_0 Bool)
(declare-var b_3_0_1 Bool)
(declare-var b_3_1_1 Bool)
(declare-var b_3_0_2 Bool)
(declare-var b_3_1_2 Bool)
(declare-var b_3_2_2 Bool)
(declare-var b_3_0_3 Bool)
(declare-var b_3_1_3 Bool)
(declare-var b_3_2_3 Bool)
(declare-var b_3_3_3 Bool)
(declare-var b_4_0_0 Bool)
(declare-var b_4_0_1 Bool)
(declare-var b_4_1_1 Bool)
(declare-var b_4_0_2 Bool)
(declare-var b_4_1_2 Bool)
(declare-var b_4_2_2 Bool)
(declare-var b_4_0_3 Bool)
(declare-var b_4_1_3 Bool)
(declare-var b_4_2_3 Bool)
(declare-var b_4_3_3 Bool)
(declare-var b_5_0_0 Bool)
(declare-var b_5_0_1 Bool)
(declare-var b_5_1_1 Bool)
(declare-var b_5_0_2 Bool)
(declare-var b_5_1_2 Bool)
(declare-var b_5_2_2 Bool)
(declare-var b_5_0_3 Bool)
(declare-var b_5_1_3 Bool)
(declare-var b_5_2_3 Bool)
(declare-var b_5_3_3 Bool)
(declare-var b_6_0_0 Bool)
(declare-var b_6_0_1 Bool)
(declare-var b_6_1_1 Bool)
(declare-var b_6_0_2 Bool)
(declare-var b_6_1_2 Bool)
(declare-var b_6_2_2 Bool)
(declare-var b_6_0_3 Bool)
(declare-var b_6_1_3 Bool)
(declare-var b_6_2_3 Bool)
(declare-var b_6_3_3 Bool)
(declare-var b_7_0_0 Bool)
(declare-var b_7_0_1 Bool)
(declare-var b_7_1_1 Bool)
(declare-var b_7_0_2 Bool)
(declare-var b_7_1_2 Bool)
(declare-var b_7_2_2 Bool)
(declare-var b_7_0_3 Bool)
(declare-var b_7_1_3 Bool)
(declare-var b_7_2_3 Bool)
(declare-var b_7_3_3 Bool)
(declare-var b_8_0_0 Bool)
(declare-var b_8_0_1 Bool)
(declare-var b_8_1_1 Bool)
(declare-var b_8_0_2 Bool)
(declare-var b_8_1_2 Bool)
(declare-var b_8_2_2 Bool)
(declare-var b_8_0_3 Bool)
(declare-var b_8_1_3 Bool)
(declare-var b_8_2_3 Bool)
(declare-var b_8_3_3 Bool)
(declare-var b_9_0_0 Bool)
(declare-var b_9_0_1 Bool)
(declare-var b_9_1_1 Bool)
(declare-var b_9_0_2 Bool)
(declare-var b_9_1_2 Bool)
(declare-var b_9_2_2 Bool)
(declare-var b_9_0_3 Bool)
(declare-var b_9_1_3 Bool)
(declare-var b_9_2_3 Bool)
(declare-var b_9_3_3 Bool)
(declare-var b_10_0_0 Bool)
(declare-var b_10_0_1 Bool)
(declare-var b_10_1_1 Bool)
(declare-var b_10_0_2 Bool)
(declare-var b_10_1_2 Bool)
(declare-var b_10_2_2 Bool)
(declare-var b_10_0_3 Bool)
(declare-var b_10_1_3 Bool)
(declare-var b_10_2_3 Bool)
(declare-var b_10_3_3 Bool)
(declare-var b_11_0_0 Bool)
(declare-var b_11_0_1 Bool)
(declare-var b_11_1_1 Bool)
(declare-var b_11_0_2 Bool)
(declare-var b_11_1_2 Bool)
(declare-var b_11_2_2 Bool)
(declare-var b_11_0_3 Bool)
(declare-var b_11_1_3 Bool)
(declare-var b_11_2_3 Bool)
(declare-var b_11_3_3 Bool)
(declare-var b_12_0_0 Bool)
(declare-var b_12_0_1 Bool)
(declare-var b_12_1_1 Bool)
(declare-var b_12_0_2 Bool)
(declare-var b_12_1_2 Bool)
(declare-var b_12_2_2 Bool)
(declare-var b_12_0_3 Bool)
(declare-var b_12_1_3 Bool)
(declare-var b_12_2_3 Bool)
(declare-var b_12_3_3 Bool)
(declare-var b_13_0_0 Bool)
(declare-var b_13_0_1 Bool)
(declare-var b_13_1_1 Bool)
(declare-var b_13_0_2 Bool)
(declare-var b_13_1_2 Bool)
(declare-var b_13_2_2 Bool)
(declare-var b_13_0_3 Bool)
(declare-var b_13_1_3 Bool)
(declare-var b_13_2_3 Bool)
(declare-var b_13_3_3 Bool)
(declare-rel realizable ())
(declare-rel funcR__syn ((Array Int Int) Int (Array Int Int) Int))
(declare-rel funcR__sem (Int Int String (Array Int Int) Int (Array Int Int) Int Bool Bool Bool Bool Bool Bool Bool Bool Bool Bool))
(rule 
(=> 
  (and (= (+ 1 ind_in) ind_out1)
  (= (store l_in ind_in 2) l_out1))
  (funcR__syn l_in ind_in l_out1 ind_out1))
 synRule_2)

(rule 
(=> 
  (and (and (= (+ 1 ind_in) ind_out1)
  (= l_in l_out1))
  (= 2 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out1 ind_out1 true false true false false true false false false true))
 semRule_2)

(rule 
(=> 
  (and (funcR__syn (store l_in ind_in 4) (+ 1 ind_in) l_out1 ind_out1)
  (funcR__syn l_out1 ind_out1 l_out2 ind_out2))
  (funcR__syn l_in ind_in l_out2 ind_out2))
 synRule_4)

(rule 
(=> 
  (and (and (funcR__sem n1 n2 match_str l_in (+ 1 ind_in) l_out1 ind_out1 m_0_0_1 m_0_1_1 m_1_1_1 m_0_2_1 m_1_2_1 m_2_2_1 m_0_3_1 m_1_3_1 m_2_3_1 m_3_3_1)
  (funcR__sem n1 n2 match_str l_out1 ind_out1 l_out2 ind_out2 m_0_0_2 m_0_1_2 m_1_1_2 m_0_2_2 m_1_2_2 m_2_2_2 m_0_3_2 m_1_3_2 m_2_3_2 m_3_3_2))
  (= 4 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out2 ind_out2 (or m_0_0_1
  m_0_0_2) (or m_0_1_1
  m_0_1_2) (or m_1_1_1
  m_1_1_2) (or m_0_2_1
  m_0_2_2) (or m_1_2_1
  m_1_2_2) (or m_2_2_1
  m_2_2_2) (or m_0_3_1
  m_0_3_2) (or m_1_3_1
  m_1_3_2) (or m_2_3_1
  m_2_3_2) (or m_3_3_1
  m_3_3_2)))
 semRule_4)

(rule 
(=> 
  (and (funcR__syn (store l_in ind_in 5) (+ 1 ind_in) l_out1 ind_out1)
  (funcR__syn l_out1 ind_out1 l_out2 ind_out2))
  (funcR__syn l_in ind_in l_out2 ind_out2))
 synRule_5)

(rule 
(=> 
  (and (and (funcR__sem n1 n2 match_str l_in (+ 1 ind_in) l_out1 ind_out1 m_0_0_1 m_0_1_1 m_1_1_1 m_0_2_1 m_1_2_1 m_2_2_1 m_0_3_1 m_1_3_1 m_2_3_1 m_3_3_1)
  (funcR__sem n1 n2 match_str l_out1 ind_out1 l_out2 ind_out2 m_0_0_2 m_0_1_2 m_1_1_2 m_0_2_2 m_1_2_2 m_2_2_2 m_0_3_2 m_1_3_2 m_2_3_2 m_3_3_2))
  (= 5 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out2 ind_out2 (or (and m_0_0_1
  m_0_0_2)) (or (and m_0_0_1
  m_0_1_2)
  (and m_0_1_1
  m_1_1_2)) (or (and m_1_1_1
  m_1_1_2)) (or (and m_0_0_1
  m_0_2_2)
  (and m_0_1_1
  m_1_2_2)
  (and m_0_2_1
  m_2_2_2)) (or (and m_1_1_1
  m_1_2_2)
  (and m_1_2_1
  m_2_2_2)) (or (and m_2_2_1
  m_2_2_2)) (or (and m_0_0_1
  m_0_3_2)
  (and m_0_1_1
  m_1_3_2)
  (and m_0_2_1
  m_2_3_2)
  (and m_0_3_1
  m_3_3_2)) (or (and m_1_1_1
  m_1_3_2)
  (and m_1_2_1
  m_2_3_2)
  (and m_1_3_1
  m_3_3_2)) (or (and m_2_2_1
  m_2_3_2)
  (and m_2_3_1
  m_3_3_2)) (or (and m_3_3_1
  m_3_3_2))))
 semRule_5)

(rule 
(=> 
  (and (= (+ 1 ind_in) ind_out1)
  (= (store l_in ind_in 3) l_out1))
  (funcR__syn l_in ind_in l_out1 ind_out1))
 synRule_3)

(rule 
(=> 
  (and (and (= (+ 1 ind_in) ind_out1)
  (= l_in l_out1))
  (= 3 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out1 ind_out1 false true false false true false false false true false))
 semRule_3)

(rule 
(=> 
  (and (= (+ 1 ind_in) ind_out1)
  (= (store l_in ind_in 0) l_out1))
  (funcR__syn l_in ind_in l_out1 ind_out1))
 synRule_0)

(rule 
(=> 
  (and (and (= (+ 1 ind_in) ind_out1)
  (= l_in l_out1))
  (= 0 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out1 ind_out1 false (= (str.at match_str 0) "0") false false (= (str.at match_str 1) "0") false false false (= (str.at match_str 2) "0") false))
 semRule_0)

(rule 
(=> 
  (funcR__syn (store l_in ind_in 6) (+ 1 ind_in) l_out1 ind_out1)
  (funcR__syn l_in ind_in l_out1 ind_out1))
 synRule_6)

(rule 
(=> 
  (and (and (funcR__sem n2 n2 match_str l_in (+ 1 ind_in) l_out1 ind_out1 m_0_0_1 m_0_1_1 m_1_1_1 m_0_2_1 m_1_2_1 m_2_2_1 m_0_3_1 m_1_3_1 m_2_3_1 m_3_3_1)
  (funcR__sem (- n1 1) n2 match_str l_in ind_in l_out2 ind_out2 m_0_0_2 m_0_1_2 m_1_1_2 m_0_2_2 m_1_2_2 m_2_2_2 m_0_3_2 m_1_3_2 m_2_3_2 m_3_3_2))
  (= 6 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out1 ind_out1 (or m_0_0_2
  (and m_0_0_1
  m_0_0_2)) (or m_0_1_2
  (and m_0_0_1
  m_0_1_2)
  (and m_0_1_1
  m_1_1_2)) (or m_1_1_2
  (and m_1_1_1
  m_1_1_2)) (or m_0_2_2
  (and m_0_0_1
  m_0_2_2)
  (and m_0_1_1
  m_1_2_2)
  (and m_0_2_1
  m_2_2_2)) (or m_1_2_2
  (and m_1_1_1
  m_1_2_2)
  (and m_1_2_1
  m_2_2_2)) (or m_2_2_2
  (and m_2_2_1
  m_2_2_2)) (or m_0_3_2
  (and m_0_0_1
  m_0_3_2)
  (and m_0_1_1
  m_1_3_2)
  (and m_0_2_1
  m_2_3_2)
  (and m_0_3_1
  m_3_3_2)) (or m_1_3_2
  (and m_1_1_1
  m_1_3_2)
  (and m_1_2_1
  m_2_3_2)
  (and m_1_3_1
  m_3_3_2)) (or m_2_3_2
  (and m_2_2_1
  m_2_3_2)
  (and m_2_3_1
  m_3_3_2)) (or m_3_3_2
  (and m_3_3_1
  m_3_3_2))))
 semRule_6)

(rule 
(=> 
  (and (funcR__sem n2 n2 match_str l_in (+ 1 ind_in) l_out1 ind_out1 m_0_0_1 m_0_1_1 m_1_1_1 m_0_2_1 m_1_2_1 m_2_2_1 m_0_3_1 m_1_3_1 m_2_3_1 m_3_3_1)
  (= 6 (select l_in ind_in)))
  (funcR__sem 0 n2 match_str l_in ind_in l_out1 ind_out1 true false true false false true false false false true))
 semRule_6)

(rule 
(=> 
  (and (= (+ 1 ind_in) ind_out1)
  (= (store l_in ind_in 1) l_out1))
  (funcR__syn l_in ind_in l_out1 ind_out1))
 synRule_1)

(rule 
(=> 
  (and (and (= (+ 1 ind_in) ind_out1)
  (= l_in l_out1))
  (= 1 (select l_in ind_in)))
  (funcR__sem n1 n2 match_str l_in ind_in l_out1 ind_out1 false (= (str.at match_str 0) "1") false false (= (str.at match_str 1) "1") false false false (= (str.at match_str 2) "1") false))
 semRule_1)

(rule 
(=> 
  (and (funcR__syn l_in 0 l_out1 ind_out1)
  (funcR__sem 3 3 "11" l_out1 0 l_out2 ind_out2 b_9_0_0 b_9_0_1 b_9_1_1 false b_9_1_2 b_9_2_2 b_9_0_3 b_9_1_3 b_9_2_3 b_9_3_3)
  (funcR__sem 3 3 "01" l_out1 0 l_out2 ind_out2 b_4_0_0 b_4_0_1 b_4_1_1 true b_4_1_2 b_4_2_2 b_4_0_3 b_4_1_3 b_4_2_3 b_4_3_3)
  (funcR__sem 3 3 "001" l_out1 0 l_out2 ind_out2 b_0_0_0 b_0_0_1 b_0_1_1 b_0_0_2 b_0_1_2 b_0_2_2 true b_0_1_3 b_0_2_3 b_0_3_3)
  (funcR__sem 3 3 "10" l_out1 0 l_out2 ind_out2 b_10_0_0 b_10_0_1 b_10_1_1 false b_10_1_2 b_10_2_2 b_10_0_3 b_10_1_3 b_10_2_3 b_10_3_3)
  (funcR__sem 3 3 "010" l_out1 0 l_out2 ind_out2 b_1_0_0 b_1_0_1 b_1_1_1 b_1_0_2 b_1_1_2 b_1_2_2 true b_1_1_3 b_1_2_3 b_1_3_3)
  (funcR__sem 3 3 "110" l_out1 0 l_out2 ind_out2 b_8_0_0 b_8_0_1 b_8_1_1 b_8_0_2 b_8_1_2 b_8_2_2 false b_8_1_3 b_8_2_3 b_8_3_3)
  (funcR__sem 3 3 "101" l_out1 0 l_out2 ind_out2 b_13_0_0 b_13_0_1 b_13_1_1 b_13_0_2 b_13_1_2 b_13_2_2 false b_13_1_3 b_13_2_3 b_13_3_3)
  (funcR__sem 3 3 "00" l_out1 0 l_out2 ind_out2 b_3_0_0 b_3_0_1 b_3_1_1 true b_3_1_2 b_3_2_2 b_3_0_3 b_3_1_3 b_3_2_3 b_3_3_3)
  (funcR__sem 3 3 "011" l_out1 0 l_out2 ind_out2 b_2_0_0 b_2_0_1 b_2_1_1 b_2_0_2 b_2_1_2 b_2_2_2 true b_2_1_3 b_2_2_3 b_2_3_3)
  (funcR__sem 3 3 "1" l_out1 0 l_out2 ind_out2 b_11_0_0 false b_11_1_1 b_11_0_2 b_11_1_2 b_11_2_2 b_11_0_3 b_11_1_3 b_11_2_3 b_11_3_3)
  (funcR__sem 3 3 "100" l_out1 0 l_out2 ind_out2 b_7_0_0 b_7_0_1 b_7_1_1 b_7_0_2 b_7_1_2 b_7_2_2 false b_7_1_3 b_7_2_3 b_7_3_3)
  (funcR__sem 3 3 "0" l_out1 0 l_out2 ind_out2 b_5_0_0 true b_5_1_1 b_5_0_2 b_5_1_2 b_5_2_2 b_5_0_3 b_5_1_3 b_5_2_3 b_5_3_3)
  (funcR__sem 3 3 "111" l_out1 0 l_out2 ind_out2 b_12_0_0 b_12_0_1 b_12_1_1 b_12_0_2 b_12_1_2 b_12_2_2 false b_12_1_3 b_12_2_3 b_12_3_3)
  (funcR__sem 3 3 "000" l_out1 0 l_out2 ind_out2 b_6_0_0 b_6_0_1 b_6_1_1 b_6_0_2 b_6_1_2 b_6_2_2 true b_6_1_3 b_6_2_3 b_6_3_3))
  realizable)
 queryrule)

(query realizable)
