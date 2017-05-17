SRC = src
BIN = bin
EXE = $(BIN)/hello
MLS = $(SRC)/app.ml

all: $(EXE)

$(EXE): $(BIN) $(MLS)
	ocamlc -o $(EXE) $(MLS)

$(BIN):
	mkdir -p $(BIN)

clean:
	rm -rf $(BIN)
	rm -rf $(SRC)/*.cmi
	rm -rf $(SRC)/*.cmo
