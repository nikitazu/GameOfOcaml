SRC = src
BIN = bin
OBJ = obj
EXE = $(BIN)/hello
MLS = $(SRC)/core.ml  $(SRC)/app.ml
MLI = $(SRC)/core.mli $(SRC)/app.mli
CMI = $(OBJ)/core.cmi $(OBJ)/app.cmi
CMO = $(OBJ)/core.cmo $(OBJ)/app.cmo

all: $(EXE)

$(EXE): $(BIN) $(OBJ) $(CMO)
	ocamlc -o $(EXE) -I $(OBJ) $(CMO)

$(CMO): $(OBJ) $(CMI) $(MLS)
	ocamlc -c -I $(OBJ) $(MLS) && mv $(SRC)/*.cmo $(OBJ)/

$(CMI): $(OBJ) $(MLI)
	ocamlc $(MLI) && mv $(SRC)/*.cmi $(OBJ)/

$(BIN):
	mkdir -p $(BIN)

$(OBJ):
	mkdir -p $(OBJ)

clean:
	rm -rf $(BIN) $(OBJ)
