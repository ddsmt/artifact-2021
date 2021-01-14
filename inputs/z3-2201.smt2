(get-info :version)
; (:version "4.8.5 - build hashcode 05663592ee7c")
; Started: 2019-03-24 17:05:44
; Silicon.buildVersion: 0.0 <unknown> <unknown> <unknown>
; Input file: null
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Boogie: default
(set-option :auto_config false) ; Usually a good idea
(set-option :smt.mbqi false)
(set-option :model.v2 true)
(set-option :smt.phase_selection 0)
(set-option :smt.restart_strategy 0)
(set-option :smt.restart_factor |1.5|)
(set-option :smt.arith.random_initial_value true)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :smt.delay_units_threshold 16)
(set-option :nnf.sk_hack true)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.qi.cost "(+ weight generation)")
(set-option :type_check true)
(set-option :smt.bv.reflect true)
; 
; ; /preamble.smt2
(declare-datatypes () ((
    $Snap ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(declare-sort $FPM)
(declare-sort $PPM)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm) (ub $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))
         (< p $Perm.Write)))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
(declare-sort Set<$Ref>)
(declare-sort Set<Bool>)
(declare-sort $FVF<$Ref>)
(declare-sort $FVF<Bool>)
(declare-sort $PSF<$Snap>)
(declare-sort Set<$Snap>)
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.Int|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.Bool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.Set<$Ref>|
    )))
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.Set<Bool>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<$Ref>To$Snap ($FVF<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<$Ref> ($Snap) $FVF<$Ref>)
(assert (forall ((x $FVF<$Ref>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<$Ref>($SortWrappers.$FVF<$Ref>To$Snap x)))
    :pattern (($SortWrappers.$FVF<$Ref>To$Snap x))
    :qid |$Snap.$FVF<$Ref>|
    )))
(declare-fun $SortWrappers.$FVF<Bool>To$Snap ($FVF<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Bool> ($Snap) $FVF<Bool>)
(assert (forall ((x $FVF<Bool>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Bool>($SortWrappers.$FVF<Bool>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Bool>To$Snap x))
    :qid |$Snap.$FVF<Bool>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<$Snap>To$Snap ($PSF<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<$Snap> ($Snap) $PSF<$Snap>)
(assert (forall ((x $PSF<$Snap>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<$Snap>($SortWrappers.$PSF<$Snap>To$Snap x)))
    :pattern (($SortWrappers.$PSF<$Snap>To$Snap x))
    :qid |$Snap.$PSF<$Snap>|
    )))
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.Set<$Snap>|
    )))
; ////////// Symbols
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_disjoint (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_disjoint (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
; /field_value_functions_declarations.smt2 [left: Ref]
(declare-fun $FVF.domain_left ($FVF<$Ref>) Set<$Ref>)
(declare-fun $FVF.lookup_left ($FVF<$Ref> $Ref) $Ref)
(declare-fun $FVF.after_left ($FVF<$Ref> $FVF<$Ref>) Bool)
(declare-fun $FVF.loc_left ($Ref $Ref) Bool)
(declare-fun $FVF.perm_left ($FPM $Ref) $Perm)
(declare-const $fvfTOP_left $FVF<$Ref>)
; /field_value_functions_declarations.smt2 [right: Ref]
(declare-fun $FVF.domain_right ($FVF<$Ref>) Set<$Ref>)
(declare-fun $FVF.lookup_right ($FVF<$Ref> $Ref) $Ref)
(declare-fun $FVF.after_right ($FVF<$Ref> $FVF<$Ref>) Bool)
(declare-fun $FVF.loc_right ($Ref $Ref) Bool)
(declare-fun $FVF.perm_right ($FPM $Ref) $Perm)
(declare-const $fvfTOP_right $FVF<$Ref>)
; /field_value_functions_declarations.smt2 [is_marked: Bool]
(declare-fun $FVF.domain_is_marked ($FVF<Bool>) Set<$Ref>)
(declare-fun $FVF.lookup_is_marked ($FVF<Bool> $Ref) Bool)
(declare-fun $FVF.after_is_marked ($FVF<Bool> $FVF<Bool>) Bool)
(declare-fun $FVF.loc_is_marked (Bool $Ref) Bool)
(declare-fun $FVF.perm_is_marked ($FPM $Ref) $Perm)
(declare-const $fvfTOP_is_marked $FVF<Bool>)
; /dafny_axioms/qpp_sets_declarations_dafny.smt2 [Snap]
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((e $Ref)) (!
  (not (Set_in e (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in e (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (implies (not (= (Set_card s) 0)) (exists ((e $Ref)) (! (Set_in e s)  ))))
  :pattern ((Set_card s))
  )))
(assert (forall ((e $Ref)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  )))
(assert (forall ((e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  )))
(assert (forall ((e $Ref)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  )))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  )))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  )))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (implies (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  )))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (implies (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  )))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (implies
    (not (Set_in e s))
    (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (implies (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (implies (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  )))
(assert (and
  (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
    (=
      (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
      (+ (Set_card s1) (Set_card s2)))
    :pattern ((Set_card (Set_union s1 s2)))
    ))
  (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
    (=
      (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
      (+ (Set_card s1) (Set_card s2)))
    :pattern ((Set_card (Set_intersection s1 s2)))
    ))))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (implies (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_subset s1 s2)
    (and
      (forall ((e $Ref)) (!
        (implies (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s1))
        ))
      (forall ((e $Ref)) (!
        (implies (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_subset s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_equal s1 s2)
    (and
      (forall ((e $Ref)) (!
        (= (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s1))
        ))
      (forall ((e $Ref)) (!
        (= (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_equal s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (implies (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_disjoint s1 s2)
    (and
      (forall ((e $Ref)) (!
        (or (not (Set_in e s1)) (not (Set_in e s2)))
        :pattern ((Set_in e s1))
        ))
      (forall ((e $Ref)) (!
        (or (not (Set_in e s1)) (not (Set_in e s2)))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_disjoint s1 s2))
  )))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((e Bool)) (!
  (not (Set_in e (as Set_empty  Set<Bool>)))
  :pattern ((Set_in e (as Set_empty  Set<Bool>)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (implies (not (= (Set_card s) 0)) (exists ((e Bool)) (! (Set_in e s)  ))))
  :pattern ((Set_card s))
  )))
(assert (forall ((e Bool)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  )))
(assert (forall ((e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  )))
(assert (forall ((e Bool)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  )))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  )))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  )))
(assert (forall ((s Set<Bool>) (e1 Bool) (e2 Bool)) (!
  (implies (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  )))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (implies (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  )))
(assert (forall ((s Set<Bool>) (e Bool)) (!
  (implies
    (not (Set_in e s))
    (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (implies (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (implies (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  )))
(assert (and
  (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
    (=
      (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
      (+ (Set_card s1) (Set_card s2)))
    :pattern ((Set_card (Set_union s1 s2)))
    ))
  (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
    (=
      (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
      (+ (Set_card s1) (Set_card s2)))
    :pattern ((Set_card (Set_intersection s1 s2)))
    ))))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>) (e Bool)) (!
  (implies (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_subset s1 s2)
    (and
      (forall ((e Bool)) (!
        (implies (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s1))
        ))
      (forall ((e Bool)) (!
        (implies (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_subset s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_equal s1 s2)
    (and
      (forall ((e Bool)) (!
        (= (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s1))
        ))
      (forall ((e Bool)) (!
        (= (Set_in e s1) (Set_in e s2))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_equal s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (implies (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (=
    (Set_disjoint s1 s2)
    (and
      (forall ((e Bool)) (!
        (or (not (Set_in e s1)) (not (Set_in e s2)))
        :pattern ((Set_in e s1))
        ))
      (forall ((e Bool)) (!
        (or (not (Set_in e s1)) (not (Set_in e s2)))
        :pattern ((Set_in e s2))
        ))))
  :pattern ((Set_disjoint s1 s2))
  )))
(assert (forall ((s1 Set<Bool>) (s2 Set<Bool>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  )))
; /field_value_functions_axioms.smt2 [left: Ref]
(assert (forall ((vs $FVF<$Ref>) (ws $FVF<$Ref>)) (!
    (implies
      (and
        (Set_equal ($FVF.domain_left vs) ($FVF.domain_left ws))
        (forall ((x $Ref)) (!
          (implies
            (Set_in x ($FVF.domain_left vs))
            (= ($FVF.lookup_left vs x) ($FVF.lookup_left ws x)))
          :pattern (($FVF.lookup_left vs x) ($FVF.lookup_left ws x))
          :qid |qp.$FVF<$Ref>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<$Ref>To$Snap vs)
              ($SortWrappers.$FVF<$Ref>To$Snap ws)
              )
    :qid |qp.$FVF<$Ref>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_left pm r))
    :pattern ($FVF.perm_left pm r))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_left f r) true)
    :pattern ($FVF.loc_left f r))))
; /field_value_functions_axioms.smt2 [right: Ref]
(assert (forall ((vs $FVF<$Ref>) (ws $FVF<$Ref>)) (!
    (implies
      (and
        (Set_equal ($FVF.domain_right vs) ($FVF.domain_right ws))
        (forall ((x $Ref)) (!
          (implies
            (Set_in x ($FVF.domain_right vs))
            (= ($FVF.lookup_right vs x) ($FVF.lookup_right ws x)))
          :pattern (($FVF.lookup_right vs x) ($FVF.lookup_right ws x))
          :qid |qp.$FVF<$Ref>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<$Ref>To$Snap vs)
              ($SortWrappers.$FVF<$Ref>To$Snap ws)
              )
    :qid |qp.$FVF<$Ref>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_right pm r))
    :pattern ($FVF.perm_right pm r))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_right f r) true)
    :pattern ($FVF.loc_right f r))))
; /field_value_functions_axioms.smt2 [is_marked: Bool]
(assert (forall ((vs $FVF<Bool>) (ws $FVF<Bool>)) (!
    (implies
      (and
        (Set_equal ($FVF.domain_is_marked vs) ($FVF.domain_is_marked ws))
        (forall ((x $Ref)) (!
          (implies
            (Set_in x ($FVF.domain_is_marked vs))
            (= ($FVF.lookup_is_marked vs x) ($FVF.lookup_is_marked ws x)))
          :pattern (($FVF.lookup_is_marked vs x) ($FVF.lookup_is_marked ws x))
          :qid |qp.$FVF<Bool>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Bool>To$Snap vs)
              ($SortWrappers.$FVF<Bool>To$Snap ws)
              )
    :qid |qp.$FVF<Bool>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_is_marked pm r))
    :pattern ($FVF.perm_is_marked pm r))))
(assert (forall ((r $Ref) (f Bool)) (!
    (= ($FVF.loc_is_marked f r) true)
    :pattern ($FVF.loc_is_marked f r))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- trav_rec ----------
(declare-const nodes@0@01 Set<$Ref>)
(declare-const node@1@01 $Ref)
(declare-const nodes@2@01 Set<$Ref>)
(declare-const node@3@01 $Ref)
(declare-const $t@4@01 $Snap)
(declare-const $t@5@01 $Snap)
(assert (= $t@4@01 ($Snap.combine $Snap.unit $t@5@01)))
; [eval] (node in nodes)
(assert (Set_in node@3@01 nodes@2@01))
(declare-const $t@6@01 $Snap)
(assert (= $t@5@01 ($Snap.combine $Snap.unit $t@6@01)))
; [eval] !((null in nodes))
; [eval] (null in nodes)
(assert (not (Set_in $Ref.null nodes@2@01)))
(declare-const $t@7@01 $FVF<$Ref>)
(declare-const $t@8@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@7@01) $t@8@01)))
(declare-const n@9@01 $Ref)
(declare-fun inv@10@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n@9@01 $Ref)) (!
    (implies (Set_in n@9@01 nodes@2@01) (= (inv@10@01 n@9@01) n@9@01))
    :pattern ((Set_in n@9@01 nodes@2@01))
    ))
  (forall ((n@9@01 $Ref)) (!
    (implies (Set_in n@9@01 nodes@2@01) (= (inv@10@01 n@9@01) n@9@01))
    :pattern ((inv@10@01 n@9@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@10@01 r) nodes@2@01) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n@9@01 $Ref)) (!
    (implies (Set_in n@9@01 nodes@2@01) (not (= n@9@01 $Ref.null)))
    :pattern ((Set_in n@9@01 nodes@2@01))
    ))
  (forall ((n@9@01 $Ref)) (!
    (implies (Set_in n@9@01 nodes@2@01) (not (= n@9@01 $Ref.null)))
    :pattern ((inv@10@01 n@9@01))
    ))))
(declare-const sm@11@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left $t@7@01 r))
    :qid |qp.fvfValDef0|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@7@01 r) r)
  :pattern (($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@10@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) r) r))
  :pattern ((inv@10@01 r))
  )))
(declare-const $t@12@01 $FVF<$Ref>)
(declare-const $t@13@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@12@01) $t@13@01)))
(declare-const n$0@14@01 $Ref)
(declare-fun inv@15@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$0@14@01 $Ref)) (!
    (implies (Set_in n$0@14@01 nodes@2@01) (= (inv@15@01 n$0@14@01) n$0@14@01))
    :pattern ((Set_in n$0@14@01 nodes@2@01))
    ))
  (forall ((n$0@14@01 $Ref)) (!
    (implies (Set_in n$0@14@01 nodes@2@01) (= (inv@15@01 n$0@14@01) n$0@14@01))
    :pattern ((inv@15@01 n$0@14@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@15@01 r) nodes@2@01) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |right-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$0@14@01 $Ref)) (!
    (implies (Set_in n$0@14@01 nodes@2@01) (not (= n$0@14@01 $Ref.null)))
    :pattern ((Set_in n$0@14@01 nodes@2@01))
    ))
  (forall ((n$0@14@01 $Ref)) (!
    (implies (Set_in n$0@14@01 nodes@2@01) (not (= n$0@14@01 $Ref.null)))
    :pattern ((inv@15@01 n$0@14@01))
    ))))
(declare-const sm@16@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right $t@12@01 r))
    :qid |qp.fvfValDef1|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@12@01 r) r)
  :pattern (($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@15@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) r) r))
  :pattern ((inv@15@01 r))
  )))
(declare-const $t@17@01 $FVF<Bool>)
(declare-const $t@18@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($SortWrappers.$FVF<Bool>To$Snap $t@17@01) $t@18@01)))
(declare-const n$1@19@01 $Ref)
(declare-fun inv@20@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$1@19@01 $Ref)) (!
    (implies (Set_in n$1@19@01 nodes@2@01) (= (inv@20@01 n$1@19@01) n$1@19@01))
    :pattern ((Set_in n$1@19@01 nodes@2@01))
    ))
  (forall ((n$1@19@01 $Ref)) (!
    (implies (Set_in n$1@19@01 nodes@2@01) (= (inv@20@01 n$1@19@01) n$1@19@01))
    :pattern ((inv@20@01 n$1@19@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@20@01 r) nodes@2@01) (= (inv@20@01 r) r))
  :pattern ((inv@20@01 r))
  :qid |is_marked-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$1@19@01 $Ref)) (!
    (implies (Set_in n$1@19@01 nodes@2@01) (not (= n$1@19@01 $Ref.null)))
    :pattern ((Set_in n$1@19@01 nodes@2@01))
    ))
  (forall ((n$1@19@01 $Ref)) (!
    (implies (Set_in n$1@19@01 nodes@2@01) (not (= n$1@19@01 $Ref.null)))
    :pattern ((inv@20@01 n$1@19@01))
    ))))
(declare-const sm@21@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@20@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@20@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked $t@17@01 r))
    :qid |qp.fvfValDef2|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@17@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@20@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) r) r))
  :pattern ((inv@20@01 r))
  )))
(declare-const $t@22@01 $Snap)
(assert (= $t@18@01 ($Snap.combine $Snap.unit $t@22@01)))
; [eval] (forall n$2: Ref :: { (n$2.left in nodes) } { (n$2 in nodes),n$2.left } (n$2 in nodes) && n$2.left != null ==> (n$2.left in nodes))
(declare-const n$2@23@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$2@23@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@23@01 nodes@2@01)
        (and
          (Set_in n$2@23@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01)))
      (implies
        (and
          (Set_in n$2@23@01 nodes@2@01)
          (implies
            (Set_in n$2@23@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01)
                $Ref.null))))
        (and
          (Set_in n$2@23@01 nodes@2@01)
          (implies
            (Set_in n$2@23@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$2@23@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@23@01 nodes@2@01)
        (and
          (Set_in n$2@23@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01)))
      (implies
        (and
          (Set_in n$2@23@01 nodes@2@01)
          (implies
            (Set_in n$2@23@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01)
                $Ref.null))))
        (and
          (Set_in n$2@23@01 nodes@2@01)
          (implies
            (Set_in n$2@23@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01))))
    :pattern ((Set_in n$2@23@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01))
    :qid |prog.l23-aux|))))
(assert (and
  (forall ((n$2@23@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@23@01 nodes@2@01)
        (implies
          (Set_in n$2@23@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) nodes@2@01))
    ))
  (forall ((n$2@23@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@23@01 nodes@2@01)
        (implies
          (Set_in n$2@23@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) nodes@2@01))
    :pattern ((Set_in n$2@23@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) n$2@23@01) n$2@23@01))
    ))))
(assert (= $t@22@01 ($Snap.combine $Snap.unit $Snap.unit)))
; [eval] (forall n$3: Ref :: { (n$3.right in nodes) } { (n$3 in nodes),n$3.right } (n$3 in nodes) && n$3.right != null ==> (n$3.right in nodes))
(declare-const n$3@25@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$3@25@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@25@01 nodes@2@01)
        (and
          (Set_in n$3@25@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01)))
      (implies
        (and
          (Set_in n$3@25@01 nodes@2@01)
          (implies
            (Set_in n$3@25@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01)
                $Ref.null))))
        (and
          (Set_in n$3@25@01 nodes@2@01)
          (implies
            (Set_in n$3@25@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$3@25@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@25@01 nodes@2@01)
        (and
          (Set_in n$3@25@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01)))
      (implies
        (and
          (Set_in n$3@25@01 nodes@2@01)
          (implies
            (Set_in n$3@25@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01)
                $Ref.null))))
        (and
          (Set_in n$3@25@01 nodes@2@01)
          (implies
            (Set_in n$3@25@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01))))
    :pattern ((Set_in n$3@25@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01))
    :qid |prog.l23-aux|))))
(assert (and
  (forall ((n$3@25@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@25@01 nodes@2@01)
        (implies
          (Set_in n$3@25@01 nodes@2@01)
          (not
            (= ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) nodes@2@01))
    ))
  (forall ((n$3@25@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@25@01 nodes@2@01)
        (implies
          (Set_in n$3@25@01 nodes@2@01)
          (not
            (= ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) nodes@2@01))
    :pattern ((Set_in n$3@25@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@16@01  $FVF<$Ref>) n$3@25@01) n$3@25@01))
    ))))
; [eval] !node.is_marked
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) node@3@01) node@3@01))
; 0.00s
; (get-info :all-statistics)
(assert (not ($FVF.lookup_is_marked (as sm@21@01  $FVF<Bool>) node@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const $t@27@01 $Snap)
(declare-const $t@28@01 $Snap)
(declare-const $t@29@01 $Snap)
(declare-const $t@30@01 $FVF<$Ref>)
(declare-const $t@31@01 $Snap)
(declare-const n$4@32@01 $Ref)
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-const sm@34@01 $FVF<$Ref>)
(declare-const $t@35@01 $FVF<$Ref>)
(declare-const $t@36@01 $Snap)
(declare-const n$5@37@01 $Ref)
(declare-fun inv@38@01 ($Ref) $Ref)
(declare-const sm@39@01 $FVF<$Ref>)
(declare-const $t@40@01 $FVF<Bool>)
(declare-const $t@41@01 $Snap)
(declare-const n$6@42@01 $Ref)
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-const sm@44@01 $FVF<Bool>)
(declare-const $t@45@01 $Snap)
(declare-const n$7@46@01 $Ref)
(declare-const $t@48@01 $Snap)
(declare-const n$8@49@01 $Ref)
(declare-const $t@51@01 $Snap)
(declare-const n@52@01 $Ref)
(declare-const $t@53@01 $Snap)
(declare-const $t@54@01 $Snap)
(declare-const n@55@01 $Ref)
(declare-const $t@56@01 $Snap)
(declare-const n@57@01 $Ref)
(declare-const n@58@01 $Ref)
(declare-const n@62@01 $Ref)
; [exec]
; node.is_marked := true
(declare-const sm@66@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@20@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@20@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked $t@17@01 r))
    :qid |qp.fvfValDef6|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@17@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) r))
  )))
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) node@3@01) node@3@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (= r node@3@01)
    ($Perm.min
      (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $FVF<Bool>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) node@3@01) true))
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) node@3@01) node@3@01))
; [eval] node.left != null && !node.left.is_marked
; [eval] node.left != null
(assert ($FVF.loc_left ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) node@3@01))
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
; [eval] v@69@01 ==> !node.left.is_marked
(declare-const sm@70@01 $FVF<Bool>)
; Joined path conditions
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef7|))))
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked $t@17@01 r))
    :qid |qp.fvfValDef8|))))
(assert (implies
  (not (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) $Ref.null))
  (and
    (not (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) $Ref.null))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r) r)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@17@01 r) r))
      :pattern (($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) r))
      ))
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)))))
; Joined path conditions
(set-option :timeout 10)
; 0.00s
; (get-info :all-statistics)
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | Lookup(left,sm@11@01,node@3@01) != Null && Lookup(left,sm@11@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@70@01,Lookup(left,sm@11@01,node@3@01))) | live]
; [else-branch: 21 | !(Lookup(left,sm@11@01,node@3@01) != Null && Lookup(left,sm@11@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@70@01,Lookup(left,sm@11@01,node@3@01)))) | live]
; [then-branch: 21 | Lookup(left,sm@11@01,node@3@01) != Null && Lookup(left,sm@11@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@70@01,Lookup(left,sm@11@01,node@3@01)))]
(assert (and
  (not (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) $Ref.null))
  (implies
    (not (= ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) $Ref.null))
    (not
      ($FVF.lookup_is_marked (as sm@70@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01))))))
; [exec]
; trav_rec(nodes, node.left)
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
; [eval] (node in nodes)
; 0.00s
; (get-info :all-statistics)
(assert (Set_in ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01) nodes@2@01))
; [eval] !((null in nodes))
; [eval] (null in nodes)
(declare-const n@71@01 $Ref)
(declare-fun inv@72@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; 0.00s
; (get-info :all-statistics)
(declare-const sm@73@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@73@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left (as sm@73@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@73@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left $t@7@01 r))
    :qid |qp.fvfValDef9|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@7@01 r) r)
  :pattern (($FVF.lookup_left (as sm@73@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n@71@01 $Ref)) (!
    (implies (Set_in n@71@01 nodes@2@01) (= (inv@72@01 n@71@01) n@71@01))
    :pattern ((Set_in n@71@01 nodes@2@01))
    :qid |left-invOfFct|))
  (forall ((n@71@01 $Ref)) (!
    (implies (Set_in n@71@01 nodes@2@01) (= (inv@72@01 n@71@01) n@71@01))
    :pattern ((inv@72@01 n@71@01))
    :qid |left-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@72@01 r) nodes@2@01) (= (inv@72@01 r) r))
  :pattern ((inv@72@01 r))
  :qid |left-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@72@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@73@01  $FVF<$Ref>) r) r))
  :pattern ((inv@72@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@72@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@10@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@75@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@10@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@7@01 r)))
    :pattern (($FVF.lookup_left $t@7@01 r))
    :qid |qp.fvfValDef10|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@7@01 r) r)
  :pattern (($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) r))
  )))
(declare-const n$0@76@01 $Ref)
(declare-fun inv@77@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@78@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@78@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right (as sm@78@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@78@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right $t@12@01 r))
    :qid |qp.fvfValDef11|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@12@01 r) r)
  :pattern (($FVF.lookup_right (as sm@78@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$0@76@01 $Ref)) (!
    (implies (Set_in n$0@76@01 nodes@2@01) (= (inv@77@01 n$0@76@01) n$0@76@01))
    :pattern ((Set_in n$0@76@01 nodes@2@01))
    :qid |right-invOfFct|))
  (forall ((n$0@76@01 $Ref)) (!
    (implies (Set_in n$0@76@01 nodes@2@01) (= (inv@77@01 n$0@76@01) n$0@76@01))
    :pattern ((inv@77@01 n$0@76@01))
    :qid |right-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@77@01 r) nodes@2@01) (= (inv@77@01 r) r))
  :pattern ((inv@77@01 r))
  :qid |right-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@77@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@78@01  $FVF<$Ref>) r) r))
  :pattern ((inv@77@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@77@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@15@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@15@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@12@01 r)))
    :pattern (($FVF.lookup_right $t@12@01 r))
    :qid |qp.fvfValDef12|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@12@01 r) r)
  :pattern (($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) r))
  )))
(declare-const n$1@81@01 $Ref)
(declare-fun inv@82@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@83@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef13|))))
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked $t@17@01 r))
    :qid |qp.fvfValDef14|))))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r) r)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@17@01 r) r))
  :pattern (($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$1@81@01 $Ref)) (!
    (implies (Set_in n$1@81@01 nodes@2@01) (= (inv@82@01 n$1@81@01) n$1@81@01))
    :pattern ((Set_in n$1@81@01 nodes@2@01))
    :qid |is_marked-invOfFct|))
  (forall ((n$1@81@01 $Ref)) (!
    (implies (Set_in n$1@81@01 nodes@2@01) (= (inv@82@01 n$1@81@01) n$1@81@01))
    :pattern ((inv@82@01 n$1@81@01))
    :qid |is_marked-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@82@01 r) nodes@2@01) (= (inv@82@01 r) r))
  :pattern ((inv@82@01 r))
  :qid |is_marked-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@82@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@83@01  $FVF<Bool>) r) r))
  :pattern ((inv@82@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@84@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@82@01 r) nodes@2@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
        (pTaken@67@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@85@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@82@01 r) nodes@2@01)
    ($Perm.min
      (ite (= r node@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@84@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (implies
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef15|))))
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (implies
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@20@01 r) nodes@2@01) $Perm.Write $Perm.No)
          (pTaken@67@01 r)))
      (=
        ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@17@01 r)))
    :pattern (($FVF.lookup_is_marked $t@17@01 r))
    :qid |qp.fvfValDef16|))))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@68@01  $FVF<Bool>) r) r)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@17@01 r) r))
  :pattern (($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) r))
  )))
; [eval] (forall n$2: Ref :: { (n$2.left in nodes) } { (n$2 in nodes),n$2.left } (n$2 in nodes) && n$2.left != null ==> (n$2.left in nodes))
(declare-const n$2@87@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$2@87@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@87@01 nodes@2@01)
        (and
          (Set_in n$2@87@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01)))
      (implies
        (and
          (Set_in n$2@87@01 nodes@2@01)
          (implies
            (Set_in n$2@87@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01)
                $Ref.null))))
        (and
          (Set_in n$2@87@01 nodes@2@01)
          (implies
            (Set_in n$2@87@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$2@87@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@87@01 nodes@2@01)
        (and
          (Set_in n$2@87@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01)))
      (implies
        (and
          (Set_in n$2@87@01 nodes@2@01)
          (implies
            (Set_in n$2@87@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01)
                $Ref.null))))
        (and
          (Set_in n$2@87@01 nodes@2@01)
          (implies
            (Set_in n$2@87@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01))))
    :pattern ((Set_in n$2@87@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01))
    :qid |prog.l23-aux|))))
; 0.00s
; (get-info :all-statistics)
(assert (and
  (forall ((n$2@87@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@87@01 nodes@2@01)
        (implies
          (Set_in n$2@87@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) nodes@2@01))
    ))
  (forall ((n$2@87@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@87@01 nodes@2@01)
        (implies
          (Set_in n$2@87@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) nodes@2@01))
    :pattern ((Set_in n$2@87@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n$2@87@01) n$2@87@01))
    ))))
; [eval] (forall n$3: Ref :: { (n$3.right in nodes) } { (n$3 in nodes),n$3.right } (n$3 in nodes) && n$3.right != null ==> (n$3.right in nodes))
(declare-const n$3@89@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$3@89@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@89@01 nodes@2@01)
        (and
          (Set_in n$3@89@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01)))
      (implies
        (and
          (Set_in n$3@89@01 nodes@2@01)
          (implies
            (Set_in n$3@89@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01)
                $Ref.null))))
        (and
          (Set_in n$3@89@01 nodes@2@01)
          (implies
            (Set_in n$3@89@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$3@89@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@89@01 nodes@2@01)
        (and
          (Set_in n$3@89@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01)))
      (implies
        (and
          (Set_in n$3@89@01 nodes@2@01)
          (implies
            (Set_in n$3@89@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01)
                $Ref.null))))
        (and
          (Set_in n$3@89@01 nodes@2@01)
          (implies
            (Set_in n$3@89@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01))))
    :pattern ((Set_in n$3@89@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01))
    :qid |prog.l23-aux|))))
; 0.00s
; (get-info :all-statistics)
(assert (and
  (forall ((n$3@89@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@89@01 nodes@2@01)
        (implies
          (Set_in n$3@89@01 nodes@2@01)
          (not
            (= ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) nodes@2@01))
    ))
  (forall ((n$3@89@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@89@01 nodes@2@01)
        (implies
          (Set_in n$3@89@01 nodes@2@01)
          (not
            (= ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) nodes@2@01))
    :pattern ((Set_in n$3@89@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n$3@89@01) n$3@89@01))
    ))))
; [eval] !node.is_marked
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)))
; 0.00s
; (get-info :all-statistics)
; 0.00s
; (get-info :all-statistics)
(assert (not
  ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01))))
(declare-const $t@91@01 $Snap)
(declare-const $t@92@01 $Snap)
(assert (= $t@91@01 ($Snap.combine $Snap.unit $t@92@01)))
; [eval] (node in nodes)
(declare-const $t@93@01 $Snap)
(assert (= $t@92@01 ($Snap.combine $Snap.unit $t@93@01)))
; [eval] !((null in nodes))
; [eval] (null in nodes)
(declare-const $t@94@01 $FVF<$Ref>)
(declare-const $t@95@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@94@01) $t@95@01)))
(declare-const n$4@96@01 $Ref)
(declare-fun inv@97@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$4@96@01 $Ref)) (!
    (implies (Set_in n$4@96@01 nodes@2@01) (= (inv@97@01 n$4@96@01) n$4@96@01))
    :pattern ((Set_in n$4@96@01 nodes@2@01))
    ))
  (forall ((n$4@96@01 $Ref)) (!
    (implies (Set_in n$4@96@01 nodes@2@01) (= (inv@97@01 n$4@96@01) n$4@96@01))
    :pattern ((inv@97@01 n$4@96@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@97@01 r) nodes@2@01) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$4@96@01 $Ref)) (!
    (implies (Set_in n$4@96@01 nodes@2@01) (not (= n$4@96@01 $Ref.null)))
    :pattern ((Set_in n$4@96@01 nodes@2@01))
    ))
  (forall ((n$4@96@01 $Ref)) (!
    (implies (Set_in n$4@96@01 nodes@2@01) (not (= n$4@96@01 $Ref.null)))
    :pattern ((inv@97@01 n$4@96@01))
    ))))
(declare-const sm@98@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left $t@94@01 r))
    :qid |qp.fvfValDef17|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@94@01 r) r)
  :pattern (($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@97@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) r) r))
  :pattern ((inv@97@01 r))
  )))
(declare-const $t@99@01 $FVF<$Ref>)
(declare-const $t@100@01 $Snap)
(assert (= $t@95@01 ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@99@01) $t@100@01)))
(declare-const n$5@101@01 $Ref)
(declare-fun inv@102@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$5@101@01 $Ref)) (!
    (implies
      (Set_in n$5@101@01 nodes@2@01)
      (= (inv@102@01 n$5@101@01) n$5@101@01))
    :pattern ((Set_in n$5@101@01 nodes@2@01))
    ))
  (forall ((n$5@101@01 $Ref)) (!
    (implies
      (Set_in n$5@101@01 nodes@2@01)
      (= (inv@102@01 n$5@101@01) n$5@101@01))
    :pattern ((inv@102@01 n$5@101@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@102@01 r) nodes@2@01) (= (inv@102@01 r) r))
  :pattern ((inv@102@01 r))
  :qid |right-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$5@101@01 $Ref)) (!
    (implies (Set_in n$5@101@01 nodes@2@01) (not (= n$5@101@01 $Ref.null)))
    :pattern ((Set_in n$5@101@01 nodes@2@01))
    ))
  (forall ((n$5@101@01 $Ref)) (!
    (implies (Set_in n$5@101@01 nodes@2@01) (not (= n$5@101@01 $Ref.null)))
    :pattern ((inv@102@01 n$5@101@01))
    ))))
(declare-const sm@103@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef18|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right $t@99@01 r))
    :qid |qp.fvfValDef18|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@99@01 r) r)
  :pattern (($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@102@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) r) r))
  :pattern ((inv@102@01 r))
  )))
(declare-const $t@104@01 $FVF<Bool>)
(declare-const $t@105@01 $Snap)
(assert (=
  $t@100@01
  ($Snap.combine ($SortWrappers.$FVF<Bool>To$Snap $t@104@01) $t@105@01)))
(declare-const n$6@106@01 $Ref)
(declare-fun inv@107@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$6@106@01 $Ref)) (!
    (implies
      (Set_in n$6@106@01 nodes@2@01)
      (= (inv@107@01 n$6@106@01) n$6@106@01))
    :pattern ((Set_in n$6@106@01 nodes@2@01))
    ))
  (forall ((n$6@106@01 $Ref)) (!
    (implies
      (Set_in n$6@106@01 nodes@2@01)
      (= (inv@107@01 n$6@106@01) n$6@106@01))
    :pattern ((inv@107@01 n$6@106@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@107@01 r) nodes@2@01) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |is_marked-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$6@106@01 $Ref)) (!
    (implies (Set_in n$6@106@01 nodes@2@01) (not (= n$6@106@01 $Ref.null)))
    :pattern ((Set_in n$6@106@01 nodes@2@01))
    ))
  (forall ((n$6@106@01 $Ref)) (!
    (implies (Set_in n$6@106@01 nodes@2@01) (not (= n$6@106@01 $Ref.null)))
    :pattern ((inv@107@01 n$6@106@01))
    ))))
(declare-const sm@108@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked $t@104@01 r))
    :qid |qp.fvfValDef19|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@104@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@107@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) r) r))
  :pattern ((inv@107@01 r))
  )))
(declare-const $t@109@01 $Snap)
(assert (= $t@105@01 ($Snap.combine $Snap.unit $t@109@01)))
; [eval] (forall n$7: Ref :: { (n$7.left in nodes) } { (n$7 in nodes),n$7.left } (n$7 in nodes) && n$7.left != null ==> (n$7.left in nodes))
(declare-const n$7@110@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$7@110@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@110@01 nodes@2@01)
        (and
          (Set_in n$7@110@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01)))
      (implies
        (and
          (Set_in n$7@110@01 nodes@2@01)
          (implies
            (Set_in n$7@110@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01)
                $Ref.null))))
        (and
          (Set_in n$7@110@01 nodes@2@01)
          (implies
            (Set_in n$7@110@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$7@110@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@110@01 nodes@2@01)
        (and
          (Set_in n$7@110@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01)))
      (implies
        (and
          (Set_in n$7@110@01 nodes@2@01)
          (implies
            (Set_in n$7@110@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01)
                $Ref.null))))
        (and
          (Set_in n$7@110@01 nodes@2@01)
          (implies
            (Set_in n$7@110@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01))))
    :pattern ((Set_in n$7@110@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01))
    :qid |prog.l26-aux|))))
(assert (and
  (forall ((n$7@110@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@110@01 nodes@2@01)
        (implies
          (Set_in n$7@110@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) nodes@2@01))
    ))
  (forall ((n$7@110@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@110@01 nodes@2@01)
        (implies
          (Set_in n$7@110@01 nodes@2@01)
          (not
            (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) nodes@2@01))
    :pattern ((Set_in n$7@110@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n$7@110@01) n$7@110@01))
    ))))
(declare-const $t@112@01 $Snap)
(assert (= $t@109@01 ($Snap.combine $Snap.unit $t@112@01)))
; [eval] (forall n$8: Ref :: { (n$8.right in nodes) } { (n$8 in nodes),n$8.right } (n$8 in nodes) && n$8.right != null ==> (n$8.right in nodes))
(declare-const n$8@113@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$8@113@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@113@01 nodes@2@01)
        (and
          (Set_in n$8@113@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01)))
      (implies
        (and
          (Set_in n$8@113@01 nodes@2@01)
          (implies
            (Set_in n$8@113@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
                $Ref.null))))
        (and
          (Set_in n$8@113@01 nodes@2@01)
          (implies
            (Set_in n$8@113@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$8@113@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@113@01 nodes@2@01)
        (and
          (Set_in n$8@113@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01)))
      (implies
        (and
          (Set_in n$8@113@01 nodes@2@01)
          (implies
            (Set_in n$8@113@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
                $Ref.null))))
        (and
          (Set_in n$8@113@01 nodes@2@01)
          (implies
            (Set_in n$8@113@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01))))
    :pattern ((Set_in n$8@113@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01))
    :qid |prog.l26-aux|))))
(assert (and
  (forall ((n$8@113@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@113@01 nodes@2@01)
        (implies
          (Set_in n$8@113@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) nodes@2@01))
    ))
  (forall ((n$8@113@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@113@01 nodes@2@01)
        (implies
          (Set_in n$8@113@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) nodes@2@01))
    :pattern ((Set_in n$8@113@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n$8@113@01) n$8@113@01))
    ))))
(declare-const $t@115@01 $Snap)
(assert (= $t@112@01 ($Snap.combine $Snap.unit $t@115@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } (n in nodes) ==> old(n.is_marked) ==> n.is_marked)
(declare-const n@116@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@116@01 $Ref)) (!
  (implies
    (Set_in n@116@01 nodes@2@01)
    (and
      (Set_in n@116@01 nodes@2@01)
      ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@116@01) n@116@01)
      (implies
        ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@116@01)
        (and
          ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@116@01)
          ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@116@01) n@116@01)))))
  :pattern ((Set_in n@116@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@116@01) n@116@01))
  :qid |prog.l29-aux|)))
(assert (forall ((n@116@01 $Ref)) (!
  (implies
    (and
      (Set_in n@116@01 nodes@2@01)
      ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@116@01))
    ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@116@01))
  :pattern ((Set_in n@116@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@116@01) n@116@01))
  )))
(declare-const $t@117@01 $Snap)
(assert (= $t@115@01 ($Snap.combine $Snap.unit $t@117@01)))
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)))
; 0.00s
; (get-info :all-statistics)
(assert ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@11@01  $FVF<$Ref>) node@3@01)))
(declare-const $t@118@01 $Snap)
(assert (= $t@117@01 ($Snap.combine $Snap.unit $t@118@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.left } (n in nodes) ==> n.left == old(n.left))
(declare-const n@119@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@119@01 $Ref)) (!
  (implies
    (Set_in n@119@01 nodes@2@01)
    (and
      (Set_in n@119@01 nodes@2@01)
      ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@119@01) n@119@01)
      ($FVF.loc_left ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n@119@01) n@119@01)))
  :pattern ((Set_in n@119@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@119@01) n@119@01))
  :qid |prog.l33-aux|)))
(assert (forall ((n@119@01 $Ref)) (!
  (implies
    (Set_in n@119@01 nodes@2@01)
    (=
      ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@119@01)
      ($FVF.lookup_left (as sm@75@01  $FVF<$Ref>) n@119@01)))
  :pattern ((Set_in n@119@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@119@01) n@119@01))
  )))
(declare-const $t@120@01 $Snap)
(assert (= $t@118@01 ($Snap.combine $Snap.unit $t@120@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.right } (n in nodes) ==> n.right == old(n.right))
(declare-const n@121@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@121@01 $Ref)) (!
  (implies
    (Set_in n@121@01 nodes@2@01)
    (and
      (Set_in n@121@01 nodes@2@01)
      ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@121@01) n@121@01)
      ($FVF.loc_right ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n@121@01) n@121@01)))
  :pattern ((Set_in n@121@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@121@01) n@121@01))
  :qid |prog.l34-aux|)))
(assert (forall ((n@121@01 $Ref)) (!
  (implies
    (Set_in n@121@01 nodes@2@01)
    (=
      ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@121@01)
      ($FVF.lookup_right (as sm@80@01  $FVF<$Ref>) n@121@01)))
  :pattern ((Set_in n@121@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@121@01) n@121@01))
  )))
(assert (= $t@120@01 ($Snap.combine $Snap.unit $Snap.unit)))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } { (n in nodes),n.left.is_marked } (n in nodes) ==> old(!n.is_marked) && n.is_marked ==> n.left == null || n.left.is_marked)
(declare-const n@122@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n@122@01 $Ref)) (!
    (implies
      (Set_in n@122@01 nodes@2@01)
      (and
        (Set_in n@122@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01) n@122@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01) n@122@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01))
            ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) n@122@01)
            (implies
              (not
                (=
                  ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01))))))))
    :pattern ((Set_in n@122@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01) n@122@01))
    :qid |prog.l37-aux|))
  (forall ((n@122@01 $Ref)) (!
    (implies
      (Set_in n@122@01 nodes@2@01)
      (and
        (Set_in n@122@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01) n@122@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01) n@122@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01))
            ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) n@122@01)
            (implies
              (not
                (=
                  ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01))))))))
    :pattern ((Set_in n@122@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) n@122@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)))
    :qid |prog.l37-aux|))))
(assert (and
  (forall ((n@122@01 $Ref)) (!
    (implies
      (and
        (Set_in n@122@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01))))
      (or
        (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null))
          (implies
            (not
              (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01))))))
    :pattern ((Set_in n@122@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01) n@122@01))
    ))
  (forall ((n@122@01 $Ref)) (!
    (implies
      (and
        (Set_in n@122@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@122@01))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@122@01))))
      (or
        (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null))
          (implies
            (not
              (= ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) $Ref.null))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01))))))
    :pattern ((Set_in n@122@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01) n@122@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)) ($FVF.lookup_left (as sm@98@01  $FVF<$Ref>) n@122@01)))
    ))))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } { (n in nodes),n.right.is_marked } (n in nodes) ==> old(!n.is_marked) && n.is_marked ==> n.right == null || n.right.is_marked)
(declare-const n@126@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n@126@01 $Ref)) (!
    (implies
      (Set_in n@126@01 nodes@2@01)
      (and
        (Set_in n@126@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01) n@126@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01) n@126@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01))
            ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) n@126@01)
            (implies
              (not
                (=
                  ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01))))))))
    :pattern ((Set_in n@126@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01) n@126@01))
    :qid |prog.l39-aux|))
  (forall ((n@126@01 $Ref)) (!
    (implies
      (Set_in n@126@01 nodes@2@01)
      (and
        (Set_in n@126@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01) n@126@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01) n@126@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
              ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01))
            ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) n@126@01)
            (implies
              (not
                (=
                  ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01))))))))
    :pattern ((Set_in n@126@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) n@126@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)))
    :qid |prog.l39-aux|))))
(assert (and
  (forall ((n@126@01 $Ref)) (!
    (implies
      (and
        (Set_in n@126@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01))))
      (or
        (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01))))))
    :pattern ((Set_in n@126@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01) n@126@01))
    ))
  (forall ((n@126@01 $Ref)) (!
    (implies
      (and
        (Set_in n@126@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@86@01  $FVF<Bool>) n@126@01))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) n@126@01))))
      (or
        (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01))))))
    :pattern ((Set_in n@126@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01) n@126@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) n@126@01)))
    ))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] node.right != null && !node.right.is_marked
; [eval] node.right != null
(assert ($FVF.loc_right ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) node@3@01))
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
; [eval] v@130@01 ==> !node.right.is_marked
; Joined path conditions
(assert (implies
  (not (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) $Ref.null))
  (and
    (not (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) $Ref.null))
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)))))
; Joined path conditions
(set-option :timeout 10)
; 0.00s
; (get-info :all-statistics)
; 0.00s
; (get-info :all-statistics)
; [then-branch: 43 | Lookup(right,sm@103@01,node@3@01) != Null && Lookup(right,sm@103@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@108@01,Lookup(right,sm@103@01,node@3@01))) | live]
; [else-branch: 43 | !(Lookup(right,sm@103@01,node@3@01) != Null && Lookup(right,sm@103@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@108@01,Lookup(right,sm@103@01,node@3@01)))) | live]
; [then-branch: 43 | Lookup(right,sm@103@01,node@3@01) != Null && Lookup(right,sm@103@01,node@3@01) != Null ==> !(Lookup(is_marked,sm@108@01,Lookup(right,sm@103@01,node@3@01)))]
(assert (and
  (not (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) $Ref.null))
  (implies
    (not (= ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) $Ref.null))
    (not
      ($FVF.lookup_is_marked (as sm@108@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01))))))
; [exec]
; trav_rec(nodes, node.right)
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
; [eval] (node in nodes)
; 0.00s
; (get-info :all-statistics)
(assert (Set_in ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01) nodes@2@01))
; [eval] !((null in nodes))
; [eval] (null in nodes)
(declare-const n@131@01 $Ref)
(declare-fun inv@132@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; 0.00s
; (get-info :all-statistics)
(declare-const sm@133@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@133@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left (as sm@133@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@133@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left $t@94@01 r))
    :qid |qp.fvfValDef20|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@94@01 r) r)
  :pattern (($FVF.lookup_left (as sm@133@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n@131@01 $Ref)) (!
    (implies (Set_in n@131@01 nodes@2@01) (= (inv@132@01 n@131@01) n@131@01))
    :pattern ((Set_in n@131@01 nodes@2@01))
    :qid |left-invOfFct|))
  (forall ((n@131@01 $Ref)) (!
    (implies (Set_in n@131@01 nodes@2@01) (= (inv@132@01 n@131@01) n@131@01))
    :pattern ((inv@132@01 n@131@01))
    :qid |left-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@132@01 r) nodes@2@01) (= (inv@132@01 r) r))
  :pattern ((inv@132@01 r))
  :qid |left-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@132@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@133@01  $FVF<$Ref>) r) r))
  :pattern ((inv@132@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@132@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@97@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@135@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@97@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@94@01 r)))
    :pattern (($FVF.lookup_left $t@94@01 r))
    :qid |qp.fvfValDef21|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@94@01 r) r)
  :pattern (($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) r))
  )))
(declare-const n$0@136@01 $Ref)
(declare-fun inv@137@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@138@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@138@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right (as sm@138@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@138@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right $t@99@01 r))
    :qid |qp.fvfValDef22|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@99@01 r) r)
  :pattern (($FVF.lookup_right (as sm@138@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$0@136@01 $Ref)) (!
    (implies
      (Set_in n$0@136@01 nodes@2@01)
      (= (inv@137@01 n$0@136@01) n$0@136@01))
    :pattern ((Set_in n$0@136@01 nodes@2@01))
    :qid |right-invOfFct|))
  (forall ((n$0@136@01 $Ref)) (!
    (implies
      (Set_in n$0@136@01 nodes@2@01)
      (= (inv@137@01 n$0@136@01) n$0@136@01))
    :pattern ((inv@137@01 n$0@136@01))
    :qid |right-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@137@01 r) nodes@2@01) (= (inv@137@01 r) r))
  :pattern ((inv@137@01 r))
  :qid |right-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@137@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@138@01  $FVF<$Ref>) r) r))
  :pattern ((inv@137@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@137@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@102@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@140@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@102@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@99@01 r)))
    :pattern (($FVF.lookup_right $t@99@01 r))
    :qid |qp.fvfValDef23|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@99@01 r) r)
  :pattern (($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) r))
  )))
(declare-const n$1@141@01 $Ref)
(declare-fun inv@142@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@143@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@143@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@143@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef24|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@143@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked $t@104@01 r))
    :qid |qp.fvfValDef24|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@104@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@143@01  $FVF<Bool>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$1@141@01 $Ref)) (!
    (implies
      (Set_in n$1@141@01 nodes@2@01)
      (= (inv@142@01 n$1@141@01) n$1@141@01))
    :pattern ((Set_in n$1@141@01 nodes@2@01))
    :qid |is_marked-invOfFct|))
  (forall ((n$1@141@01 $Ref)) (!
    (implies
      (Set_in n$1@141@01 nodes@2@01)
      (= (inv@142@01 n$1@141@01) n$1@141@01))
    :pattern ((inv@142@01 n$1@141@01))
    :qid |is_marked-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@142@01 r) nodes@2@01) (= (inv@142@01 r) r))
  :pattern ((inv@142@01 r))
  :qid |is_marked-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@142@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@143@01  $FVF<Bool>) r) r))
  :pattern ((inv@142@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@142@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@107@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@145@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@107@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@104@01 r)))
    :pattern (($FVF.lookup_is_marked $t@104@01 r))
    :qid |qp.fvfValDef25|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@104@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) r))
  )))
; [eval] (forall n$2: Ref :: { (n$2.left in nodes) } { (n$2 in nodes),n$2.left } (n$2 in nodes) && n$2.left != null ==> (n$2.left in nodes))
(declare-const n$2@146@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$2@146@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@146@01 nodes@2@01)
        (and
          (Set_in n$2@146@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01)))
      (implies
        (and
          (Set_in n$2@146@01 nodes@2@01)
          (implies
            (Set_in n$2@146@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
                $Ref.null))))
        (and
          (Set_in n$2@146@01 nodes@2@01)
          (implies
            (Set_in n$2@146@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$2@146@01 $Ref)) (!
    (and
      (implies
        (Set_in n$2@146@01 nodes@2@01)
        (and
          (Set_in n$2@146@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01)))
      (implies
        (and
          (Set_in n$2@146@01 nodes@2@01)
          (implies
            (Set_in n$2@146@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
                $Ref.null))))
        (and
          (Set_in n$2@146@01 nodes@2@01)
          (implies
            (Set_in n$2@146@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01))))
    :pattern ((Set_in n$2@146@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01))
    :qid |prog.l23-aux|))))
; 0.00s
; (get-info :all-statistics)
(assert (and
  (forall ((n$2@146@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@146@01 nodes@2@01)
        (implies
          (Set_in n$2@146@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) nodes@2@01))
    ))
  (forall ((n$2@146@01 $Ref)) (!
    (implies
      (and
        (Set_in n$2@146@01 nodes@2@01)
        (implies
          (Set_in n$2@146@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) nodes@2@01))
    :pattern ((Set_in n$2@146@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n$2@146@01) n$2@146@01))
    ))))
; [eval] (forall n$3: Ref :: { (n$3.right in nodes) } { (n$3 in nodes),n$3.right } (n$3 in nodes) && n$3.right != null ==> (n$3.right in nodes))
(declare-const n$3@148@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$3@148@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@148@01 nodes@2@01)
        (and
          (Set_in n$3@148@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01)))
      (implies
        (and
          (Set_in n$3@148@01 nodes@2@01)
          (implies
            (Set_in n$3@148@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
                $Ref.null))))
        (and
          (Set_in n$3@148@01 nodes@2@01)
          (implies
            (Set_in n$3@148@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) nodes@2@01))
    :qid |prog.l23-aux|))
  (forall ((n$3@148@01 $Ref)) (!
    (and
      (implies
        (Set_in n$3@148@01 nodes@2@01)
        (and
          (Set_in n$3@148@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01)))
      (implies
        (and
          (Set_in n$3@148@01 nodes@2@01)
          (implies
            (Set_in n$3@148@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
                $Ref.null))))
        (and
          (Set_in n$3@148@01 nodes@2@01)
          (implies
            (Set_in n$3@148@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01))))
    :pattern ((Set_in n$3@148@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01))
    :qid |prog.l23-aux|))))
; 0.00s
; (get-info :all-statistics)
(assert (and
  (forall ((n$3@148@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@148@01 nodes@2@01)
        (implies
          (Set_in n$3@148@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) nodes@2@01))
    ))
  (forall ((n$3@148@01 $Ref)) (!
    (implies
      (and
        (Set_in n$3@148@01 nodes@2@01)
        (implies
          (Set_in n$3@148@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) nodes@2@01))
    :pattern ((Set_in n$3@148@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n$3@148@01) n$3@148@01))
    ))))
; [eval] !node.is_marked
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)))
; 0.00s
; (get-info :all-statistics)
; 0.00s
; (get-info :all-statistics)
(assert (not
  ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01))))
(declare-const $t@150@01 $Snap)
(declare-const $t@151@01 $Snap)
(assert (= $t@150@01 ($Snap.combine $Snap.unit $t@151@01)))
; [eval] (node in nodes)
(declare-const $t@152@01 $Snap)
(assert (= $t@151@01 ($Snap.combine $Snap.unit $t@152@01)))
; [eval] !((null in nodes))
; [eval] (null in nodes)
(declare-const $t@153@01 $FVF<$Ref>)
(declare-const $t@154@01 $Snap)
(assert (=
  $t@152@01
  ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@153@01) $t@154@01)))
(declare-const n$4@155@01 $Ref)
(declare-fun inv@156@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$4@155@01 $Ref)) (!
    (implies
      (Set_in n$4@155@01 nodes@2@01)
      (= (inv@156@01 n$4@155@01) n$4@155@01))
    :pattern ((Set_in n$4@155@01 nodes@2@01))
    ))
  (forall ((n$4@155@01 $Ref)) (!
    (implies
      (Set_in n$4@155@01 nodes@2@01)
      (= (inv@156@01 n$4@155@01) n$4@155@01))
    :pattern ((inv@156@01 n$4@155@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@156@01 r) nodes@2@01) (= (inv@156@01 r) r))
  :pattern ((inv@156@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$4@155@01 $Ref)) (!
    (implies (Set_in n$4@155@01 nodes@2@01) (not (= n$4@155@01 $Ref.null)))
    :pattern ((Set_in n$4@155@01 nodes@2@01))
    ))
  (forall ((n$4@155@01 $Ref)) (!
    (implies (Set_in n$4@155@01 nodes@2@01) (not (= n$4@155@01 $Ref.null)))
    :pattern ((inv@156@01 n$4@155@01))
    ))))
(declare-const sm@157@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left $t@153@01 r))
    :qid |qp.fvfValDef26|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@153@01 r) r)
  :pattern (($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@156@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) r) r))
  :pattern ((inv@156@01 r))
  )))
(declare-const $t@158@01 $FVF<$Ref>)
(declare-const $t@159@01 $Snap)
(assert (=
  $t@154@01
  ($Snap.combine ($SortWrappers.$FVF<$Ref>To$Snap $t@158@01) $t@159@01)))
(declare-const n$5@160@01 $Ref)
(declare-fun inv@161@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$5@160@01 $Ref)) (!
    (implies
      (Set_in n$5@160@01 nodes@2@01)
      (= (inv@161@01 n$5@160@01) n$5@160@01))
    :pattern ((Set_in n$5@160@01 nodes@2@01))
    ))
  (forall ((n$5@160@01 $Ref)) (!
    (implies
      (Set_in n$5@160@01 nodes@2@01)
      (= (inv@161@01 n$5@160@01) n$5@160@01))
    :pattern ((inv@161@01 n$5@160@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@161@01 r) nodes@2@01) (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |right-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$5@160@01 $Ref)) (!
    (implies (Set_in n$5@160@01 nodes@2@01) (not (= n$5@160@01 $Ref.null)))
    :pattern ((Set_in n$5@160@01 nodes@2@01))
    ))
  (forall ((n$5@160@01 $Ref)) (!
    (implies (Set_in n$5@160@01 nodes@2@01) (not (= n$5@160@01 $Ref.null)))
    :pattern ((inv@161@01 n$5@160@01))
    ))))
(declare-const sm@162@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right $t@158@01 r))
    :qid |qp.fvfValDef27|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@158@01 r) r)
  :pattern (($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@161@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) r) r))
  :pattern ((inv@161@01 r))
  )))
(declare-const $t@163@01 $FVF<Bool>)
(declare-const $t@164@01 $Snap)
(assert (=
  $t@159@01
  ($Snap.combine ($SortWrappers.$FVF<Bool>To$Snap $t@163@01) $t@164@01)))
(declare-const n$6@165@01 $Ref)
(declare-fun inv@166@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$6@165@01 $Ref)) (!
    (implies
      (Set_in n$6@165@01 nodes@2@01)
      (= (inv@166@01 n$6@165@01) n$6@165@01))
    :pattern ((Set_in n$6@165@01 nodes@2@01))
    ))
  (forall ((n$6@165@01 $Ref)) (!
    (implies
      (Set_in n$6@165@01 nodes@2@01)
      (= (inv@166@01 n$6@165@01) n$6@165@01))
    :pattern ((inv@166@01 n$6@165@01))
    ))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@166@01 r) nodes@2@01) (= (inv@166@01 r) r))
  :pattern ((inv@166@01 r))
  :qid |is_marked-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (and
  (forall ((n$6@165@01 $Ref)) (!
    (implies (Set_in n$6@165@01 nodes@2@01) (not (= n$6@165@01 $Ref.null)))
    :pattern ((Set_in n$6@165@01 nodes@2@01))
    ))
  (forall ((n$6@165@01 $Ref)) (!
    (implies (Set_in n$6@165@01 nodes@2@01) (not (= n$6@165@01 $Ref.null)))
    :pattern ((inv@166@01 n$6@165@01))
    ))))
(declare-const sm@167@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef28|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked $t@163@01 r))
    :qid |qp.fvfValDef28|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@163@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) r))
  )))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@166@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) r) r))
  :pattern ((inv@166@01 r))
  )))
(declare-const $t@168@01 $Snap)
(assert (= $t@164@01 ($Snap.combine $Snap.unit $t@168@01)))
; [eval] (forall n$7: Ref :: { (n$7.left in nodes) } { (n$7 in nodes),n$7.left } (n$7 in nodes) && n$7.left != null ==> (n$7.left in nodes))
(declare-const n$7@169@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$7@169@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@169@01 nodes@2@01)
        (and
          (Set_in n$7@169@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01)))
      (implies
        (and
          (Set_in n$7@169@01 nodes@2@01)
          (implies
            (Set_in n$7@169@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
                $Ref.null))))
        (and
          (Set_in n$7@169@01 nodes@2@01)
          (implies
            (Set_in n$7@169@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$7@169@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@169@01 nodes@2@01)
        (and
          (Set_in n$7@169@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01)))
      (implies
        (and
          (Set_in n$7@169@01 nodes@2@01)
          (implies
            (Set_in n$7@169@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
                $Ref.null))))
        (and
          (Set_in n$7@169@01 nodes@2@01)
          (implies
            (Set_in n$7@169@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01))))
    :pattern ((Set_in n$7@169@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01))
    :qid |prog.l26-aux|))))
(assert (and
  (forall ((n$7@169@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@169@01 nodes@2@01)
        (implies
          (Set_in n$7@169@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) nodes@2@01))
    ))
  (forall ((n$7@169@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@169@01 nodes@2@01)
        (implies
          (Set_in n$7@169@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) nodes@2@01))
    :pattern ((Set_in n$7@169@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n$7@169@01) n$7@169@01))
    ))))
(declare-const $t@171@01 $Snap)
(assert (= $t@168@01 ($Snap.combine $Snap.unit $t@171@01)))
; [eval] (forall n$8: Ref :: { (n$8.right in nodes) } { (n$8 in nodes),n$8.right } (n$8 in nodes) && n$8.right != null ==> (n$8.right in nodes))
(declare-const n$8@172@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$8@172@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@172@01 nodes@2@01)
        (and
          (Set_in n$8@172@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01)))
      (implies
        (and
          (Set_in n$8@172@01 nodes@2@01)
          (implies
            (Set_in n$8@172@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
                $Ref.null))))
        (and
          (Set_in n$8@172@01 nodes@2@01)
          (implies
            (Set_in n$8@172@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$8@172@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@172@01 nodes@2@01)
        (and
          (Set_in n$8@172@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01)))
      (implies
        (and
          (Set_in n$8@172@01 nodes@2@01)
          (implies
            (Set_in n$8@172@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
                $Ref.null))))
        (and
          (Set_in n$8@172@01 nodes@2@01)
          (implies
            (Set_in n$8@172@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01))))
    :pattern ((Set_in n$8@172@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01))
    :qid |prog.l26-aux|))))
(assert (and
  (forall ((n$8@172@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@172@01 nodes@2@01)
        (implies
          (Set_in n$8@172@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) nodes@2@01))
    ))
  (forall ((n$8@172@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@172@01 nodes@2@01)
        (implies
          (Set_in n$8@172@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) nodes@2@01))
    :pattern ((Set_in n$8@172@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n$8@172@01) n$8@172@01))
    ))))
(declare-const $t@174@01 $Snap)
(assert (= $t@171@01 ($Snap.combine $Snap.unit $t@174@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } (n in nodes) ==> old(n.is_marked) ==> n.is_marked)
(declare-const n@175@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@175@01 $Ref)) (!
  (implies
    (Set_in n@175@01 nodes@2@01)
    (and
      (Set_in n@175@01 nodes@2@01)
      ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@175@01) n@175@01)
      (implies
        ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@175@01)
        (and
          ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@175@01)
          ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@175@01) n@175@01)))))
  :pattern ((Set_in n@175@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@175@01) n@175@01))
  :qid |prog.l29-aux|)))
(assert (forall ((n@175@01 $Ref)) (!
  (implies
    (and
      (Set_in n@175@01 nodes@2@01)
      ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@175@01))
    ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@175@01))
  :pattern ((Set_in n@175@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@175@01) n@175@01))
  )))
(declare-const $t@176@01 $Snap)
(assert (= $t@174@01 ($Snap.combine $Snap.unit $t@176@01)))
(assert ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)))
; 0.00s
; (get-info :all-statistics)
(assert ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@103@01  $FVF<$Ref>) node@3@01)))
(declare-const $t@177@01 $Snap)
(assert (= $t@176@01 ($Snap.combine $Snap.unit $t@177@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.left } (n in nodes) ==> n.left == old(n.left))
(declare-const n@178@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@178@01 $Ref)) (!
  (implies
    (Set_in n@178@01 nodes@2@01)
    (and
      (Set_in n@178@01 nodes@2@01)
      ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@178@01) n@178@01)
      ($FVF.loc_left ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n@178@01) n@178@01)))
  :pattern ((Set_in n@178@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@178@01) n@178@01))
  :qid |prog.l33-aux|)))
(assert (forall ((n@178@01 $Ref)) (!
  (implies
    (Set_in n@178@01 nodes@2@01)
    (=
      ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@178@01)
      ($FVF.lookup_left (as sm@135@01  $FVF<$Ref>) n@178@01)))
  :pattern ((Set_in n@178@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@178@01) n@178@01))
  )))
(declare-const $t@179@01 $Snap)
(assert (= $t@177@01 ($Snap.combine $Snap.unit $t@179@01)))
; [eval] (forall n: Ref :: { (n in nodes),n.right } (n in nodes) ==> n.right == old(n.right))
(declare-const n@180@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@180@01 $Ref)) (!
  (implies
    (Set_in n@180@01 nodes@2@01)
    (and
      (Set_in n@180@01 nodes@2@01)
      ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@180@01) n@180@01)
      ($FVF.loc_right ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n@180@01) n@180@01)))
  :pattern ((Set_in n@180@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@180@01) n@180@01))
  :qid |prog.l34-aux|)))
(assert (forall ((n@180@01 $Ref)) (!
  (implies
    (Set_in n@180@01 nodes@2@01)
    (=
      ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@180@01)
      ($FVF.lookup_right (as sm@140@01  $FVF<$Ref>) n@180@01)))
  :pattern ((Set_in n@180@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@180@01) n@180@01))
  )))
(assert (= $t@179@01 ($Snap.combine $Snap.unit $Snap.unit)))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } { (n in nodes),n.left.is_marked } (n in nodes) ==> old(!n.is_marked) && n.is_marked ==> n.left == null || n.left.is_marked)
(declare-const n@181@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n@181@01 $Ref)) (!
    (implies
      (Set_in n@181@01 nodes@2@01)
      (and
        (Set_in n@181@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01) n@181@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01) n@181@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01))
            ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) n@181@01)
            (implies
              (not
                (=
                  ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01))))))))
    :pattern ((Set_in n@181@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01) n@181@01))
    :qid |prog.l37-aux|))
  (forall ((n@181@01 $Ref)) (!
    (implies
      (Set_in n@181@01 nodes@2@01)
      (and
        (Set_in n@181@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01) n@181@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01) n@181@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01))
            ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) n@181@01)
            (implies
              (not
                (=
                  ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01))))))))
    :pattern ((Set_in n@181@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) n@181@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)))
    :qid |prog.l37-aux|))))
(assert (and
  (forall ((n@181@01 $Ref)) (!
    (implies
      (and
        (Set_in n@181@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01))))
      (or
        (= ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01))))))
    :pattern ((Set_in n@181@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01) n@181@01))
    ))
  (forall ((n@181@01 $Ref)) (!
    (implies
      (and
        (Set_in n@181@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@181@01))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@181@01))))
      (or
        (= ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01))))))
    :pattern ((Set_in n@181@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01) n@181@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)) ($FVF.lookup_left (as sm@157@01  $FVF<$Ref>) n@181@01)))
    ))))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } { (n in nodes),n.right.is_marked } (n in nodes) ==> old(!n.is_marked) && n.is_marked ==> n.right == null || n.right.is_marked)
(declare-const n@185@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n@185@01 $Ref)) (!
    (implies
      (Set_in n@185@01 nodes@2@01)
      (and
        (Set_in n@185@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01) n@185@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01) n@185@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01))
            ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) n@185@01)
            (implies
              (not
                (=
                  ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01))))))))
    :pattern ((Set_in n@185@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01) n@185@01))
    :qid |prog.l39-aux|))
  (forall ((n@185@01 $Ref)) (!
    (implies
      (Set_in n@185@01 nodes@2@01)
      (and
        (Set_in n@185@01 nodes@2@01)
        ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01) n@185@01)
        (implies
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01) n@185@01)))
        (implies
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01)))
          (and
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            (implies
              (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
              ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01))
            ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) n@185@01)
            (implies
              (not
                (=
                  ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                  $Ref.null))
              (and
                (not
                  (=
                    ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                    $Ref.null))
                ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01))))))))
    :pattern ((Set_in n@185@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) n@185@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)))
    :qid |prog.l39-aux|))))
(assert (and
  (forall ((n@185@01 $Ref)) (!
    (implies
      (and
        (Set_in n@185@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01))))
      (or
        (= ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01))))))
    :pattern ((Set_in n@185@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01) n@185@01))
    ))
  (forall ((n@185@01 $Ref)) (!
    (implies
      (and
        (Set_in n@185@01 nodes@2@01)
        (and
          (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
          (implies
            (not ($FVF.lookup_is_marked (as sm@145@01  $FVF<Bool>) n@185@01))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) n@185@01))))
      (or
        (= ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) $Ref.null)
        (and
          (not
            (= ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) $Ref.null))
          (implies
            (not
              (=
                ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)
                $Ref.null))
            ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01))))))
    :pattern ((Set_in n@185@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01) n@185@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@167@01  $FVF<Bool>) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)) ($FVF.lookup_right (as sm@162@01  $FVF<$Ref>) n@185@01)))
    ))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (node in nodes)
; [eval] !((null in nodes))
; [eval] (null in nodes)
(declare-const n$4@189@01 $Ref)
(declare-fun inv@190@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@191@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@191@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left (as sm@191@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef29|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@191@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left $t@153@01 r))
    :qid |qp.fvfValDef29|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@153@01 r) r)
  :pattern (($FVF.lookup_left (as sm@191@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$4@189@01 $Ref)) (!
    (implies
      (Set_in n$4@189@01 nodes@2@01)
      (= (inv@190@01 n$4@189@01) n$4@189@01))
    :pattern ((Set_in n$4@189@01 nodes@2@01))
    :qid |left-invOfFct|))
  (forall ((n$4@189@01 $Ref)) (!
    (implies
      (Set_in n$4@189@01 nodes@2@01)
      (= (inv@190@01 n$4@189@01) n$4@189@01))
    :pattern ((inv@190@01 n$4@189@01))
    :qid |left-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@190@01 r) nodes@2@01) (= (inv@190@01 r) r))
  :pattern ((inv@190@01 r))
  :qid |left-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@190@01 r) nodes@2@01)
    ($FVF.loc_left ($FVF.lookup_left (as sm@191@01  $FVF<$Ref>) r) r))
  :pattern ((inv@190@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@192@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@190@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@156@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@193@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@156@01 r) nodes@2@01)
      (=
        ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) r)
        ($FVF.lookup_left $t@153@01 r)))
    :pattern (($FVF.lookup_left $t@153@01 r))
    :qid |qp.fvfValDef30|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_left ($FVF.lookup_left $t@153@01 r) r)
  :pattern (($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) r))
  )))
(declare-const n$5@194@01 $Ref)
(declare-fun inv@195@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@196@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@196@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right (as sm@196@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@196@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right $t@158@01 r))
    :qid |qp.fvfValDef31|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@158@01 r) r)
  :pattern (($FVF.lookup_right (as sm@196@01  $FVF<$Ref>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$5@194@01 $Ref)) (!
    (implies
      (Set_in n$5@194@01 nodes@2@01)
      (= (inv@195@01 n$5@194@01) n$5@194@01))
    :pattern ((Set_in n$5@194@01 nodes@2@01))
    :qid |right-invOfFct|))
  (forall ((n$5@194@01 $Ref)) (!
    (implies
      (Set_in n$5@194@01 nodes@2@01)
      (= (inv@195@01 n$5@194@01) n$5@194@01))
    :pattern ((inv@195@01 n$5@194@01))
    :qid |right-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@195@01 r) nodes@2@01) (= (inv@195@01 r) r))
  :pattern ((inv@195@01 r))
  :qid |right-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@195@01 r) nodes@2@01)
    ($FVF.loc_right ($FVF.lookup_right (as sm@196@01  $FVF<$Ref>) r) r))
  :pattern ((inv@195@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@197@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@195@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@161@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@198@01 $FVF<$Ref>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) r))
    :qid |qp.fvfValDef32|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@161@01 r) nodes@2@01)
      (=
        ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) r)
        ($FVF.lookup_right $t@158@01 r)))
    :pattern (($FVF.lookup_right $t@158@01 r))
    :qid |qp.fvfValDef32|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_right ($FVF.lookup_right $t@158@01 r) r)
  :pattern (($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) r))
  )))
(declare-const n$6@199@01 $Ref)
(declare-fun inv@200@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(set-option :timeout 0)
; 0.00s
; (get-info :all-statistics)
(declare-const sm@201@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@201@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@201@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@201@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked $t@163@01 r))
    :qid |qp.fvfValDef33|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@163@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@201@01  $FVF<Bool>) r))
  )))
; Check receiver injectivity
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (and
  (forall ((n$6@199@01 $Ref)) (!
    (implies
      (Set_in n$6@199@01 nodes@2@01)
      (= (inv@200@01 n$6@199@01) n$6@199@01))
    :pattern ((Set_in n$6@199@01 nodes@2@01))
    :qid |is_marked-invOfFct|))
  (forall ((n$6@199@01 $Ref)) (!
    (implies
      (Set_in n$6@199@01 nodes@2@01)
      (= (inv@200@01 n$6@199@01) n$6@199@01))
    :pattern ((inv@200@01 n$6@199@01))
    :qid |is_marked-invOfFct|))))
(assert (forall ((r $Ref)) (!
  (implies (Set_in (inv@200@01 r) nodes@2@01) (= (inv@200@01 r) r))
  :pattern ((inv@200@01 r))
  :qid |is_marked-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (implies
    (Set_in (inv@200@01 r) nodes@2@01)
    ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@201@01  $FVF<Bool>) r) r))
  :pattern ((inv@200@01 r))
  )))
; Precomputing data for removing quantified permissions
(define-fun pTaken@202@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@200@01 r) nodes@2@01)
    ($Perm.min
      (ite (Set_in (inv@166@01 r) nodes@2@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 500)
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@203@01 $FVF<Bool>)
; Definitional axioms for snapshot map values
(assert (and
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) r))
    :qid |qp.fvfValDef34|))
  (forall ((r $Ref)) (!
    (implies
      (Set_in (inv@166@01 r) nodes@2@01)
      (=
        ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) r)
        ($FVF.lookup_is_marked $t@163@01 r)))
    :pattern (($FVF.lookup_is_marked $t@163@01 r))
    :qid |qp.fvfValDef34|))))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_is_marked ($FVF.lookup_is_marked $t@163@01 r) r)
  :pattern (($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) r))
  )))
; [eval] (forall n$7: Ref :: { (n$7.left in nodes) } { (n$7 in nodes),n$7.left } (n$7 in nodes) && n$7.left != null ==> (n$7.left in nodes))
(declare-const n$7@204@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$7@204@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@204@01 nodes@2@01)
        (and
          (Set_in n$7@204@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01)))
      (implies
        (and
          (Set_in n$7@204@01 nodes@2@01)
          (implies
            (Set_in n$7@204@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
                $Ref.null))))
        (and
          (Set_in n$7@204@01 nodes@2@01)
          (implies
            (Set_in n$7@204@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01))))
    :pattern ((Set_in ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$7@204@01 $Ref)) (!
    (and
      (implies
        (Set_in n$7@204@01 nodes@2@01)
        (and
          (Set_in n$7@204@01 nodes@2@01)
          ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01)))
      (implies
        (and
          (Set_in n$7@204@01 nodes@2@01)
          (implies
            (Set_in n$7@204@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
                $Ref.null))))
        (and
          (Set_in n$7@204@01 nodes@2@01)
          (implies
            (Set_in n$7@204@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
                $Ref.null)))
          ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01))))
    :pattern ((Set_in n$7@204@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01))
    :qid |prog.l26-aux|))))
; 0.01s
; (get-info :all-statistics)
(assert (and
  (forall ((n$7@204@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@204@01 nodes@2@01)
        (implies
          (Set_in n$7@204@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) nodes@2@01))
    ))
  (forall ((n$7@204@01 $Ref)) (!
    (implies
      (and
        (Set_in n$7@204@01 nodes@2@01)
        (implies
          (Set_in n$7@204@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) nodes@2@01))
    :pattern ((Set_in n$7@204@01 nodes@2@01) ($FVF.loc_left ($FVF.lookup_left (as sm@193@01  $FVF<$Ref>) n$7@204@01) n$7@204@01))
    ))))
; [eval] (forall n$8: Ref :: { (n$8.right in nodes) } { (n$8 in nodes),n$8.right } (n$8 in nodes) && n$8.right != null ==> (n$8.right in nodes))
(declare-const n$8@206@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (and
  (forall ((n$8@206@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@206@01 nodes@2@01)
        (and
          (Set_in n$8@206@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01)))
      (implies
        (and
          (Set_in n$8@206@01 nodes@2@01)
          (implies
            (Set_in n$8@206@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
                $Ref.null))))
        (and
          (Set_in n$8@206@01 nodes@2@01)
          (implies
            (Set_in n$8@206@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01))))
    :pattern ((Set_in ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) nodes@2@01))
    :qid |prog.l26-aux|))
  (forall ((n$8@206@01 $Ref)) (!
    (and
      (implies
        (Set_in n$8@206@01 nodes@2@01)
        (and
          (Set_in n$8@206@01 nodes@2@01)
          ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01)))
      (implies
        (and
          (Set_in n$8@206@01 nodes@2@01)
          (implies
            (Set_in n$8@206@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
                $Ref.null))))
        (and
          (Set_in n$8@206@01 nodes@2@01)
          (implies
            (Set_in n$8@206@01 nodes@2@01)
            (not
              (=
                ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
                $Ref.null)))
          ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01))))
    :pattern ((Set_in n$8@206@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01))
    :qid |prog.l26-aux|))))
; 0.00s
; (get-info :all-statistics)
(assert (and
  (forall ((n$8@206@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@206@01 nodes@2@01)
        (implies
          (Set_in n$8@206@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) nodes@2@01))
    :pattern ((Set_in ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) nodes@2@01))
    ))
  (forall ((n$8@206@01 $Ref)) (!
    (implies
      (and
        (Set_in n$8@206@01 nodes@2@01)
        (implies
          (Set_in n$8@206@01 nodes@2@01)
          (not
            (=
              ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01)
              $Ref.null))))
      (Set_in ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) nodes@2@01))
    :pattern ((Set_in n$8@206@01 nodes@2@01) ($FVF.loc_right ($FVF.lookup_right (as sm@198@01  $FVF<$Ref>) n$8@206@01) n$8@206@01))
    ))))
; [eval] (forall n: Ref :: { (n in nodes),n.is_marked } (n in nodes) ==> old(n.is_marked) ==> n.is_marked)
(declare-const n@208@01 $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((n@208@01 $Ref)) (!
  (implies
    (Set_in n@208@01 nodes@2@01)
    (and
      (Set_in n@208@01 nodes@2@01)
      ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) n@208@01) n@208@01)
      (implies
        ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) n@208@01)
        (and
          ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) n@208@01)
          ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) n@208@01) n@208@01)))))
  :pattern ((Set_in n@208@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) n@208@01) n@208@01))
  :qid |prog.l29-aux|)))
(push) ; 5
(assert (not (forall ((n@208@01 $Ref)) (!
  (implies
    (and
      (Set_in n@208@01 nodes@2@01)
      ($FVF.lookup_is_marked (as sm@66@01  $FVF<Bool>) n@208@01))
    ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) n@208@01))
  :pattern ((Set_in n@208@01 nodes@2@01) ($FVF.loc_is_marked ($FVF.lookup_is_marked (as sm@203@01  $FVF<Bool>) n@208@01) n@208@01))
  ))))
(check-sat)
; unsat
(pop) ; 5
