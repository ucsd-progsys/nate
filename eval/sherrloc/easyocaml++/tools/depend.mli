(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1999 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: depend.mli,v 1.2 2002/04/18 07:27:43 garrigue Exp $ *)

(** Module dependencies. *)

module StringSet : Set.S with type elt = string

val free_structure_names : StringSet.t ref

val add_use_file : StringSet.t -> Parsetree.toplevel_phrase list -> unit

val add_signature : StringSet.t -> Parsetree.signature -> unit
