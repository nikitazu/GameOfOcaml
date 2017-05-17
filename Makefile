OCC = ocamlc

SRC = src
BIN = bin
OBJ = obj

EXE = $(BIN)/hello

MODULES  = util.ml core.ml app.ml
OINFACES = $(MODULES:%.ml=$(OBJ)/%.cmi)
OMODULES = $(MODULES:%.ml=$(OBJ)/%.cmo)

all: $(EXE)

$(EXE): $(OMODULES) $(BIN)
	$(OCC) -I $(OBJ) -o $(EXE) $(OMODULES)

$(OMODULES): $(OBJ)/%.cmo: $(SRC)/%.ml $(OBJ) $(OINFACES)
	$(OCC) -c -I $(OBJ) $< && mv $(@:$(OBJ)/%=$(SRC)/%) $@

$(OINFACES): $(OBJ)/%.cmi: $(SRC)/%.mli $(OBJ)
	$(OCC) -c -I $(OBJ) $< && mv $(@:$(OBJ)/%=$(SRC)/%) $@

$(BIN):
	mkdir -p $(BIN)

$(OBJ):
	mkdir -p $(OBJ)

clean:
	rm -rf $(BIN) $(OBJ)
