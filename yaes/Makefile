PG_REPO=https://github.com/ProofGeneral/PG.git
PG_DIR=yaes-external/ProofGeneral

.PHONY: PG all

all: PG

PG: $(PG_DIR)

$(PG_DIR):
	git clone $(PG_REPO) $(PG_DIR)
	make -C $(PG_DIR)
