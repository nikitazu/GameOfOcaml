SRC = src
BIN = bin
EXE = $(BIN)/hello
MLS = $(SRC)/core.ml  $(SRC)/app.ml
MLI = $(SRC)/core.mli $(SRC)/app.mli
CMI = $(SRC)/core.cmi $(SRC)/app.cmi


all: $(EXE)

$(EXE): $(BIN) $(SRC) $(CMI) $(MLS)
	ocamlc -o $(EXE) -I $(SRC) $(MLS)

$(CMI): $(SRC) $(MLI)
	ocamlc -I $(SRC) $(MLI)

$(BIN):
	mkdir -p $(BIN)

clean:
	rm -rf $(BIN)
	rm -rf $(SRC)/*.cmi
	rm -rf $(SRC)/*.cmo
