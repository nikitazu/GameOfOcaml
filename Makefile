OCC = ocamlc

SRC = src
BIN = bin
OBJ = obj

EXE = $(BIN)/gameOfLife

MODULES  = util.ml core.ml app.ml
OINFACES = $(MODULES:%.ml=$(OBJ)/%.cmi)
OMODULES = $(MODULES:%.ml=$(OBJ)/%.cmo)
CURSES   = /usr/lib/ocaml/curses
ACURSES  = $(CURSES)/curses.cma

all: $(EXE)

$(EXE): $(OMODULES) $(BIN)
	$(OCC) -I $(OBJ) -I $(CURSES) -o $(EXE) $(ACURSES) $(OMODULES)

$(OMODULES): $(OBJ)/%.cmo: $(SRC)/%.ml $(OBJ) $(OINFACES)
	$(OCC) -c -I $(OBJ) -I $(CURSES) $< && mv $(@:$(OBJ)/%=$(SRC)/%) $@

$(OINFACES): $(OBJ)/%.cmi: $(SRC)/%.mli $(OBJ)
	$(OCC) -c -I $(OBJ) $< && mv $(@:$(OBJ)/%=$(SRC)/%) $@

$(BIN):
	mkdir -p $(BIN)

$(OBJ):
	mkdir -p $(OBJ)

clean:
	rm -rf $(BIN) $(OBJ)
