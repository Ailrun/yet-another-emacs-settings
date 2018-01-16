PG_REPO=https://github.com/ProofGeneral/PG.git
PG_DIR=yaes-external/ProofGeneral
JDEE_REPO=https://github.com/jdee-emacs/jdee-server.git
JDEE_DIR=yaes-external/JDEE

.PHONY: JDEE PG all

all: PG JDEE

PG: $(PG_DIR)
JDEE: $(JDEE_DIR)

$(PG_DIR):
	git clone $(PG_REPO) $(PG_DIR)
	make -C $(PG_DIR)
$(JDEE_DIR):
	git clone $(JDEE_REPO) $(JDEE_DIR)
	@echo "RUN mvn -Dmaven.test.skip=true package in JDEE REPO."
