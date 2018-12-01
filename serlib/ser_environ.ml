(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(************************************************************************)
(* Coq serialization API/Plugin                                         *)
(* Copyright 2016-2018 MINES ParisTech                                  *)
(************************************************************************)
(* Status: Experimental                                                 *)
(************************************************************************)

open Sexplib.Std
open Sexplib.Conv

module Range  = Ser_range
module Names  = Ser_names
module Constr = Ser_constr
module Opaqueproof    = Ser_opaqueproof
module Retroknowledge = Ser_retroknowledge
module UGraph         = Ser_uGraph
module Declarations   = Ser_declarations

type lazy_val = [%import: Environ.lazy_val]
let sexp_of_lazy_val = Serlib_base.sexp_of_opaque ~typ:"Environ.lazy_val"

type stratification =
  [%import: Environ.stratification]
  [@@deriving sexp_of]

type rel_context_val =
  [%import: Environ.rel_context_val]
  [@@deriving sexp_of]

type named_context_val =
  [%import: Environ.named_context_val]
  [@@deriving sexp_of]

type link_info =
  [%import: Environ.link_info]
  [@@deriving sexp]

module Stdlib = struct

  type nonrec 'a ref = 'a ref
  let ref_of_sexp = Sexplib.Std.ref_of_sexp
  let sexp_of_ref = Sexplib.Std.sexp_of_ref

end

type key =
  [%import: Environ.key]
  [@@deriving sexp]

type constant_key =
  [%import: Environ.constant_key]
  [@@deriving sexp]

type globals =
  [%import: Environ.globals]
  [@@deriving sexp]

let sexp_of_globals = Serlib_base.sexp_of_opaque ~typ:"Environ.globals"

type env =
  [%import: Environ.env]
  [@@deriving sexp_of]

let env_of_sexp = Serlib_base.opaque_of_sexp ~typ:"Environ.env"

type ('constr, 'term) punsafe_judgment =
  [%import: ('constr, 'term) Environ.punsafe_judgment]
  [@@deriving sexp]

type unsafe_judgment =
  [%import: Environ.unsafe_judgment]
  [@@deriving sexp]
