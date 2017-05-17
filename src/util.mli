val puts : string -> unit
val combo : 'a list -> ('a * 'a) list
val tuple_sum : (int*int) -> (int*int) -> (int*int)
val (<<) : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c

module ArrExt : sig
  val get : int -> 'a array -> 'a
end

module Matrix : sig
  type 'a matrix = 'a array array
  val get : int -> int -> 'a matrix -> 'a
  val get' : 'a matrix -> (int * int) -> 'a
  val get_near : int -> int -> 'a matrix -> 'a list
end
