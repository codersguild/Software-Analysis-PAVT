(set-info :smt-lib-version 2.6)
(set-option :print-success true)
(set-option :produce-models true)
(set-option :opt.priority lex)
; Asserts from ESMBC starts
(declare-datatypes ((struct_type_pointer_struct 0)) (((struct_type_pointer_struct (pointer_object (_ BitVec 64)) (pointer_offset (_ BitVec 64))))))
(declare-datatypes ((struct_type_addr_space_type 0)) (((struct_type_addr_space_type (start (_ BitVec 64)) (end (_ BitVec 64))))))
(declare-fun __ESBMC_ptr_obj_start_0 () (_ BitVec 64))
(declare-fun __ESBMC_ptr_obj_end_0 () (_ BitVec 64))
(declare-fun __ESBMC_ptr_obj_start_1 () (_ BitVec 64))
(declare-fun __ESBMC_ptr_obj_end_1 () (_ BitVec 64))
(declare-fun __ESBMC_ptr_addr_range_0 () struct_type_addr_space_type)
(declare-fun __ESBMC_ptr_addr_range_1 () struct_type_addr_space_type)
(declare-fun __ESBMC_addrspace_arr_2
             ()
             (Array (_ BitVec 64) struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_1
             ()
             (Array (_ BitVec 64) struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_3
             ()
             (Array (_ BitVec 64) struct_type_addr_space_type))
(declare-fun |0| () struct_type_pointer_struct)
(declare-fun NULL () struct_type_pointer_struct)
(declare-fun INVALID () struct_type_pointer_struct)
(declare-fun |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$1?1!0&0#1|
             ()
             (_ BitVec 32))
(declare-fun |nondet$symex::nondet0| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#1| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$2?1!0&0#1|
             ()
             (_ BitVec 32))
(declare-fun |nondet$symex::nondet1| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#1| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$___VERIFIER_nondet_float$3?1!0&0#1|
             ()
             (_ FloatingPoint 8 24))
(declare-fun |nondet$symex::nondet2| () (_ FloatingPoint 8 24))
(declare-fun |c:main.c@194@F@main@prob?1!0&0#1| () (_ FloatingPoint 8 24))
(declare-fun |goto_symex::guard?0!0&0#1| () Bool)
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?1!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet3| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?1!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#2| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#2| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#2| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?2!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet4| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?2!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#3| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#3| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#3| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?3!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet5| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?3!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#4| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#4| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#4| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?4!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet6| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?4!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#5| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#5| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#5| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?5!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet7| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?5!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#6| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#6| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#6| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?6!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet8| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?6!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#7| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#7| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#7| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?7!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet9| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?7!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#8| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#8| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#8| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?8!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet10| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?8!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#9| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#9| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#9| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?9!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet11| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?9!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#10| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#10| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#10| () (_ BitVec 32))
(declare-fun |c:@F@main::$tmp::return_value$_nondet_double$4?10!0&0#1|
             ()
             (_ FloatingPoint 11 53))
(declare-fun |nondet$symex::nondet12| () (_ FloatingPoint 11 53))
(declare-fun |c:main.c@311@F@main@flip?10!0&0#1| () (_ BitVec 8))
(declare-fun |c:main.c@236@F@main@c?1!0&0#11| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#11| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#11| () (_ BitVec 32))
(declare-fun |goto_symex::guard?0!0&0#2| () Bool)
(declare-fun |c:main.c@98@F@main@b?1!0&0#22| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#22| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@b?1!0&0#23| () (_ BitVec 32))
(declare-fun |c:main.c@98@F@main@a?1!0&0#23| () (_ BitVec 32))
(declare-fun |execution_statet::\\guard_exec?0!0| () Bool)
(assert (= __ESBMC_ptr_obj_start_0 #x0000000000000000))
(assert (= __ESBMC_ptr_obj_end_0 #x0000000000000000))
(assert (= __ESBMC_ptr_obj_start_1 #x0000000000000001))
(assert (= __ESBMC_ptr_obj_end_1 #xffffffffffffffff))
(assert (= __ESBMC_ptr_addr_range_0
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_0 __ESBMC_ptr_obj_end_0)))
(assert (= __ESBMC_ptr_addr_range_1
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_1 __ESBMC_ptr_obj_end_1)))
(assert (= (store __ESBMC_addrspace_arr_1
          #x0000000000000000
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_0
            __ESBMC_ptr_obj_end_0))
   __ESBMC_addrspace_arr_2))
(assert (= (store __ESBMC_addrspace_arr_2
          #x0000000000000001
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_1
            __ESBMC_ptr_obj_end_1))
   __ESBMC_addrspace_arr_3))
(assert (= |0| (struct_type_pointer_struct #x0000000000000000 #x0000000000000000)))
(assert (= NULL (struct_type_pointer_struct #x0000000000000000 #x0000000000000000)))
(assert (= INVALID (struct_type_pointer_struct #x0000000000000001 #x0000000000000000)))
(assert (= |nondet$symex::nondet0|
   |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$1?1!0&0#1|))
(assert (= (bvurem |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$1?1!0&0#1|
           #x05f5e100)
   |c:main.c@98@F@main@a?1!0&0#1|))
(assert (= |nondet$symex::nondet1|
   |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$2?1!0&0#1|))
(assert (= (bvurem |c:@F@main::$tmp::return_value$___VERIFIER_nondet_uint$2?1!0&0#1|
           #x05f5e100)
   |c:main.c@98@F@main@b?1!0&0#1|))
(assert (= |nondet$symex::nondet2|
   |c:@F@main::$tmp::return_value$___VERIFIER_nondet_float$3?1!0&0#1|))
(assert (= |c:@F@main::$tmp::return_value$___VERIFIER_nondet_float$3?1!0&0#1|
   |c:main.c@194@F@main@prob?1!0&0#1|))
(assert (= (bvsle |c:main.c@98@F@main@a?1!0&0#1| |c:main.c@98@F@main@b?1!0&0#1|)
   |goto_symex::guard?0!0&0#1|))
(assert (= |nondet$symex::nondet3|
   |c:@F@main::$tmp::return_value$_nondet_double$4?1!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?1!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?1!0&0#1|)))
(assert (= (ite (= ((_ zero_extend 24) |c:main.c@311@F@main@flip?1!0&0#1|) #x00000001)
        #x00000001
        #x00000000)
   |c:main.c@236@F@main@c?1!0&0#2|))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#1| |c:main.c@236@F@main@c?1!0&0#2|)
   |c:main.c@98@F@main@a?1!0&0#2|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#1| |c:main.c@236@F@main@c?1!0&0#2|)
   |c:main.c@98@F@main@b?1!0&0#2|))
(assert (= |nondet$symex::nondet4|
   |c:@F@main::$tmp::return_value$_nondet_double$4?2!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?2!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?2!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#2|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?2!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#3|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#2| |c:main.c@236@F@main@c?1!0&0#3|)
   |c:main.c@98@F@main@a?1!0&0#3|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#2| |c:main.c@236@F@main@c?1!0&0#3|)
   |c:main.c@98@F@main@b?1!0&0#3|))
(assert (= |nondet$symex::nondet5|
   |c:@F@main::$tmp::return_value$_nondet_double$4?3!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?3!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?3!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#3|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?3!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#4|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#3| |c:main.c@236@F@main@c?1!0&0#4|)
   |c:main.c@98@F@main@a?1!0&0#4|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#3| |c:main.c@236@F@main@c?1!0&0#4|)
   |c:main.c@98@F@main@b?1!0&0#4|))
(assert (= |nondet$symex::nondet6|
   |c:@F@main::$tmp::return_value$_nondet_double$4?4!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?4!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?4!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#4|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?4!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#5|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#4| |c:main.c@236@F@main@c?1!0&0#5|)
   |c:main.c@98@F@main@a?1!0&0#5|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#4| |c:main.c@236@F@main@c?1!0&0#5|)
   |c:main.c@98@F@main@b?1!0&0#5|))
(assert (= |nondet$symex::nondet7|
   |c:@F@main::$tmp::return_value$_nondet_double$4?5!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?5!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?5!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#5|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?5!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#6|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#5| |c:main.c@236@F@main@c?1!0&0#6|)
   |c:main.c@98@F@main@a?1!0&0#6|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#5| |c:main.c@236@F@main@c?1!0&0#6|)
   |c:main.c@98@F@main@b?1!0&0#6|))
(assert (= |nondet$symex::nondet8|
   |c:@F@main::$tmp::return_value$_nondet_double$4?6!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?6!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?6!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#6|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?6!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#7|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#6| |c:main.c@236@F@main@c?1!0&0#7|)
   |c:main.c@98@F@main@a?1!0&0#7|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#6| |c:main.c@236@F@main@c?1!0&0#7|)
   |c:main.c@98@F@main@b?1!0&0#7|))
(assert (= |nondet$symex::nondet9|
   |c:@F@main::$tmp::return_value$_nondet_double$4?7!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?7!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?7!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#7|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?7!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#8|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#7| |c:main.c@236@F@main@c?1!0&0#8|)
   |c:main.c@98@F@main@a?1!0&0#8|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#7| |c:main.c@236@F@main@c?1!0&0#8|)
   |c:main.c@98@F@main@b?1!0&0#8|))
(assert (= |nondet$symex::nondet10|
   |c:@F@main::$tmp::return_value$_nondet_double$4?8!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?8!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?8!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#8|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?8!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#9|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#8| |c:main.c@236@F@main@c?1!0&0#9|)
   |c:main.c@98@F@main@a?1!0&0#9|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#8| |c:main.c@236@F@main@c?1!0&0#9|)
   |c:main.c@98@F@main@b?1!0&0#9|))
(assert (= |nondet$symex::nondet11|
   |c:@F@main::$tmp::return_value$_nondet_double$4?9!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?9!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?9!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#9|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?9!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#10|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#9| |c:main.c@236@F@main@c?1!0&0#10|)
   |c:main.c@98@F@main@a?1!0&0#10|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#9| |c:main.c@236@F@main@c?1!0&0#10|)
   |c:main.c@98@F@main@b?1!0&0#10|))
(assert (= |nondet$symex::nondet12|
   |c:@F@main::$tmp::return_value$_nondet_double$4?10!0&0#1|))
(assert (let ((a!1 (fp.geq ((_ to_fp 8 24)
                     roundNearestTiesToEven
                     (fp.div roundNearestTiesToEven
                             |c:@F@main::$tmp::return_value$_nondet_double$4?10!0&0#1|
                             (fp #b0 #b10000011101 #xfffffffc00000)))
                   |c:main.c@194@F@main@prob?1!0&0#1|)))
  (= ((_ extract 7 0) (ite a!1 #x00000001 #x00000000))
     |c:main.c@311@F@main@flip?10!0&0#1|)))
(assert (let ((a!1 (bvadd |c:main.c@236@F@main@c?1!0&0#10|
                  (ite (= ((_ zero_extend 24)
                            |c:main.c@311@F@main@flip?10!0&0#1|)
                          #x00000001)
                       #x00000001
                       #x00000000))))
  (= a!1 |c:main.c@236@F@main@c?1!0&0#11|)))
(assert (= (bvadd |c:main.c@98@F@main@a?1!0&0#10| |c:main.c@236@F@main@c?1!0&0#11|)
   |c:main.c@98@F@main@a?1!0&0#11|))
(assert (= (bvsub |c:main.c@98@F@main@b?1!0&0#10| |c:main.c@236@F@main@c?1!0&0#11|)
   |c:main.c@98@F@main@b?1!0&0#11|))
(assert (= (bvsle |c:main.c@98@F@main@a?1!0&0#11| |c:main.c@98@F@main@b?1!0&0#11|)
   |goto_symex::guard?0!0&0#2|))
(assert (= |c:main.c@98@F@main@b?1!0&0#11| |c:main.c@98@F@main@b?1!0&0#22|))
(assert (= |c:main.c@98@F@main@a?1!0&0#11| |c:main.c@98@F@main@a?1!0&0#22|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|)
        |c:main.c@98@F@main@b?1!0&0#1|
        |c:main.c@98@F@main@b?1!0&0#22|)
   |c:main.c@98@F@main@b?1!0&0#23|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|)
        |c:main.c@98@F@main@a?1!0&0#1|
        |c:main.c@98@F@main@a?1!0&0#22|)
   |c:main.c@98@F@main@a?1!0&0#23|))
(assert (let ((a!1 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (not (and |goto_symex::guard?0!0&0#1|
                             |goto_symex::guard?0!0&0#2|)))))
      (a!2 (=> (or (and |goto_symex::guard?0!0&0#1|
                        (not |goto_symex::guard?0!0&0#2|))
                   (not |goto_symex::guard?0!0&0#1|))
               (bvslt |c:main.c@98@F@main@a?1!0&0#23|
                      |c:main.c@98@F@main@b?1!0&0#23|))))
  (or (not a!1) (not (=> true (=> |execution_statet::\\guard_exec?0!0| a!2))))))
; Asserts from ESMBC ends
; put optimization expression here.
; Eg : (maximize (ite c 1 0))
; Eg : (minimize obj)
(minimize |c:main.c@98@F@main@b?1!0&0#23|)
(apply (then simplify solve-eqs bit-blast sat))
(check-sat)
(get-objectives)
(get-model)
(exit)
