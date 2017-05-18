module Cell : sig
  type cell
  val dead : cell
  val live : cell
  val to_int : cell -> int
  val to_s : cell -> string
  val step : cell -> int -> cell
  val map_step : cell Util.Matrix.matrix -> cell Util.Matrix.matrix
end

val greeting : string -> string
