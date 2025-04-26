PG_REPO=https://github.com/ProofGeneral/PG.git
PG_DIR=yaes-external/ProofGeneral
ISAR_REPO=https://github.com/m-fleury/isar-mode
ISAR_DIR=yaes-external/isar-mode
LSP_ISAR_REPO=https://github.com/m-fleury/isabelle-emacs
LSP_ISAR_DIR_TEMP=yaes-external/lsp-isar-temp
LSP_ISAR_DIR=yaes-external/lsp-isar

.PHONY: all PG ISAR LSP_ISAR

all: PG ISAR LSP_ISAR

PG: $(PG_DIR)
ISAR: $(ISAR_DIR)
LSP_ISAR: $(LSP_ISAR_DIR)

$(PG_DIR):
	git clone --depth 1 $(PG_REPO) $(PG_DIR)
	make -C $(PG_DIR)
$(ISAR_DIR):
	git clone --depth=1 $(ISAR_REPO) $(ISAR_DIR)
$(LSP_ISAR_DIR):
	git clone -n --depth=1 --filter=tree:0 $(LSP_ISAR_REPO) $(LSP_ISAR_DIR_TEMP) && pushd $(LSP_ISAR_DIR_TEMP) && git sparse-checkout set --no-cone src/Tools/emacs-lsp/lsp-isar/ && git checkout && popd && cp -r $(LSP_ISAR_DIR_TEMP)/src/Tools/emacs-lsp/lsp-isar $(LSP_ISAR_DIR) && rm -rf $(LSP_ISAR_DIR_TEMP)
