(set-logic ALL)
(set-option :print-success false)
(set-info :smt-lib-version 2.6)
(set-option :produce-models true)
;(set-option :smt.QI.EAGER_THRESHOLD 100)
;(set-option :smt.QI.LAZY_THRESHOLD 100)
;(set-option :smt.random_seed 1)
;(set-option :smt.mbqi false)
;(set-option :model.compact false)
;(set-option :model.v2 true)
;(set-option :pp.bv_literals false)
(set-option :produce-unsat-cores true)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(declare-sort T@$TypeName 0)
(declare-sort |T@[Int]$TypeValue| 0)
(declare-datatypes ((T@$TypeValue 0)(T@t 0)) (((bType ) ($IntegerType ) ($AddressType ) ($StrType ) ($VectorType (|t#$VectorType| T@$TypeValue) ) ($StructType (|name#$StructType| T@$TypeName) (|ts#$StructType| T@t) ) ($TypeType ) (err ) ) ((t (|v#t| |T@[Int]$TypeValue|) (|l#t| Int) ) ) ))
(declare-sort |T@[Int]$Value| 0)
(declare-datatypes ((T 0)(TArray 0)) (((b (B Bool) ) ($Integer (|i#$Integer| Int) ) ($Address (|a#$Address| Int) ) ($Vector (|v#$Vector| TArray) ) ($Range (|lb#$Range| T) (|ub#$Range| T) ) ($Type (|t#$Type| T@$TypeValue) ) ($Error ) ) (($ValueArray (R |T@[Int]$Value|) (|l#$ValueArray| Int) ) ) ))
(declare-sort |T@[t,Int]Bool| 0)
(declare-sort |T@[t,Int]$Value| 0)
(declare-datatypes ((T@$Memory 0)) ((($Memory (d |T@[t,Int]Bool|) (cm |T@[t,Int]$Value|) ) ) ))
(declare-datatypes ((T@$Location 0)) ((($Global (|ts#$Global| T@t) (|a#$Global| Int) ) ($Local (|i#$Local| Int) ) ($Param (|i#$Param| Int) ) ) ))
(declare-sort |T@[Int]Int| 0)
(declare-datatypes ((T@$Path 0)) ((($Path (|p#$Path| |T@[Int]Int|) (|size#$Path| Int) ) ) ))
(declare-datatypes ((T@$Mutation 0)) ((($Mutation (|l#$Mutation| T@$Location) (|p#$Mutation| T@$Path) (|v#$Mutation| T) ) ) ))
(declare-fun $Event_EventHandle () T@$TypeName)
(declare-fun $Event_EventHandleGenerator () T@$TypeName)
(declare-fun $FixedPoint32_FixedPoint32 () T@$TypeName)
(declare-fun $LibraTimestamp_CurrentTimeMicroseconds () T@$TypeName)
(declare-fun $Roles_RoleId () T@$TypeName)
(declare-fun $LibraConfig_LibraConfig () T@$TypeName)
(declare-fun $LibraConfig_Configuration () T@$TypeName)
(declare-fun $LibraConfig_ModifyConfigCapability () T@$TypeName)
(declare-fun $LibraConfig_NewEpochEvent () T@$TypeName)
(declare-fun $RegisteredCurrencies_RegisteredCurrencies () T@$TypeName)
(declare-fun $Libra () T@$TypeName)
(declare-fun $BurnCapability () T@$TypeName)
(declare-fun $BurnEvent () T@$TypeName)
(declare-fun $CancelBurnEvent () T@$TypeName)
(declare-fun $CurrencyInfo () T@$TypeName)
(declare-fun $MintCapability () T@$TypeName)
(declare-fun $MintEvent () T@$TypeName)
(declare-fun $Preburn () T@$TypeName)
(declare-fun $PreburnEvent () T@$TypeName)
(declare-fun $ToLBRExchangeRateUpdateEvent () T@$TypeName)
(declare-fun $DebugTrackLocal (Int Int Int T) Bool)
(declare-fun $DebugTrackAbort (Int Int Int) Bool)
(declare-fun $DebugTrackExp (Int Int T) T)
(declare-fun $EmptyPath () T@$Path)
(declare-fun e () T@t)
(declare-fun mc (T@$TypeValue) |T@[Int]$TypeValue|)
(declare-fun $MAX_U8 () Int)
(declare-fun $MAX_U64 () Int)
(declare-fun $MAX_U128 () Int)
(declare-fun $EmptyValueArray () TArray)
(declare-fun $MapConstValue (T) |T@[Int]$Value|)
(declare-fun $StratificationDepth () Int)
(declare-fun $IsEqual_stratified (T T) Bool)
(declare-fun $IsEqual_level1 (T T) Bool)
(declare-fun s (|T@[Int]$Value| Int) T)
(declare-fun $IsEqual_level2 (T T) Bool)
(declare-fun $ReadValue_stratified (T@$Path T) T)
(declare-fun $ReadValue_level1 (T@$Path T) T)
(declare-fun |Select_[$int]$int| (|T@[Int]Int| Int) Int)
(declare-fun $ReadValue_level2 (T@$Path T) T)
(declare-fun $UpdateValue_stratified (T@$Path Int T T) T)
(declare-fun |Store_[$int]$Value| (|T@[Int]$Value| Int T) |T@[Int]$Value|)
(declare-fun $UpdateValue_level1 (T@$Path Int T T) T)
(declare-fun $UpdateValue_level2 (T@$Path Int T T) T)
(declare-fun $IsPathPrefix_stratified (T@$Path T@$Path) Bool)
(declare-fun $IsPathPrefix_level1 (T@$Path T@$Path) Bool)
(declare-fun $IsPathPrefix_level2 (T@$Path T@$Path) Bool)
(declare-fun $ConcatPath_stratified (T@$Path T@$Path) T@$Path)
(declare-fun $ConcatPath_level1 (T@$Path T@$Path) T@$Path)
(declare-fun |Store_[$int]$int| (|T@[Int]Int| Int Int) |T@[Int]Int|)
(declare-fun $ConcatPath_level2 (T@$Path T@$Path) T@$Path)
(declare-fun $ConstMemoryDomain (Bool) |T@[t,Int]Bool|)
(declare-fun |lambda#5| (Bool) |T@[t,Int]Bool|)
(declare-fun $EmptyMemory () T@$Memory)
(declare-fun $ConstMemoryContent (T) |T@[t,Int]$Value|)
(declare-fun $EXEC_FAILURE_CODE () Int)
(declare-fun $power_of_2 (T) Int)
(declare-fun $shl (T T) T)
(declare-fun $shr (T T) T)
(declare-fun $Vector_$empty (T@$TypeValue) T)
(declare-fun $Vector_$push_back (T@$TypeValue T T) T)
(declare-fun $Vector_$pop_back (T@$TypeValue T) T)
(declare-fun $Vector_$length (T@$TypeValue T) T)
(declare-fun $Vector_$borrow (T@$TypeValue T T) T)
(declare-fun $Vector_$borrow_mut (T@$TypeValue T T) T)
(declare-fun $Vector_$swap (T@$TypeValue T T T) T)
(declare-fun $Hash_sha2_core (T) T)
(declare-fun $Hash_sha3_core (T) T)
(declare-fun $Signature_$ed25519_validate_pubkey (T) T)
(declare-fun $Signature_$ed25519_verify (T T T) T)
(declare-fun $LCS_serialize_core (T) T)
(declare-fun $LCS_serialize_core_inv (T) T)
(declare-fun $serialized_address_len () Int)
(declare-fun $Event_EventHandle_counter () Int)
(declare-fun $Event_EventHandle_guid () Int)
(declare-fun $Event_EventHandle_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun |Store_[$int]$TypeValue| (|T@[Int]$TypeValue| Int T@$TypeValue) |T@[Int]$TypeValue|)
(declare-fun |Select_[$int]$TypeValue| (|T@[Int]$TypeValue| Int) T@$TypeValue)
(declare-fun $Event_EventHandleGenerator_counter () Int)
(declare-fun $Event_EventHandleGenerator_addr () Int)
(declare-fun $Event_EventHandleGenerator_type_value () T@$TypeValue)
(declare-fun $FixedPoint32_FixedPoint32_value () Int)
(declare-fun $FixedPoint32_FixedPoint32_type_value () T@$TypeValue)
(declare-fun $LibraTimestamp_CurrentTimeMicroseconds_microseconds () Int)
(declare-fun $LibraTimestamp_CurrentTimeMicroseconds_type_value () T@$TypeValue)
(declare-fun $Roles_RoleId_role_id () Int)
(declare-fun $Roles_RoleId_type_value () T@$TypeValue)
(declare-fun $LibraConfig_LibraConfig_payload () Int)
(declare-fun $LibraConfig_LibraConfig_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $LibraConfig_Configuration_epoch () Int)
(declare-fun $LibraConfig_Configuration_last_reconfiguration_time () Int)
(declare-fun $LibraConfig_Configuration_events () Int)
(declare-fun $LibraConfig_Configuration_type_value () T@$TypeValue)
(declare-fun $LibraConfig_ModifyConfigCapability_dummy_field () Int)
(declare-fun $LibraConfig_ModifyConfigCapability_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $LibraConfig_NewEpochEvent_epoch () Int)
(declare-fun $LibraConfig_NewEpochEvent_type_value () T@$TypeValue)
(declare-fun c () Int)
(declare-fun $RegisteredCurrencies_RegisteredCurrencies_type_value () T@$TypeValue)
(declare-fun $value () Int)
(declare-fun $type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $BurnCapability_dummy_field () Int)
(declare-fun $BurnCapability_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $BurnEvent_amount () Int)
(declare-fun $BurnEvent_currency_code () Int)
(declare-fun $BurnEvent_preburn_address () Int)
(declare-fun $BurnEvent_type_value () T@$TypeValue)
(declare-fun $CancelBurnEvent_amount () Int)
(declare-fun $CancelBurnEvent_currency_code () Int)
(declare-fun $CancelBurnEvent_preburn_address () Int)
(declare-fun $CancelBurnEvent_type_value () T@$TypeValue)
(declare-fun $CurrencyInfo_total_value () Int)
(declare-fun $CurrencyInfo_preburn_value () Int)
(declare-fun $CurrencyInfo_to_lbr_exchange_rate () Int)
(declare-fun $CurrencyInfo_is_synthetic () Int)
(declare-fun $CurrencyInfo_scaling_factor () Int)
(declare-fun $CurrencyInfo_fractional_part () Int)
(declare-fun $CurrencyInfo_currency_code () Int)
(declare-fun $CurrencyInfo_can_mint () Int)
(declare-fun $CurrencyInfo_mint_events () Int)
(declare-fun $CurrencyInfo_burn_events () Int)
(declare-fun $CurrencyInfo_preburn_events () Int)
(declare-fun $CurrencyInfo_cancel_burn_events () Int)
(declare-fun $CurrencyInfo_exchange_rate_update_events () Int)
(declare-fun $CurrencyInfo_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $MintCapability_dummy_field () Int)
(declare-fun $MintCapability_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $MintEvent_amount () Int)
(declare-fun $MintEvent_currency_code () Int)
(declare-fun $MintEvent_type_value () T@$TypeValue)
(declare-fun $Preburn_to_burn () Int)
(declare-fun $Preburn_type_value (T@$TypeValue) T@$TypeValue)
(declare-fun $PreburnEvent_amount () Int)
(declare-fun $PreburnEvent_currency_code () Int)
(declare-fun $PreburnEvent_preburn_address () Int)
(declare-fun $PreburnEvent_type_value () T@$TypeValue)
(declare-fun $ToLBRExchangeRateUpdateEvent_currency_code () Int)
(declare-fun $ToLBRExchangeRateUpdateEvent_new_to_lbr_exchange_rate () Int)
(declare-fun $ToLBRExchangeRateUpdateEvent_type_value () T@$TypeValue)
(declare-fun |lambda#0| (Int Int |T@[Int]$Value| T) |T@[Int]$Value|)
(declare-fun |lambda#1| (Int Int Int |T@[Int]$Value| |T@[Int]$Value| Int T) |T@[Int]$Value|)
(declare-fun |lambda#2| (Int Int Int |T@[Int]$Value| |T@[Int]$Value| Int T) |T@[Int]$Value|)
(declare-fun |lambda#3| (Int Int |T@[Int]$Value| Int Int T) |T@[Int]$Value|)
(declare-fun |lambda#4| (Int Int |T@[Int]$Value| Int T) |T@[Int]$Value|)
(declare-fun sl (|T@[t,Int]Bool| T@t Int) Bool)



; Valid
(declare-fun ControlFlow (Int Int) Int)
(declare-fun scaling_factor () T)
(declare-fun $abort_flag@10 () Bool)
(declare-fun $CurrencyInfo_$memory () T@$Memory)
(declare-fun $tv0@@7 () T@$TypeValue)
(declare-fun lr_account () T)
(declare-fun $Roles_RoleId_$memory () T@$Memory)
(declare-fun |Select_[t,$int]$Value| (|T@[t,Int]$Value| T@t Int) T)
(declare-fun $LibraConfig_LibraConfig_$memory () T@$Memory)
(declare-fun currency_code () T)
(declare-fun $LibraConfig_ModifyConfigCapability_$memory () T@$Memory)
(declare-fun $LibraTimestamp_CurrentTimeMicroseconds_$memory () T@$Memory)
(declare-fun $LibraConfig_Configuration_$memory () T@$Memory)
(declare-fun $abort_code@16 () Int)
(declare-fun $CurrencyInfo_$memory@1 () T@$Memory)
(declare-fun $MintCapability_$memory () T@$Memory)
(declare-fun $BurnCapability_$memory () T@$Memory)
(declare-fun $Preburn_$memory () T@$Memory)
(declare-fun |inline$$MoveToRaw$0$m'@2| () T@$Memory)
(declare-fun $abort_flag@9 () Bool)
(declare-fun $LibraConfig_Configuration_$memory@4 () T@$Memory)
(declare-fun $LibraConfig_Configuration_$memory@2 () T@$Memory)
(declare-fun $LibraConfig_LibraConfig_$memory@4 () T@$Memory)
(declare-fun $LibraConfig_LibraConfig_$memory@2 () T@$Memory)
(declare-fun $abort_code@14 () Int)
(declare-fun inline$$BurnCapability_pack$0$$struct@1 () T)
(declare-fun inline$$MintCapability_pack$0$$struct@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t39@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t37@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$ret0@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$ret1@1 () T)
(declare-fun $CurrencyInfo_$memory@0 () T@$Memory)
(declare-fun $LibraConfig_Configuration_$memory@3 () T@$Memory)
(declare-fun $LibraConfig_LibraConfig_$memory@3 () T@$Memory)
(declare-fun $abort_code@15 () Int)
(declare-fun $abort_flag@8 () Bool)
(declare-fun $abort_code@12 () Int)
(declare-fun $LibraConfig_LibraConfig_$memory@0 () T@$Memory)
(declare-fun $LibraConfig_Configuration_$memory@0 () T@$Memory)
(declare-fun $abort_code@13 () Int)
(declare-fun $LibraConfig_LibraConfig_$memory@1 () T@$Memory)
(declare-fun $LibraConfig_Configuration_$memory@1 () T@$Memory)
(declare-fun call0formal@$tv0@0 () T@$TypeValue)
(declare-fun |inline$$WritebackToValue$0$vdst'@2| () T)
(declare-fun |inline$$WritebackToReference$0$dst'@2| () T@$Mutation)
(declare-fun call3formal@$ret0@0 () T)
(declare-fun |inline$$WritebackToValue$0$vdst'@1| () T)
(declare-fun inline$$BorrowLoc$0$dst@1 () T@$Mutation)
(declare-fun |inline$$WriteRef$0$to'@1| () T@$Mutation)
(declare-fun inline$$WritebackToReference$0$dstPath@1 () T@$Path)
(declare-fun inline$$WritebackToReference$0$srcPath@1 () T@$Path)
(declare-fun |inline$$WritebackToReference$0$dst'@1| () T@$Mutation)
(declare-fun inline$$BorrowField$0$dst@1 () T@$Mutation)
(declare-fun |inline$$Vector_push_back$0$v'@1| () T)
(declare-fun $abort_flag@7 () Bool)
(declare-fun $abort_code@10 () Int)
(declare-fun inline$$ReadRef$0$v@1 () T)
(declare-fun inline$$Vector_push_back$0$ta@0 () T@$TypeValue)
(declare-fun inline$$BorrowField$0$p@1 () T@$Path)
(declare-fun inline$$BorrowField$0$size@1 () Int)
(declare-fun inline$$BorrowField$0$p@2 () T@$Path)
(declare-fun inline$$Not$1$dst@1 () T)
(declare-fun $abort_code@11 () Int)
(declare-fun call3formal@$ret0@0@@0 () T)
(declare-fun inline$$RegisteredCurrencies_add_currency_code_$def$0$$t10@1 () T)
(declare-fun inline$$Vector_contains$0$res@1 () T)
(declare-fun $abort_flag@6 () Bool)
(declare-fun $abort_code@9 () Int)
(declare-fun inline$$GetFieldFromValue$0$dst@1 () T)
(declare-fun inline$$Vector_contains$0$ta@0 () T@$TypeValue)
(declare-fun call0formal@$tv0@0@@0 () T@$TypeValue)
(declare-fun $abort_flag@5 () Bool)
(declare-fun $abort_code@8 () Int)
(declare-fun |inline$$MoveToRaw$0$m'@0| () T@$Memory)
(declare-fun inline$$MoveTo$0$ta@0 () T@t)
(declare-fun inline$$MoveTo$0$a@1 () Int)
(declare-fun |inline$$MoveToRaw$0$m'@1| () T@$Memory)
(declare-fun |Store_[t,$int]$bool| (|T@[t,Int]Bool| T@t Int Bool) |T@[t,Int]Bool|)
(declare-fun |Store_[t,$int]$Value| (|T@[t,Int]$Value| T@t Int T) |T@[t,Int]$Value|)


(declare-fun inline$$CurrencyInfo_pack$0$$struct@1 () T)
(declare-fun $abort_flag@4 () Bool)
(declare-fun $abort_code@6 () Int)
(declare-fun inline$$register_currency_$def_verify$0$$t28@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t29@1 () T)
(declare-fun to_lbr_exchange_rate () T)
(declare-fun is_synthetic () T)
(declare-fun fractional_part () T)
(declare-fun inline$$register_currency_$def_verify$0$$t30@1 () T)
(declare-fun inline$$Event_new_event_handle$0$res@0 () T)
(declare-fun inline$$Event_new_event_handle$1$res@0 () T)
(declare-fun inline$$Event_new_event_handle$2$res@0 () T)
(declare-fun inline$$Event_new_event_handle$3$res@0 () T)
(declare-fun inline$$Event_new_event_handle$4$res@0 () T)
(declare-fun inline$$Event_new_event_handle$4$t@0 () T@$TypeValue)
(declare-fun inline$$Event_new_event_handle$3$t@0 () T@$TypeValue)
(declare-fun inline$$Event_new_event_handle$2$t@0 () T@$TypeValue)
(declare-fun inline$$Event_new_event_handle$1$t@0 () T@$TypeValue)
(declare-fun inline$$Event_new_event_handle$0$t@0 () T@$TypeValue)
(declare-fun |inline$$register_currency_$def_verify$0$tmp#$10@1| () T)
(declare-fun $abort_code@7 () Int)
(declare-fun call3formal@$ret0@0@@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t26@1 () T)
(declare-fun inline$$Le$0$dst@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t24@1 () T)
(declare-fun inline$$Lt$0$dst@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t25@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t22@1 () T)
(declare-fun inline$$Not$0$dst@1 () T)
(declare-fun $abort_code@5 () Int)
(declare-fun call3formal@$ret0@0@@2 () T)
(declare-fun $abort_flag@3 () Bool)
(declare-fun $abort_code@4 () Int)
(declare-fun inline$$register_currency_$def_verify$0$$t20@1 () T)
(declare-fun inline$$register_currency_$def_verify$0$$t18@1 () T)
(declare-fun $abort_flag@2 () Bool)
(declare-fun call3formal@$ret0@0@@3 () T)
(declare-fun $abort_code@3 () Int)
(declare-fun $abort_flag@1 () Bool)
(declare-fun $abort_code@2 () Int)
(declare-fun $abort_flag@0 () Bool)
(declare-fun $abort_code@1 () Int)
(declare-fun $RegisteredCurrencies_RegisteredCurrencies_$memory () T@$Memory)



(assert (! 
(forall ((v1@@6 T) (v2@@6 T) ) (!  (=> ($IsEqual_stratified v1@@6 v2@@6) (= ($LCS_serialize_core v1@@6) ($LCS_serialize_core v2@@6)))
 :qid |Libramov.1335:15|
 :skolemid |42|
)) :named A1))
(assert (! 
(forall ((v@@11 T) ) (! (= ($LCS_serialize_core_inv ($LCS_serialize_core v@@11)) v@@11)
 :qid |Libramov.1337:15|
 :skolemid |43|
)) :named A2))
(assert (! 
(forall ( ( ?x0 |T@[Int]$Value|) ( ?x1 Int) ( ?x2 T)) (= (s (|Store_[$int]$Value| ?x0 ?x1 ?x2) ?x1)  ?x2)) :named A7))
(assert (! 
(forall ( ( ?x0 |T@[Int]$Value|) ( ?x1 Int) ( ?y1 Int) ( ?x2 T)) (=>  (not (= ?x1 ?y1)) (= (s (|Store_[$int]$Value| ?x0 ?x1 ?x2) ?y1) (s ?x0 ?y1)))) :named A8))

(assert
(forall ((coin_type@@5 T) ) (!  (=> (is-$Type coin_type@@5) (B (b 
(forall ((addr3@@1 T) ) (!  (=> 
(is-$Address addr3@@1) 

(B (b 
  (=> 
    (B (b (sl (d $MintCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 (|t#$Type| coin_type@@5)) 1) (|a#$Address| addr3@@1)))) (B (b  
(and (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 (|t#$Type| coin_type@@5)) 1) (|a#$Address| ($Address 173345816))))) (B (b  (not (B (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 (|t#$Type| coin_type@@5)) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_is_synthetic))))))))))))
 :qid |Libramov.19153:113|
 :skolemid |741|
)))))
 :qid |Libramov.19153:40|
 :skolemid |742|
))
)

(assert (= $BurnEvent_amount 0))
(assert (= $BurnEvent_currency_code 1))
(assert (= $BurnEvent_preburn_address 2))
(assert (= $BurnEvent_type_value ($StructType $BurnEvent e)))
(assert (= $CancelBurnEvent_amount 0))
(assert (= $CancelBurnEvent_currency_code 1))
(assert (= $CancelBurnEvent_preburn_address 2))
(assert (= $CancelBurnEvent_type_value ($StructType $CancelBurnEvent e)))
(assert (= $CurrencyInfo_total_value 0))
(assert (= $CurrencyInfo_preburn_value 1))
(assert (= $CurrencyInfo_to_lbr_exchange_rate 2))
(assert (= $CurrencyInfo_is_synthetic 3))
(assert (= $CurrencyInfo_scaling_factor 4))
(assert (= $CurrencyInfo_fractional_part 5))
(assert (= $CurrencyInfo_currency_code 6))
(assert (= $CurrencyInfo_can_mint 7))
(assert (= $CurrencyInfo_mint_events 8))
(assert (= $CurrencyInfo_burn_events 9))
(assert (= $CurrencyInfo_preburn_events 10))
(assert (= $CurrencyInfo_cancel_burn_events 11))
(assert (= $CurrencyInfo_exchange_rate_update_events 12))

(assert (not
 (=> 
 
 (= (ControlFlow 0 0) 462929) 
 
 (let ((anon0$2_correct  
 
(and 
  (=> (= (ControlFlow 0 277806) (- 0 471201)) (=> (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) $abort_flag@10)) 
  (=> (=> (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471238)) (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account)))) $abort_flag@10)) (=> (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account)))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471264)) (=> (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) $abort_flag@10)) (=> (=> (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471285)) (=> (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) $abort_flag@10)) (=> (=> (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471314)) (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@10)) (=> (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471331)) (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@10)) (=> (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471348)) (=> (B (b (let (($range_1 (s (R (|v#$Vector| (let ((addr ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr)))) $LibraConfig_LibraConfig_payload)))) c)))


(exists (($i_0 Int) ) (!  
(and 
(and (>= $i_0 0) (< $i_0 (|l#$ValueArray| (|v#$Vector| $range_1)))) (let ((x@@8 (s (R (|v#$Vector| $range_1)) $i_0)))
(B (b ($IsEqual_stratified x@@8 currency_code)))))
 :qid |Libramov.2739:42|
 :skolemid |46|
))

))) $abort_flag@10)) (=> (=> (B (b (let (($range_1 (s (R (|v#$Vector| (let ((addr ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr)))) $LibraConfig_LibraConfig_payload)))) c)))


true

))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471370)) (=> (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account))))))) $abort_flag@10)) (=> (=> (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account))))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471403)) (=> (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816)))))))) $abort_flag@10)) (=> (=> (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816)))))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471433)) (=> (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) $abort_flag@10)) (=> (=> (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) $abort_flag@10) 
(and (=> (= (ControlFlow 0 277806) (- 0 471516)) (=> $abort_flag@10 (or (or (or (or (or (or (or (or (or (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account))))) (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account)))))))) (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0)))))) (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816)))))) (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816)))))) (B (b (let (($range_1@@0 (s (R (|v#$Vector| (let ((addr@@0 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr@@0)))) $LibraConfig_LibraConfig_payload)))) c)))
true

)))) (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account)))))))) (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816))))))))) (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time)))))))))) (=> (=> $abort_flag@10 (or (or (or (or (or (or (or (or (or (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account))))) (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account)))))))) (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0)))))) (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816)))))) (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816)))))) (B (b (let (($range_1@@0 (s (R (|v#$Vector| (let ((addr@@0 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr@@0)))) $LibraConfig_LibraConfig_payload)))) c)))
true

)))) (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account)))))))) (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816))))))))) (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 471822)) (=> $abort_flag@10 (or (or (or (or (or (or (or (or (or 
(and (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) (= $abort_code@16 (|i#$Integer| ($Integer 7)))) 
(and (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account)))) (= $abort_code@16 (|i#$Integer| ($Integer 6))))) 
(and (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) (= $abort_code@16 (|i#$Integer| ($Integer 5))))) 
(and (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) (= $abort_code@16 (|i#$Integer| ($Integer 3))))) 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@16 (|i#$Integer| ($Integer 2))))) 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@16 (|i#$Integer| ($Integer 2))))) 
(and (B (b (let (($range_1@@1 (s (R (|v#$Vector| (let ((addr@@1 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr@@1)))) $LibraConfig_LibraConfig_payload)))) c)))
true

))) (= $abort_code@16 (|i#$Integer| ($Integer 7))))) 
(and (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account))))))) (= $abort_code@16 (|i#$Integer| ($Integer 4))))) 
(and (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816)))))))) (= $abort_code@16 (|i#$Integer| ($Integer 5))))) 
(and (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) (= $abort_code@16 (|i#$Integer| ($Integer 1))))))) (=> (=> $abort_flag@10 (or (or (or (or (or (or (or (or (or 
(and (B (b  (or (B (b ($IsEqual_stratified scaling_factor ($Integer 0)))) (B (b (> (|i#$Integer| scaling_factor) (|i#$Integer| ($Integer 10000000000)))))))) (= $abort_code@16 (|i#$Integer| ($Integer 7)))) 
(and (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| lr_account)))) (= $abort_code@16 (|i#$Integer| ($Integer 6))))) 
(and (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) (= $abort_code@16 (|i#$Integer| ($Integer 5))))) 
(and (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) (= $abort_code@16 (|i#$Integer| ($Integer 3))))) 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@16 (|i#$Integer| ($Integer 2))))) 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@16 (|i#$Integer| ($Integer 2))))) 
(and (B (b (let (($range_1@@1 (s (R (|v#$Vector| (let ((addr@@1 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| addr@@1)))) $LibraConfig_LibraConfig_payload)))) c)))
true

))) (= $abort_code@16 (|i#$Integer| ($Integer 7))))) 
(and (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| lr_account))))))) (= $abort_code@16 (|i#$Integer| ($Integer 4))))) 
(and (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $RegisteredCurrencies_RegisteredCurrencies_type_value) 1) (|a#$Address| ($Address 173345816)))))))) (= $abort_code@16 (|i#$Integer| ($Integer 5))))) 
(and (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) (= $abort_code@16 (|i#$Integer| ($Integer 1)))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472238)) (=> (not $abort_flag@10) (B (b (sl (d $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))))) (=> (=> (not $abort_flag@10) (B (b (sl (d $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816)))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472250)) (=> (not $abort_flag@10) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value) ($Integer 0)))))) (=> (=> (not $abort_flag@10) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value) ($Integer 0))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472274)) (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)))))))))) (=> (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value))))))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472320)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472400)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472468)) (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (>= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)))))))))) (=> (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (>= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_total_value))))))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472514)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472594)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472662)) (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (>= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)))))))))) (=> (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (>= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value))))))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472708)) (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)))))))))) (=> (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value)) (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_preburn_value))))))))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472754)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) 
(and (=> (= (ControlFlow 0 277806) (- 0 472834)) (=> (not $abort_flag@10) (B (b 
true)))) (=> (=> (not $abort_flag@10) (B (b 
true))) (=> (= (ControlFlow 0 277806) (- 0 472902)) (=> (not $abort_flag@10) (B (b  (=> (B (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory@1) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_to_lbr_exchange_rate) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| ($Address 173345816))))) $CurrencyInfo_to_lbr_exchange_rate)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((inline$$register_currency_$def_verify$0$anon54_correct  (=> 
(and (= $CurrencyInfo_$memory@1 |inline$$MoveToRaw$0$m'@2|) (= $abort_flag@10 $abort_flag@9)) (=> 
(and 
(and (= $LibraConfig_Configuration_$memory@4 $LibraConfig_Configuration_$memory@2) (= $LibraConfig_LibraConfig_$memory@4 $LibraConfig_LibraConfig_$memory@2)) 
(and (= $abort_code@16 $abort_code@14) (= (ControlFlow 0 277439) 277806))) anon0$2_correct))))
(let ((inline$$register_currency_$def_verify$0$anon81_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 277437) 277439)) inline$$register_currency_$def_verify$0$anon54_correct)))
(let ((inline$$register_currency_$def_verify$0$anon81_Then_correct  (=> 
(and ($DebugTrackLocal 7 39787 42 inline$$BurnCapability_pack$0$$struct@1) (= (ControlFlow 0 277453) 277439)) inline$$register_currency_$def_verify$0$anon54_correct)))
(let ((inline$$register_currency_$def_verify$0$anon80_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 277427) 277453) inline$$register_currency_$def_verify$0$anon81_Then_correct) (=> (= (ControlFlow 0 277427) 277437) inline$$register_currency_$def_verify$0$anon81_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon80_Then_correct  (=> ($DebugTrackLocal 7 39787 41 inline$$MintCapability_pack$0$$struct@1) 
(and (=> (= (ControlFlow 0 277467) 277453) inline$$register_currency_$def_verify$0$anon81_Then_correct) (=> (= (ControlFlow 0 277467) 277437) inline$$register_currency_$def_verify$0$anon81_Else_correct)))))
(let ((inline$$BurnCapability_pack$0$anon2_Else_correct  (=> (>= 0 0) 
(and (=> (= (ControlFlow 0 277393) 277467) inline$$register_currency_$def_verify$0$anon80_Then_correct) (=> (= (ControlFlow 0 277393) 277427) inline$$register_currency_$def_verify$0$anon80_Else_correct)))))
(let ((inline$$BurnCapability_pack$0$anon2_Then_correct  (=> 
(and (> 0 0) ($DebugTrackLocal 0 0 0 inline$$BurnCapability_pack$0$$struct@1)) 
(and (=> (= (ControlFlow 0 277411) 277467) inline$$register_currency_$def_verify$0$anon80_Then_correct) (=> (= (ControlFlow 0 277411) 277427) inline$$register_currency_$def_verify$0$anon80_Else_correct)))))
(let ((inline$$BurnCapability_pack$0$anon0_correct  (=> 
(and (is-b inline$$register_currency_$def_verify$0$$t39@1) (= inline$$BurnCapability_pack$0$$struct@1 ($Vector ($ValueArray (|Store_[$int]$Value| ($MapConstValue $Error) 0 inline$$register_currency_$def_verify$0$$t39@1) 1)))) 
(and (=> (= (ControlFlow 0 277385) 277411) inline$$BurnCapability_pack$0$anon2_Then_correct) (=> (= (ControlFlow 0 277385) 277393) inline$$BurnCapability_pack$0$anon2_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon79_Else$1_correct  (=> 
(and (= inline$$register_currency_$def_verify$0$$t39@1 (b false)) (= (ControlFlow 0 277417) 277385)) inline$$BurnCapability_pack$0$anon0_correct)))
(let ((inline$$MintCapability_pack$0$anon2_Else_correct  (=> 
(and (>= 0 0) (= (ControlFlow 0 277243) 277417)) inline$$register_currency_$def_verify$0$anon79_Else$1_correct)))
(let ((inline$$MintCapability_pack$0$anon2_Then_correct  (=> (> 0 0) (=> 
(and ($DebugTrackLocal 0 0 0 inline$$MintCapability_pack$0$$struct@1) (= (ControlFlow 0 277261) 277417)) inline$$register_currency_$def_verify$0$anon79_Else$1_correct))))
(let ((inline$$MintCapability_pack$0$anon0_correct  (=> 
(and (is-b inline$$register_currency_$def_verify$0$$t37@1) (= inline$$MintCapability_pack$0$$struct@1 ($Vector ($ValueArray (|Store_[$int]$Value| ($MapConstValue $Error) 0 inline$$register_currency_$def_verify$0$$t37@1) 1)))) 
(and (=> (= (ControlFlow 0 277235) 277261) inline$$MintCapability_pack$0$anon2_Then_correct) (=> (= (ControlFlow 0 277235) 277243) inline$$MintCapability_pack$0$anon2_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon79_Else_correct  (=> (not $abort_flag@9) (=> 
(and (= inline$$register_currency_$def_verify$0$$t37@1 (b false)) (= (ControlFlow 0 277267) 277235)) inline$$MintCapability_pack$0$anon0_correct))))
(let ((inline$$register_currency_$def_verify$0$Abort_correct  (=> 
(and 
(and 
(and (= inline$$register_currency_$def_verify$0$$ret0@1 $Error) (= inline$$register_currency_$def_verify$0$$ret1@1 $Error)) 
(and (= $CurrencyInfo_$memory@1 $CurrencyInfo_$memory@0) (= $abort_flag@10 true))) 
(and 
(and (= $LibraConfig_Configuration_$memory@4 $LibraConfig_Configuration_$memory@3) (= $LibraConfig_LibraConfig_$memory@4 $LibraConfig_LibraConfig_$memory@3)) 
(and (= $abort_code@16 $abort_code@15) (= (ControlFlow 0 273837) 277806)))) anon0$2_correct)))
(let ((inline$$register_currency_$def_verify$0$anon79_Then_correct  (=> 
(and $abort_flag@9 (= $abort_code@15 $abort_code@14)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 |inline$$MoveToRaw$0$m'@2|) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory@2)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory@2) (= (ControlFlow 0 277471) 273837))) inline$$register_currency_$def_verify$0$Abort_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon27_Else_correct  (=> (not $abort_flag@8) (=> 
(and 
(and (= $abort_code@14 $abort_code@12) (= $abort_flag@9 $abort_flag@8)) 
(and (= $LibraConfig_LibraConfig_$memory@2 $LibraConfig_LibraConfig_$memory@0) (= $LibraConfig_Configuration_$memory@2 $LibraConfig_Configuration_$memory@0))) 
(and (=> (= (ControlFlow 0 277013) 277471) inline$$register_currency_$def_verify$0$anon79_Then_correct) (=> (= (ControlFlow 0 277013) 277267) inline$$register_currency_$def_verify$0$anon79_Else_correct))))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct  (=> 
(and 
(and (= $abort_code@14 $abort_code@13) (= $abort_flag@9 true)) 
(and (= $LibraConfig_LibraConfig_$memory@2 $LibraConfig_LibraConfig_$memory@1) (= $LibraConfig_Configuration_$memory@2 $LibraConfig_Configuration_$memory@1))) 
(and (=> (= (ControlFlow 0 276301) 277471) inline$$register_currency_$def_verify$0$anon79_Then_correct) (=> (= (ControlFlow 0 276301) 277267) inline$$register_currency_$def_verify$0$anon79_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon27_Then_correct  (=> 
(and $abort_flag@8 ($DebugTrackAbort 10 1898 $abort_code@12)) (=> 
(and 
(and (= $abort_code@13 $abort_code@12) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory@0)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory@0) (= (ControlFlow 0 277025) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Else$3_correct  (=> 
(and 
(and 
(and (= call0formal@$tv0@0 $RegisteredCurrencies_RegisteredCurrencies_type_value) (=> (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| lr_account))))))) $abort_flag@8)) 
(and (=> (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| ($Address 173345816)))))))) $abort_flag@8) (=> (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) $abort_flag@8))) 
(and 
(and (=> $abort_flag@8 (or (or (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| lr_account))))))) (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| ($Address 173345816))))))))) (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))))) (=> $abort_flag@8 (or (or 
(and (B (b  (not (B (b (sl (d $LibraConfig_ModifyConfigCapability_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| lr_account))))))) (= $abort_code@12 (|i#$Integer| ($Integer 4)))) 
(and (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| ($Address 173345816)))))))) (= $abort_code@12 (|i#$Integer| ($Integer 5))))) 
(and (B (b  
(and (B (b  
(and (B (b  
(and (B (b (sl (d $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) (B (b (> (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds)) (|i#$Integer| ($Integer 0)))))))) (B (b (< (|i#$Integer| (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_epoch)) (|i#$Integer| ($Integer 18446744073709551615)))))))) (B (b ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraTimestamp_CurrentTimeMicroseconds_$memory) e (|a#$Address| ($Address 173345816))))) $LibraTimestamp_CurrentTimeMicroseconds_microseconds) (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_Configuration_$memory) e (|a#$Address| ($Address 173345816))))) $LibraConfig_Configuration_last_reconfiguration_time))))))) (= $abort_code@12 (|i#$Integer| ($Integer 1))))))) 
(and (=> (not $abort_flag@8) (B (b (sl (d $LibraConfig_LibraConfig_$memory@0) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| ($Address 173345816)))))) (=> (not $abort_flag@8) (B (b ($IsEqual_stratified (let ((addr@@14 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory@0) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0) 1) (|a#$Address| addr@@14)))) $LibraConfig_LibraConfig_payload)) |inline$$WritebackToValue$0$vdst'@2|))))))) 
(and (=> (= (ControlFlow 0 277007) 277025) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon27_Then_correct) (=> (= (ControlFlow 0 277007) 277013) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon27_Else_correct)))))
(let ((inline$$WritebackToValue$0$anon3_Else_correct  (=> (not (= (|l#$Mutation| |inline$$WritebackToReference$0$dst'@2|) ($Local 2))) (=> 
(and (= |inline$$WritebackToValue$0$vdst'@2| call3formal@$ret0@0) (= (ControlFlow 0 276973) 277007)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Else$3_correct))))
(let ((inline$$WritebackToValue$0$anon3_Then_correct  (=> 
(and 
(and (= (|l#$Mutation| |inline$$WritebackToReference$0$dst'@2|) ($Local 2)) (= |inline$$WritebackToValue$0$vdst'@1| ($UpdateValue_stratified (|p#$Mutation| |inline$$WritebackToReference$0$dst'@2|) 0 call3formal@$ret0@0 (|v#$Mutation| |inline$$WritebackToReference$0$dst'@2|)))) 
(and (= |inline$$WritebackToValue$0$vdst'@2| |inline$$WritebackToValue$0$vdst'@1|) (= (ControlFlow 0 276999) 277007))) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Else$3_correct)))
(let ((inline$$WritebackToReference$0$anon3_Else_correct  (=> 
(and (not 
(and 
(and (= (|l#$Mutation| inline$$BorrowLoc$0$dst@1) (|l#$Mutation| |inline$$WriteRef$0$to'@1|)) (<= (|size#$Path| inline$$WritebackToReference$0$dstPath@1) (|size#$Path| inline$$WritebackToReference$0$srcPath@1))) ($IsPathPrefix_stratified inline$$WritebackToReference$0$dstPath@1 inline$$WritebackToReference$0$srcPath@1))) (= |inline$$WritebackToReference$0$dst'@2| inline$$BorrowLoc$0$dst@1)) 
(and (=> (= (ControlFlow 0 276824) 276999) inline$$WritebackToValue$0$anon3_Then_correct) (=> (= (ControlFlow 0 276824) 276973) inline$$WritebackToValue$0$anon3_Else_correct)))))
(let ((inline$$WritebackToReference$0$anon3_Then_correct  (=> 
(and 
(and 
(and (= (|l#$Mutation| inline$$BorrowLoc$0$dst@1) (|l#$Mutation| |inline$$WriteRef$0$to'@1|)) (<= (|size#$Path| inline$$WritebackToReference$0$dstPath@1) (|size#$Path| inline$$WritebackToReference$0$srcPath@1))) ($IsPathPrefix_stratified inline$$WritebackToReference$0$dstPath@1 inline$$WritebackToReference$0$srcPath@1)) 
(and (= |inline$$WritebackToReference$0$dst'@1| ($Mutation (|l#$Mutation| inline$$BorrowLoc$0$dst@1) inline$$WritebackToReference$0$dstPath@1 ($UpdateValue_stratified inline$$WritebackToReference$0$srcPath@1 (|size#$Path| inline$$WritebackToReference$0$dstPath@1) (|v#$Mutation| inline$$BorrowLoc$0$dst@1) (|v#$Mutation| |inline$$WriteRef$0$to'@1|)))) (= |inline$$WritebackToReference$0$dst'@2| |inline$$WritebackToReference$0$dst'@1|))) 
(and (=> (= (ControlFlow 0 276880) 276999) inline$$WritebackToValue$0$anon3_Then_correct) (=> (= (ControlFlow 0 276880) 276973) inline$$WritebackToValue$0$anon3_Else_correct)))))
(let ((inline$$WritebackToReference$0$anon0_correct  (=> 
(and (= inline$$WritebackToReference$0$srcPath@1 (|p#$Mutation| |inline$$WriteRef$0$to'@1|)) (= inline$$WritebackToReference$0$dstPath@1 (|p#$Mutation| inline$$BorrowLoc$0$dst@1))) 
(and (=> (= (ControlFlow 0 276788) 276880) inline$$WritebackToReference$0$anon3_Then_correct) (=> (= (ControlFlow 0 276788) 276824) inline$$WritebackToReference$0$anon3_Else_correct)))))
(let ((inline$$WriteRef$0$anon0_correct  (=> 
(and (= |inline$$WriteRef$0$to'@1| ($Mutation (|l#$Mutation| inline$$BorrowField$0$dst@1) (|p#$Mutation| inline$$BorrowField$0$dst@1) |inline$$Vector_push_back$0$v'@1|)) (= (ControlFlow 0 276653) 276788)) inline$$WritebackToReference$0$anon0_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Else_correct  (=> 
(and (not $abort_flag@7) (= (ControlFlow 0 276659) 276653)) inline$$WriteRef$0$anon0_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Then_correct  (=> 
(and $abort_flag@7 ($DebugTrackAbort 10 1823 $abort_code@10)) (=> 
(and 
(and (= $abort_code@13 $abort_code@10) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory) (= (ControlFlow 0 277037) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$Vector_push_back$0$anon0_correct  (=> 
(and (is-$Vector inline$$ReadRef$0$v@1) (= |inline$$Vector_push_back$0$v'@1| ($Vector (let ((len@@0 (|l#$ValueArray| (|v#$Vector| inline$$ReadRef$0$v@1))))
($ValueArray (|Store_[$int]$Value| (R (|v#$Vector| inline$$ReadRef$0$v@1)) len@@0 currency_code) (+ len@@0 1)))))) 
(and (=> (= (ControlFlow 0 276589) 277037) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Then_correct) (=> (= (ControlFlow 0 276589) 276659) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon26_Else_correct)))))
(let ((inline$$Vector_push_back$0$Entry_correct  (=> 
(and (= inline$$Vector_push_back$0$ta@0 ($VectorType $IntegerType)) (= (ControlFlow 0 276577) 276589)) inline$$Vector_push_back$0$anon0_correct)))
(let ((inline$$ReadRef$0$anon0_correct  (=> 
(and (= inline$$ReadRef$0$v@1 (|v#$Mutation| inline$$BorrowField$0$dst@1)) (= (ControlFlow 0 276525) 276577)) inline$$Vector_push_back$0$Entry_correct)))
(let ((inline$$BorrowField$0$anon0_correct  (=> (= inline$$BorrowField$0$p@1 (|p#$Mutation| inline$$BorrowLoc$0$dst@1)) (=> 
(and 
(and (= inline$$BorrowField$0$size@1 (|size#$Path| inline$$BorrowField$0$p@1)) (= inline$$BorrowField$0$p@2 ($Path (|Store_[$int]$int| (|p#$Path| inline$$BorrowField$0$p@1) inline$$BorrowField$0$size@1 c) (+ inline$$BorrowField$0$size@1 1)))) 
(and (= inline$$BorrowField$0$dst@1 ($Mutation (|l#$Mutation| inline$$BorrowLoc$0$dst@1) inline$$BorrowField$0$p@2 (s (R (|v#$Vector| (|v#$Mutation| inline$$BorrowLoc$0$dst@1))) c))) (= (ControlFlow 0 276488) 276525))) inline$$ReadRef$0$anon0_correct))))
(let ((inline$$BorrowLoc$0$anon0_correct  (=> 
(and (= inline$$BorrowLoc$0$dst@1 ($Mutation ($Local 2) $EmptyPath call3formal@$ret0@0)) (= (ControlFlow 0 276368) 276488)) inline$$BorrowField$0$anon0_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon24_Then_correct  (=> 
(and (B inline$$Not$1$dst@1) (= (ControlFlow 0 276374) 276368)) inline$$BorrowLoc$0$anon0_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon14_correct  (=> (= $abort_code@11 (|i#$Integer| call3formal@$ret0@0@@0)) (=> 
(and 
(and (= $abort_code@13 $abort_code@11) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory) (= (ControlFlow 0 276297) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon25_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 276291) 276297)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon14_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon25_Then_correct  (=> 
(and ($DebugTrackAbort 10 1650 (|i#$Integer| call3formal@$ret0@0@@0)) (= (ControlFlow 0 276315) 276297)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon14_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon24_Else_correct  (=> (not (B inline$$Not$1$dst@1)) 
(and (=> (= (ControlFlow 0 276285) 276315) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon25_Then_correct) (=> (= (ControlFlow 0 276285) 276291) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon25_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon23_Else_correct  (=> (not $abort_flag@7) 
(and (=> (= (ControlFlow 0 276277) 276374) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon24_Then_correct) (=> (= (ControlFlow 0 276277) 276285) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon24_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon23_Then_correct  (=> 
(and $abort_flag@7 ($DebugTrackAbort 10 1749 $abort_code@10)) (=> 
(and 
(and (= $abort_code@13 $abort_code@10) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory) (= (ControlFlow 0 277049) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Else$1_correct  (=> 
(and 
(and 
(and (= inline$$RegisteredCurrencies_add_currency_code_$def$0$$t10@1 ($Integer 0)) (=> (B (b false)) $abort_flag@7)) 
(and (=> $abort_flag@7 (B (b false))) (=> (not $abort_flag@7) (B (b ($IsEqual_stratified call3formal@$ret0@0@@0 ($Integer 7))))))) 
(and 
(and (is-$Integer call3formal@$ret0@0@@0) (>= (|i#$Integer| call3formal@$ret0@0@@0) 0)) (<= (|i#$Integer| call3formal@$ret0@0@@0) $MAX_U64))) 
(and (=> (= (ControlFlow 0 276271) 277049) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon23_Then_correct) (=> (= (ControlFlow 0 276271) 276277) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon23_Else_correct)))))
(let ((inline$$Not$1$anon0_correct  (=> 
(and (= inline$$Not$1$dst@1 (b  (not (B inline$$Vector_contains$0$res@1)))) (= (ControlFlow 0 276259) 276271)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Else$1_correct)))
(let ((inline$$Not$1$Entry_correct  
(and (=> (= (ControlFlow 0 276249) (- 0 469617)) true) (=> (= (ControlFlow 0 276249) 276259) inline$$Not$1$anon0_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Else_correct  (=> 
(and (not $abort_flag@6) (= (ControlFlow 0 276265) 276249)) inline$$Not$1$Entry_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Then_correct  (=> 
(and $abort_flag@6 ($DebugTrackAbort 10 1679 $abort_code@9)) (=> 
(and 
(and (= $abort_code@13 $abort_code@9) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory) (= (ControlFlow 0 277061) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$Vector_contains$0$anon0_correct  (=> 
(and (is-$Vector inline$$GetFieldFromValue$0$dst@1) (= inline$$Vector_contains$0$res@1 (b 

; cvc4 answers easy for this replaced by true
(exists ((i@@10 Int) ) (!  
(and 
(and (<= 0 i@@10) (< i@@10 (|l#$ValueArray| (|v#$Vector| inline$$GetFieldFromValue$0$dst@1)))) ($IsEqual_stratified (s (R (|v#$Vector| inline$$GetFieldFromValue$0$dst@1)) i@@10) currency_code))
 :qid |Libramov.503:13|
 :skolemid |23|
))

))) 


(and (=> (= (ControlFlow 0 276204) 277061) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Then_correct) (=> (= (ControlFlow 0 276204) 276265) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon22_Else_correct)))))
(let ((inline$$Vector_contains$0$Entry_correct  (=> 
(and (= inline$$Vector_contains$0$ta@0 ($VectorType $IntegerType)) (= (ControlFlow 0 276190) 276204)) inline$$Vector_contains$0$anon0_correct)))
(let ((inline$$GetFieldFromValue$0$anon0_correct  (=> 
(and (= inline$$GetFieldFromValue$0$dst@1 (s (R (|v#$Vector| call3formal@$ret0@0)) c)) (= (ControlFlow 0 276136) 276190)) inline$$Vector_contains$0$Entry_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon21_Else_correct  (=> 
(and (not $abort_flag@6) (= (ControlFlow 0 276142) 276136)) inline$$GetFieldFromValue$0$anon0_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon21_Then_correct  (=> 
(and $abort_flag@6 ($DebugTrackAbort 10 1613 $abort_code@9)) (=> 
(and 
(and (= $abort_code@13 $abort_code@9) (= $LibraConfig_LibraConfig_$memory@1 $LibraConfig_LibraConfig_$memory)) 
(and (= $LibraConfig_Configuration_$memory@1 $LibraConfig_Configuration_$memory) (= (ControlFlow 0 277073) 276301))) inline$$RegisteredCurrencies_add_currency_code_$def$0$Abort_correct))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon4$2_correct  (=> (= call0formal@$tv0@0@@0 $RegisteredCurrencies_RegisteredCurrencies_type_value) (=> 
(and 
(and (=> (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0@@0) 1) (|a#$Address| ($Address 173345816)))))))) $abort_flag@6) (=> $abort_flag@6 (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0@@0) 1) (|a#$Address| ($Address 173345816)))))))))) 
(and (=> $abort_flag@6 
(and (B (b  (not (B (b (sl (d $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0@@0) 1) (|a#$Address| ($Address 173345816)))))))) (= $abort_code@9 (|i#$Integer| ($Integer 5))))) (=> (not $abort_flag@6) (B (b ($IsEqual_stratified call3formal@$ret0@0 (let ((addr@@15 ($Address 173345816)))
(s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $LibraConfig_LibraConfig_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 call0formal@$tv0@0@@0) 1) (|a#$Address| addr@@15)))) $LibraConfig_LibraConfig_payload)))))))) 
(and (=> (= (ControlFlow 0 276091) 277073) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon21_Then_correct) (=> (= (ControlFlow 0 276091) 276142) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon21_Else_correct))))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 276023) 276091)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon4$2_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Then_correct  (=> 
(and ($DebugTrackLocal 10 1477 1 currency_code) (= (ControlFlow 0 277087) 276091)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon4$2_correct)))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon19_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 276015) 277087) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Then_correct) (=> (= (ControlFlow 0 276015) 276023) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon19_Then_correct  (=> ($DebugTrackLocal 10 1477 0 lr_account) 
(and (=> (= (ControlFlow 0 277101) 277087) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Then_correct) (=> (= (ControlFlow 0 277101) 276023) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon20_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$def$0$anon0_correct  (=> (not $abort_flag@5) 
(and (=> (= (ControlFlow 0 276009) 277101) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon19_Then_correct) (=> (= (ControlFlow 0 276009) 276015) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon19_Else_correct)))))
(let ((inline$$RegisteredCurrencies_add_currency_code_$direct_inter$0$anon0_correct  (=> (is-$Address lr_account) (=> 
(and 
(and 
(and (is-$Vector currency_code) (let ((va@@8 (|v#$Vector| currency_code)))
(let ((l@@8 (|l#$ValueArray| va@@8)))
 
(and 
(and (<= 0 l@@8) (<= l@@8 $MAX_U64)) 
true)))) 
true) (= (ControlFlow 0 277105) 276009)) inline$$RegisteredCurrencies_add_currency_code_$def$0$anon0_correct))))
(let ((inline$$register_currency_$def_verify$0$anon78_Else_correct  (=> (not $abort_flag@5) 
(and (=> (= (ControlFlow 0 277111) (- 0 469068)) (B (b 
true))) (=> (B (b 
true)) 
(and (=> (= (ControlFlow 0 277111) (- 0 469192)) (B (b 
true))) (=> (B (b 
true)) (=> (= (ControlFlow 0 277111) 277105) inline$$RegisteredCurrencies_add_currency_code_$direct_inter$0$anon0_correct))))))))
(let ((inline$$register_currency_$def_verify$0$anon78_Then_correct  (=> $abort_flag@5 (=> 
(and ($DebugTrackAbort 7 38943 $abort_code@8) (= $abort_code@15 $abort_code@8)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 |inline$$MoveToRaw$0$m'@2|) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277483) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$MoveToRaw$0$anon3_Then$1_correct  (=> (= $abort_flag@5 true) (=> 
(and (= $abort_code@8 $EXEC_FAILURE_CODE) (= |inline$$MoveToRaw$0$m'@2| |inline$$MoveToRaw$0$m'@0|)) 
(and (=> (= (ControlFlow 0 275311) 277483) inline$$register_currency_$def_verify$0$anon78_Then_correct) (=> (= (ControlFlow 0 275311) 277111) inline$$register_currency_$def_verify$0$anon78_Else_correct))))))
(let ((inline$$MoveToRaw$0$anon3_Then_correct  (=> 
(and (sl (d $CurrencyInfo_$memory) inline$$MoveTo$0$ta@0 inline$$MoveTo$0$a@1) (= (ControlFlow 0 275309) 275311)) inline$$MoveToRaw$0$anon3_Then$1_correct)))
(let ((inline$$MoveToRaw$0$anon3_Else_correct  (=> (not (sl (d $CurrencyInfo_$memory) inline$$MoveTo$0$ta@0 inline$$MoveTo$0$a@1)) (=> 
(and 
(and (= |inline$$MoveToRaw$0$m'@1| ($Memory (|Store_[t,$int]$bool| (d $CurrencyInfo_$memory) inline$$MoveTo$0$ta@0 inline$$MoveTo$0$a@1 true) (|Store_[t,$int]$Value| (cm $CurrencyInfo_$memory) inline$$MoveTo$0$ta@0 inline$$MoveTo$0$a@1 inline$$CurrencyInfo_pack$0$$struct@1))) (= $abort_flag@5 $abort_flag@4)) 
(and (= $abort_code@8 $abort_code@6) (= |inline$$MoveToRaw$0$m'@2| |inline$$MoveToRaw$0$m'@1|))) 
(and (=> (= (ControlFlow 0 275261) 277483) inline$$register_currency_$def_verify$0$anon78_Then_correct) (=> (= (ControlFlow 0 275261) 277111) inline$$register_currency_$def_verify$0$anon78_Else_correct))))))
(let ((inline$$MoveTo$0$anon0$1_correct  (=> (= inline$$MoveTo$0$a@1 (|a#$Address| lr_account)) 
(and (=> (= (ControlFlow 0 275317) 275309) inline$$MoveToRaw$0$anon3_Then_correct) (=> (= (ControlFlow 0 275317) 275261) inline$$MoveToRaw$0$anon3_Else_correct)))))
(let ((inline$$Signer_borrow_address$0$Entry_correct  
(and (=> (= (ControlFlow 0 275112) (- 0 468946)) true) (=> (= (ControlFlow 0 275112) 275317) inline$$MoveTo$0$anon0$1_correct))))
(let ((inline$$MoveTo$0$Entry_correct  (=> 
(and (= inline$$MoveTo$0$ta@0 (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1)) (= (ControlFlow 0 275085) 275112)) inline$$Signer_borrow_address$0$Entry_correct)))
(let ((inline$$register_currency_$def_verify$0$anon77_Else$1_correct  (=> 
(and (B (b 
true)) (= (ControlFlow 0 275325) 275085)) inline$$MoveTo$0$Entry_correct)))
(let ((inline$$CurrencyInfo_pack$0$anon2_correct  
(and (=> (= (ControlFlow 0 274851) (- 0 468734)) (B (b  
(and (B (b (< (|i#$Integer| ($Integer 0)) (|i#$Integer| (s (R (|v#$Vector| inline$$CurrencyInfo_pack$0$$struct@1)) $CurrencyInfo_scaling_factor))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| inline$$CurrencyInfo_pack$0$$struct@1)) $CurrencyInfo_scaling_factor)) (|i#$Integer| ($Integer 10000000000))))))))) (=> (B (b  
(and (B (b (< (|i#$Integer| ($Integer 0)) (|i#$Integer| (s (R (|v#$Vector| inline$$CurrencyInfo_pack$0$$struct@1)) $CurrencyInfo_scaling_factor))))) (B (b (<= (|i#$Integer| (s (R (|v#$Vector| inline$$CurrencyInfo_pack$0$$struct@1)) $CurrencyInfo_scaling_factor)) (|i#$Integer| ($Integer 10000000000)))))))) (=> (= (ControlFlow 0 274851) 275325) inline$$register_currency_$def_verify$0$anon77_Else$1_correct)))))
(let ((inline$$CurrencyInfo_pack$0$anon3_Else_correct  (=> 
(and (>= 0 0) (= (ControlFlow 0 274803) 274851)) inline$$CurrencyInfo_pack$0$anon2_correct)))
(let ((inline$$CurrencyInfo_pack$0$anon3_Then_correct  (=> (> 0 0) (=> 
(and ($DebugTrackLocal 0 0 0 inline$$CurrencyInfo_pack$0$$struct@1) (= (ControlFlow 0 274869) 274851)) inline$$CurrencyInfo_pack$0$anon2_correct))))
(let ((inline$$CurrencyInfo_pack$0$anon0_correct  (=> 
(and 
(and 
(and (is-$Integer inline$$register_currency_$def_verify$0$$t28@1) (>= (|i#$Integer| inline$$register_currency_$def_verify$0$$t28@1) 0)) (<= (|i#$Integer| inline$$register_currency_$def_verify$0$$t28@1) $MAX_U128)) 
(and 
(and (is-$Integer inline$$register_currency_$def_verify$0$$t29@1) (>= (|i#$Integer| inline$$register_currency_$def_verify$0$$t29@1) 0)) (<= (|i#$Integer| inline$$register_currency_$def_verify$0$$t29@1) $MAX_U64))) (=> 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector to_lbr_exchange_rate) (let ((va@@9 (|v#$Vector| to_lbr_exchange_rate)))
(let ((l@@9 (|l#$ValueArray| va@@9)))
 
(and 
(and (<= 0 l@@9) (<= l@@9 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| to_lbr_exchange_rate)) 1)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) (>= (|i#$Integer| (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) $MAX_U64))) true) (is-b is_synthetic)) 
(and 
(and 
(and 
(and (is-$Integer scaling_factor) (>= (|i#$Integer| scaling_factor) 0)) (<= (|i#$Integer| scaling_factor) $MAX_U64)) 
(and 
(and (is-$Integer fractional_part) (>= (|i#$Integer| fractional_part) 0)) (<= (|i#$Integer| fractional_part) $MAX_U64))) 
(and 
(and 
(and (is-$Vector currency_code) (let ((va@@10 (|v#$Vector| currency_code)))
(let ((l@@10 (|l#$ValueArray| va@@10)))
 
(and 
(and (<= 0 l@@10) (<= l@@10 $MAX_U64)) 
true)))) 
true) (is-b inline$$register_currency_$def_verify$0$$t30@1)))) (=> 
(and 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector inline$$Event_new_event_handle$0$res@0) (let ((va@@11 (|v#$Vector| inline$$Event_new_event_handle$0$res@0)))
(let ((l@@11 (|l#$ValueArray| va@@11)))
 
(and 
(and (<= 0 l@@11) (<= l@@11 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) 2)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) $Event_EventHandle_counter)) (>= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) $Event_EventHandle_counter)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) $Event_EventHandle_counter)) $MAX_U64))) 
(and (is-$Vector (s (R (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) $Event_EventHandle_guid)) (let ((va@@12 (|v#$Vector| (s (R (|v#$Vector| inline$$Event_new_event_handle$0$res@0)) $Event_EventHandle_guid))))
(let ((l@@12 (|l#$ValueArray| va@@12)))
 
(and 
(and (<= 0 l@@12) (<= l@@12 $MAX_U64)) 
true))))) 
true) true) 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector inline$$Event_new_event_handle$1$res@0) (let ((va@@13 (|v#$Vector| inline$$Event_new_event_handle$1$res@0)))
(let ((l@@13 (|l#$ValueArray| va@@13)))
 
(and 
(and (<= 0 l@@13) (<= l@@13 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) 2)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) $Event_EventHandle_counter)) (>= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) $Event_EventHandle_counter)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) $Event_EventHandle_counter)) $MAX_U64))) 
(and (is-$Vector (s (R (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) $Event_EventHandle_guid)) (let ((va@@14 (|v#$Vector| (s (R (|v#$Vector| inline$$Event_new_event_handle$1$res@0)) $Event_EventHandle_guid))))
(let ((l@@14 (|l#$ValueArray| va@@14)))
 
(and 
(and (<= 0 l@@14) (<= l@@14 $MAX_U64)) 
true))))) 
true) true)) (=> 
(and 
(and 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector inline$$Event_new_event_handle$2$res@0) (let ((va@@15 (|v#$Vector| inline$$Event_new_event_handle$2$res@0)))
(let ((l@@15 (|l#$ValueArray| va@@15)))
 
(and 
(and (<= 0 l@@15) (<= l@@15 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) 2)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) $Event_EventHandle_counter)) (>= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) $Event_EventHandle_counter)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) $Event_EventHandle_counter)) $MAX_U64))) 
(and (is-$Vector (s (R (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) $Event_EventHandle_guid)) (let ((va@@16 (|v#$Vector| (s (R (|v#$Vector| inline$$Event_new_event_handle$2$res@0)) $Event_EventHandle_guid))))
(let ((l@@16 (|l#$ValueArray| va@@16)))
 
(and 
(and (<= 0 l@@16) (<= l@@16 $MAX_U64)) 
true))))) 
true) true) 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector inline$$Event_new_event_handle$3$res@0) (let ((va@@17 (|v#$Vector| inline$$Event_new_event_handle$3$res@0)))
(let ((l@@17 (|l#$ValueArray| va@@17)))
 
(and 
(and (<= 0 l@@17) (<= l@@17 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) 2)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) $Event_EventHandle_counter)) (>= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) $Event_EventHandle_counter)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) $Event_EventHandle_counter)) $MAX_U64))) 
(and (is-$Vector (s (R (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) $Event_EventHandle_guid)) (let ((va@@18 (|v#$Vector| (s (R (|v#$Vector| inline$$Event_new_event_handle$3$res@0)) $Event_EventHandle_guid))))
(let ((l@@18 (|l#$ValueArray| va@@18)))
 
(and 
(and (<= 0 l@@18) (<= l@@18 $MAX_U64)) 
true))))) 
true) true)) 
(and 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector inline$$Event_new_event_handle$4$res@0) (let ((va@@19 (|v#$Vector| inline$$Event_new_event_handle$4$res@0)))
(let ((l@@19 (|l#$ValueArray| va@@19)))
 
(and 
(and (<= 0 l@@19) (<= l@@19 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) 2)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) $Event_EventHandle_counter)) (>= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) $Event_EventHandle_counter)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) $Event_EventHandle_counter)) $MAX_U64))) 
(and (is-$Vector (s (R (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) $Event_EventHandle_guid)) (let ((va@@20 (|v#$Vector| (s (R (|v#$Vector| inline$$Event_new_event_handle$4$res@0)) $Event_EventHandle_guid))))
(let ((l@@20 (|l#$ValueArray| va@@20)))
 
(and 
(and (<= 0 l@@20) (<= l@@20 $MAX_U64)) 
true))))) 
true) true) (= inline$$CurrencyInfo_pack$0$$struct@1 ($Vector ($ValueArray (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| (|Store_[$int]$Value| ($MapConstValue $Error) 0 inline$$register_currency_$def_verify$0$$t28@1) 1 inline$$register_currency_$def_verify$0$$t29@1) 2 to_lbr_exchange_rate) 3 is_synthetic) 4 scaling_factor) 5 fractional_part) 6 currency_code) 7 inline$$register_currency_$def_verify$0$$t30@1) 8 inline$$Event_new_event_handle$0$res@0) 9 inline$$Event_new_event_handle$1$res@0) 10 inline$$Event_new_event_handle$2$res@0) 11 inline$$Event_new_event_handle$3$res@0) 12 inline$$Event_new_event_handle$4$res@0) 13))))) 
(and (=> (= (ControlFlow 0 274795) 274869) inline$$CurrencyInfo_pack$0$anon3_Then_correct) (=> (= (ControlFlow 0 274795) 274803) inline$$CurrencyInfo_pack$0$anon3_Else_correct))))))))
(let ((inline$$register_currency_$def_verify$0$anon77_Else_correct  (=> 
(and (not $abort_flag@4) (= (ControlFlow 0 274875) 274795)) inline$$CurrencyInfo_pack$0$anon0_correct)))
(let ((inline$$register_currency_$def_verify$0$anon77_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 39597 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277495) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$Event_new_event_handle$4$Entry_correct  (=> (= inline$$Event_new_event_handle$4$t@0 $ToLBRExchangeRateUpdateEvent_type_value) 
(and (=> (= (ControlFlow 0 274235) 277495) inline$$register_currency_$def_verify$0$anon77_Then_correct) (=> (= (ControlFlow 0 274235) 274875) inline$$register_currency_$def_verify$0$anon77_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon76_Else_correct  (=> 
(and (not $abort_flag@4) (= (ControlFlow 0 274243) 274235)) inline$$Event_new_event_handle$4$Entry_correct)))
(let ((inline$$register_currency_$def_verify$0$anon76_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 39502 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277507) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$Event_new_event_handle$3$Entry_correct  (=> (= inline$$Event_new_event_handle$3$t@0 $CancelBurnEvent_type_value) 
(and (=> (= (ControlFlow 0 274193) 277507) inline$$register_currency_$def_verify$0$anon76_Then_correct) (=> (= (ControlFlow 0 274193) 274243) inline$$register_currency_$def_verify$0$anon76_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon75_Else_correct  (=> 
(and (not $abort_flag@4) (= (ControlFlow 0 274201) 274193)) inline$$Event_new_event_handle$3$Entry_correct)))
(let ((inline$$register_currency_$def_verify$0$anon75_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 39419 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277519) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$Event_new_event_handle$2$Entry_correct  (=> (= inline$$Event_new_event_handle$2$t@0 $PreburnEvent_type_value) 
(and (=> (= (ControlFlow 0 274151) 277519) inline$$register_currency_$def_verify$0$anon75_Then_correct) (=> (= (ControlFlow 0 274151) 274201) inline$$register_currency_$def_verify$0$anon75_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon74_Else_correct  (=> 
(and (not $abort_flag@4) (= (ControlFlow 0 274159) 274151)) inline$$Event_new_event_handle$2$Entry_correct)))
(let ((inline$$register_currency_$def_verify$0$anon74_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 39343 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277531) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$Event_new_event_handle$1$Entry_correct  (=> (= inline$$Event_new_event_handle$1$t@0 $BurnEvent_type_value) 
(and (=> (= (ControlFlow 0 274109) 277531) inline$$register_currency_$def_verify$0$anon74_Then_correct) (=> (= (ControlFlow 0 274109) 274159) inline$$register_currency_$def_verify$0$anon74_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon73_Else_correct  (=> 
(and (not $abort_flag@4) (= (ControlFlow 0 274117) 274109)) inline$$Event_new_event_handle$1$Entry_correct)))
(let ((inline$$register_currency_$def_verify$0$anon73_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 39270 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277543) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$Event_new_event_handle$0$Entry_correct  (=> (= inline$$Event_new_event_handle$0$t@0 $MintEvent_type_value) 
(and (=> (= (ControlFlow 0 274067) 277543) inline$$register_currency_$def_verify$0$anon73_Then_correct) (=> (= (ControlFlow 0 274067) 274117) inline$$register_currency_$def_verify$0$anon73_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon71_Then_correct  (=> (B |inline$$register_currency_$def_verify$0$tmp#$10@1|) (=> 
(and 
(and (= inline$$register_currency_$def_verify$0$$t28@1 ($Integer 0)) (= inline$$register_currency_$def_verify$0$$t29@1 ($Integer 0))) 
(and (= inline$$register_currency_$def_verify$0$$t30@1 (b true)) (= (ControlFlow 0 274075) 274067))) inline$$Event_new_event_handle$0$Entry_correct))))
(let ((inline$$register_currency_$def_verify$0$anon36_correct  (=> 
(and (= $abort_code@7 (|i#$Integer| call3formal@$ret0@0@@1)) (= $abort_code@15 $abort_code@7)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 274009) 273837))) inline$$register_currency_$def_verify$0$Abort_correct))))
(let ((inline$$register_currency_$def_verify$0$anon72_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 274003) 274009)) inline$$register_currency_$def_verify$0$anon36_correct)))
(let ((inline$$register_currency_$def_verify$0$anon72_Then_correct  (=> 
(and ($DebugTrackAbort 7 38825 (|i#$Integer| call3formal@$ret0@0@@1)) (= (ControlFlow 0 274023) 274009)) inline$$register_currency_$def_verify$0$anon36_correct)))
(let ((inline$$register_currency_$def_verify$0$anon71_Else_correct  (=> (not (B |inline$$register_currency_$def_verify$0$tmp#$10@1|)) 
(and (=> (= (ControlFlow 0 273997) 274023) inline$$register_currency_$def_verify$0$anon72_Then_correct) (=> (= (ControlFlow 0 273997) 274003) inline$$register_currency_$def_verify$0$anon72_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon70_Else_correct  (=> (not $abort_flag@4) 
(and (=> (= (ControlFlow 0 273989) 274075) inline$$register_currency_$def_verify$0$anon71_Then_correct) (=> (= (ControlFlow 0 273989) 273997) inline$$register_currency_$def_verify$0$anon71_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon70_Then_correct  (=> $abort_flag@4 (=> 
(and ($DebugTrackAbort 7 38900 $abort_code@6) (= $abort_code@15 $abort_code@6)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277555) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$register_currency_$def_verify$0$L5_correct  (=> 
(and 
(and 
(and (= inline$$register_currency_$def_verify$0$$t26@1 ($Integer 1)) (=> (B (b false)) $abort_flag@4)) 
(and (=> $abort_flag@4 (B (b false))) (=> (not $abort_flag@4) (B (b ($IsEqual_stratified call3formal@$ret0@0@@1 ($Integer 7))))))) 
(and 
(and (is-$Integer call3formal@$ret0@0@@1) (>= (|i#$Integer| call3formal@$ret0@0@@1) 0)) (<= (|i#$Integer| call3formal@$ret0@0@@1) $MAX_U64))) 
(and (=> (= (ControlFlow 0 273983) 277555) inline$$register_currency_$def_verify$0$anon70_Then_correct) (=> (= (ControlFlow 0 273983) 273989) inline$$register_currency_$def_verify$0$anon70_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon28_correct  (=> 
(and (= |inline$$register_currency_$def_verify$0$tmp#$10@1| inline$$Le$0$dst@1) (= (ControlFlow 0 277650) 273983)) inline$$register_currency_$def_verify$0$L5_correct)))
(let ((inline$$register_currency_$def_verify$0$anon68_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 277648) 277650)) inline$$register_currency_$def_verify$0$anon28_correct)))
(let ((inline$$register_currency_$def_verify$0$anon68_Then_correct  (=> 
(and ($DebugTrackLocal 7 38869 10 inline$$Le$0$dst@1) (= (ControlFlow 0 277664) 277650)) inline$$register_currency_$def_verify$0$anon28_correct)))
(let ((inline$$Le$0$anon0_correct  (=> (= inline$$Le$0$dst@1 (b (<= (|i#$Integer| scaling_factor) (|i#$Integer| inline$$register_currency_$def_verify$0$$t24@1)))) 
(and (=> (= (ControlFlow 0 277634) 277664) inline$$register_currency_$def_verify$0$anon68_Then_correct) (=> (= (ControlFlow 0 277634) 277648) inline$$register_currency_$def_verify$0$anon68_Else_correct)))))
(let ((inline$$Le$0$Entry_correct  
(and (=> (= (ControlFlow 0 277620) (- 0 468209)) true) (=> (= (ControlFlow 0 277620) 277634) inline$$Le$0$anon0_correct))))
(let ((inline$$register_currency_$def_verify$0$anon67_Then_correct  (=> (B inline$$Lt$0$dst@1) (=> 
(and (= inline$$register_currency_$def_verify$0$$t24@1 ($Integer 10000000000)) (= (ControlFlow 0 277640) 277620)) inline$$Le$0$Entry_correct))))
(let ((inline$$register_currency_$def_verify$0$anon30_correct  (=> 
(and (= |inline$$register_currency_$def_verify$0$tmp#$10@1| inline$$register_currency_$def_verify$0$$t25@1) (= (ControlFlow 0 273977) 273983)) inline$$register_currency_$def_verify$0$L5_correct)))
(let ((inline$$register_currency_$def_verify$0$anon69_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 273975) 273977)) inline$$register_currency_$def_verify$0$anon30_correct)))
(let ((inline$$register_currency_$def_verify$0$anon69_Then_correct  (=> 
(and ($DebugTrackLocal 7 38832 10 inline$$register_currency_$def_verify$0$$t25@1) (= (ControlFlow 0 277569) 273977)) inline$$register_currency_$def_verify$0$anon30_correct)))
(let ((inline$$register_currency_$def_verify$0$anon67_Else_correct  (=> 
(and (not (B inline$$Lt$0$dst@1)) (= inline$$register_currency_$def_verify$0$$t25@1 (b false))) 
(and (=> (= (ControlFlow 0 273967) 277569) inline$$register_currency_$def_verify$0$anon69_Then_correct) (=> (= (ControlFlow 0 273967) 273975) inline$$register_currency_$def_verify$0$anon69_Else_correct)))))
(let ((inline$$Lt$0$anon0_correct  (=> (= inline$$Lt$0$dst@1 (b (< (|i#$Integer| inline$$register_currency_$def_verify$0$$t22@1) (|i#$Integer| scaling_factor)))) 
(and (=> (= (ControlFlow 0 273916) 277640) inline$$register_currency_$def_verify$0$anon67_Then_correct) (=> (= (ControlFlow 0 273916) 273967) inline$$register_currency_$def_verify$0$anon67_Else_correct)))))
(let ((inline$$Lt$0$Entry_correct  
(and (=> (= (ControlFlow 0 273902) (- 0 468130)) true) (=> (= (ControlFlow 0 273902) 273916) inline$$Lt$0$anon0_correct))))
(let ((inline$$register_currency_$def_verify$0$anon65_Then_correct  (=> (B inline$$Not$0$dst@1) (=> 
(and (= inline$$register_currency_$def_verify$0$$t22@1 ($Integer 0)) (= (ControlFlow 0 273922) 273902)) inline$$Lt$0$Entry_correct))))
(let ((inline$$register_currency_$def_verify$0$anon24_correct  (=> 
(and (= $abort_code@5 (|i#$Integer| call3formal@$ret0@0@@2)) (= $abort_code@15 $abort_code@5)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 273829) 273837))) inline$$register_currency_$def_verify$0$Abort_correct))))
(let ((inline$$register_currency_$def_verify$0$anon66_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 273823) 273829)) inline$$register_currency_$def_verify$0$anon24_correct)))
(let ((inline$$register_currency_$def_verify$0$anon66_Then_correct  (=> 
(and ($DebugTrackAbort 7 38667 (|i#$Integer| call3formal@$ret0@0@@2)) (= (ControlFlow 0 273851) 273829)) inline$$register_currency_$def_verify$0$anon24_correct)))
(let ((inline$$register_currency_$def_verify$0$anon65_Else_correct  (=> (not (B inline$$Not$0$dst@1)) 
(and (=> (= (ControlFlow 0 273817) 273851) inline$$register_currency_$def_verify$0$anon66_Then_correct) (=> (= (ControlFlow 0 273817) 273823) inline$$register_currency_$def_verify$0$anon66_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon64_Else_correct  (=> (not $abort_flag@3) 
(and (=> (= (ControlFlow 0 273809) 273922) inline$$register_currency_$def_verify$0$anon65_Then_correct) (=> (= (ControlFlow 0 273809) 273817) inline$$register_currency_$def_verify$0$anon65_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon64_Then_correct  (=> $abort_flag@3 (=> 
(and ($DebugTrackAbort 7 38772 $abort_code@4) (= $abort_code@15 $abort_code@4)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277676) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon63_Else$1_correct  (=> 
(and 
(and 
(and (= inline$$register_currency_$def_verify$0$$t20@1 ($Integer 1)) (=> (B (b false)) $abort_flag@3)) 
(and (=> $abort_flag@3 (B (b false))) (=> (not $abort_flag@3) (B (b ($IsEqual_stratified call3formal@$ret0@0@@2 ($Integer 6))))))) 
(and 
(and (is-$Integer call3formal@$ret0@0@@2) (>= (|i#$Integer| call3formal@$ret0@0@@2) 0)) (<= (|i#$Integer| call3formal@$ret0@0@@2) $MAX_U64))) 
(and (=> (= (ControlFlow 0 273803) 277676) inline$$register_currency_$def_verify$0$anon64_Then_correct) (=> (= (ControlFlow 0 273803) 273809) inline$$register_currency_$def_verify$0$anon64_Else_correct)))))
(let ((inline$$Not$0$anon0_correct  (=> 
(and (= inline$$Not$0$dst@1 (b  (not (B inline$$register_currency_$def_verify$0$$t18@1)))) (= (ControlFlow 0 273791) 273803)) inline$$register_currency_$def_verify$0$anon63_Else$1_correct)))
(let ((inline$$Not$0$Entry_correct  
(and (=> (= (ControlFlow 0 273781) (- 0 467989)) true) (=> (= (ControlFlow 0 273781) 273791) inline$$Not$0$anon0_correct))))
(let ((inline$$register_currency_$def_verify$0$anon63_Else_correct  (=> (not $abort_flag@2) (=> 
(and (= inline$$register_currency_$def_verify$0$$t18@1 (b (sl (d $CurrencyInfo_$memory) (t (|Store_[$int]$TypeValue| (mc err) 0 $tv0@@7) 1) (|a#$Address| call3formal@$ret0@0@@3)))) (= (ControlFlow 0 273797) 273781)) inline$$Not$0$Entry_correct))))
(let ((inline$$register_currency_$def_verify$0$anon63_Then_correct  (=> $abort_flag@2 (=> 
(and ($DebugTrackAbort 7 38727 $abort_code@3) (= $abort_code@15 $abort_code@3)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277688) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon62_Else_correct  (=> (not $abort_flag@1) (=> 
(and 
(and (=> (B (b false)) $abort_flag@2) (=> $abort_flag@2 (B (b false)))) 
(and (=> (not $abort_flag@2) (B (b ($IsEqual_stratified call3formal@$ret0@0@@3 lr_account)))) (is-$Address call3formal@$ret0@0@@3))) 
(and (=> (= (ControlFlow 0 273724) 277688) inline$$register_currency_$def_verify$0$anon63_Then_correct) (=> (= (ControlFlow 0 273724) 273797) inline$$register_currency_$def_verify$0$anon63_Else_correct))))))
(let ((inline$$register_currency_$def_verify$0$anon62_Then_correct  (=> $abort_flag@1 (=> 
(and ($DebugTrackAbort 7 38625 $abort_code@2) (= $abort_code@15 $abort_code@2)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277700) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon61_Else_correct  (=> 
(and 
(and (not $abort_flag@0) (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@1)) 
(and (=> $abort_flag@1 (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816)))))) (=> $abort_flag@1 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@2 (|i#$Integer| ($Integer 2))))))) 
(and (=> (= (ControlFlow 0 273718) 277700) inline$$register_currency_$def_verify$0$anon62_Then_correct) (=> (= (ControlFlow 0 273718) 273724) inline$$register_currency_$def_verify$0$anon62_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon61_Then_correct  (=> $abort_flag@0 (=> 
(and ($DebugTrackAbort 7 38488 $abort_code@1) (= $abort_code@15 $abort_code@1)) (=> 
(and 
(and (= $CurrencyInfo_$memory@0 $CurrencyInfo_$memory) (= $LibraConfig_Configuration_$memory@3 $LibraConfig_Configuration_$memory)) 
(and (= $LibraConfig_LibraConfig_$memory@3 $LibraConfig_LibraConfig_$memory) (= (ControlFlow 0 277712) 273837))) inline$$register_currency_$def_verify$0$Abort_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon12$6_correct  (=> 
(and (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@0) (=> (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) $abort_flag@0)) (=> 
(and 
(and (=> (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) $abort_flag@0) (=> (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) $abort_flag@0)) 
(and (=> $abort_flag@0 (or (or (or (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account)))))))) (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0)))))) (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))))) (=> $abort_flag@0 (or (or (or 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@1 (|i#$Integer| ($Integer 2)))) 
(and (B (b  (not (B (b (sl (d $Roles_RoleId_$memory) e (|a#$Address| lr_account))))))) (= $abort_code@1 (|i#$Integer| ($Integer 5))))) 
(and (B (b  (not ($IsEqual_stratified (s (R (|v#$Vector| (|Select_[t,$int]$Value| (cm $Roles_RoleId_$memory) e (|a#$Address| lr_account)))) $Roles_RoleId_role_id) ($Integer 0))))) (= $abort_code@1 (|i#$Integer| ($Integer 3))))) 
(and (B (b  (not ($IsEqual_stratified lr_account ($Address 173345816))))) (= $abort_code@1 (|i#$Integer| ($Integer 2)))))))) 
(and (=> (= (ControlFlow 0 273712) 277712) inline$$register_currency_$def_verify$0$anon61_Then_correct) (=> (= (ControlFlow 0 273712) 273718) inline$$register_currency_$def_verify$0$anon61_Else_correct))))))
(let ((inline$$register_currency_$def_verify$0$anon60_Else_correct  (=> 
(and (not true) (= (ControlFlow 0 273512) 273712)) inline$$register_currency_$def_verify$0$anon12$6_correct)))
(let ((inline$$register_currency_$def_verify$0$anon60_Then_correct  (=> 
(and ($DebugTrackLocal 7 38172 5 currency_code) (= (ControlFlow 0 277726) 273712)) inline$$register_currency_$def_verify$0$anon12$6_correct)))
(let ((inline$$register_currency_$def_verify$0$anon59_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 273504) 277726) inline$$register_currency_$def_verify$0$anon60_Then_correct) (=> (= (ControlFlow 0 273504) 273512) inline$$register_currency_$def_verify$0$anon60_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon59_Then_correct  (=> ($DebugTrackLocal 7 38172 4 fractional_part) 
(and (=> (= (ControlFlow 0 277740) 277726) inline$$register_currency_$def_verify$0$anon60_Then_correct) (=> (= (ControlFlow 0 277740) 273512) inline$$register_currency_$def_verify$0$anon60_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon58_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 273496) 277740) inline$$register_currency_$def_verify$0$anon59_Then_correct) (=> (= (ControlFlow 0 273496) 273504) inline$$register_currency_$def_verify$0$anon59_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon58_Then_correct  (=> ($DebugTrackLocal 7 38172 3 scaling_factor) 
(and (=> (= (ControlFlow 0 277754) 277740) inline$$register_currency_$def_verify$0$anon59_Then_correct) (=> (= (ControlFlow 0 277754) 273504) inline$$register_currency_$def_verify$0$anon59_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon57_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 273488) 277754) inline$$register_currency_$def_verify$0$anon58_Then_correct) (=> (= (ControlFlow 0 273488) 273496) inline$$register_currency_$def_verify$0$anon58_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon57_Then_correct  (=> ($DebugTrackLocal 7 38172 2 is_synthetic) 
(and (=> (= (ControlFlow 0 277768) 277754) inline$$register_currency_$def_verify$0$anon58_Then_correct) (=> (= (ControlFlow 0 277768) 273496) inline$$register_currency_$def_verify$0$anon58_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon56_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 273480) 277768) inline$$register_currency_$def_verify$0$anon57_Then_correct) (=> (= (ControlFlow 0 273480) 273488) inline$$register_currency_$def_verify$0$anon57_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon56_Then_correct  (=> ($DebugTrackLocal 7 38172 1 to_lbr_exchange_rate) 
(and (=> (= (ControlFlow 0 277782) 277768) inline$$register_currency_$def_verify$0$anon57_Then_correct) (=> (= (ControlFlow 0 277782) 273488) inline$$register_currency_$def_verify$0$anon57_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon55_Else_correct  (=> (not true) 
(and (=> (= (ControlFlow 0 273472) 277782) inline$$register_currency_$def_verify$0$anon56_Then_correct) (=> (= (ControlFlow 0 273472) 273480) inline$$register_currency_$def_verify$0$anon56_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon55_Then_correct  (=> ($DebugTrackLocal 7 38172 0 lr_account) 
(and (=> (= (ControlFlow 0 277796) 277782) inline$$register_currency_$def_verify$0$anon56_Then_correct) (=> (= (ControlFlow 0 277796) 273480) inline$$register_currency_$def_verify$0$anon56_Else_correct)))))
(let ((inline$$register_currency_$def_verify$0$anon0_correct  (=> (not false) 
(and (=> (= (ControlFlow 0 273466) 277796) inline$$register_currency_$def_verify$0$anon55_Then_correct) (=> (= (ControlFlow 0 273466) 273472) inline$$register_currency_$def_verify$0$anon55_Else_correct)))))
(let ((anon0$1_correct  (=> true (=> true (=> 
(and true 
(and true 
true)) (=> 
(and true 

(and 
(and (B (b 

; needed
true

)) (B (b 
true))) 



(and (B (b 

true

)) (= (ControlFlow 0 277804) 273466)))) inline$$register_currency_$def_verify$0$anon0_correct))))))

(=> (= (ControlFlow 0 462929) 271565) (=> (is-$Address lr_account) (=> 
(and 
(and 
(and 
(and 
(and 
(and (is-$Vector to_lbr_exchange_rate) (let ((va@@44 (|v#$Vector| to_lbr_exchange_rate)))
(let ((l@@44 (|l#$ValueArray| va@@44)))
 
(and 
(and (<= 0 l@@44) (<= l@@44 $MAX_U64)) 
true)))) (= (|l#$ValueArray| (|v#$Vector| to_lbr_exchange_rate)) 1)) 
(and 
(and (is-$Integer (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) (>= (|i#$Integer| (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) 0)) (<= (|i#$Integer| (s (R (|v#$Vector| to_lbr_exchange_rate)) $FixedPoint32_FixedPoint32_value)) $MAX_U64))) true) (is-b is_synthetic)) 
(and 
(and 
(and 
(and (is-$Integer scaling_factor) (>= (|i#$Integer| scaling_factor) 0)) (<= (|i#$Integer| scaling_factor) $MAX_U64)) 
(and 
(and (is-$Integer fractional_part) (>= (|i#$Integer| fractional_part) 0)) (<= (|i#$Integer| fractional_part) $MAX_U64))) 
(= (ControlFlow 0 271565) 277804))) anon0$1_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
))
(check-sat)
;(get-unsat-core)
