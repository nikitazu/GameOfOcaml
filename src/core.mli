module Cell : sig
  type cell
  val dead : cell
  val live : cell
  val to_int : cell -> int
  val to_s : cell -> string
end

val greeting : string -> string
