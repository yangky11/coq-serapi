open Sexplib

type to_patch_substituted = [%import: Cemitcodes.to_patch_substituted]

let sexp_of_to_patch_substituted _ = Sexp.Atom "To_Patch_Substituted"
let to_patch_substituted_of_sexp _ = Obj.magic 0

