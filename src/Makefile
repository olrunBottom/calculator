#
# Pure OCaml, no packages, no _tags, code in serveral directories
#

# bin-annot is required for Merlin and other IDE-like tools
# The -I flag introduces sub-directories to search for code

OCB_FLAGS = -use-ocamlfind -tag bin_annot -I rolib
OCB_TEST_FLAGS = -I test
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		native test

clean:
			$(OCB) $(OCB_TEST_FLAGS) $(OCB_BIN_FLAGS) -clean

native:
			$(OCB) $(OCB_BIN_FLAGS) main.native

test:
			$(OCB) $(OCB_TEST_FLAGS) main.native

.PHONY: 	all clean native test
