EBIN_DIR=ebin
TEST_DIR=test
EXAMPLES_DIR=examples
INCLUDE_DIR=include

TEST_SOURCE_DIR=$(TEST_DIR)/src
TEST_EBIN_DIR=$(TEST_DIR)/ebin

EXAMPLES_SOURCE_DIR=$(EXAMPLES_DIR)/src
EXAMPLES_EBIN_DIR=$(EXAMPLES_DIR)/ebin

ERLC=erlc -I $(INCLUDE_DIR) -W0
ERL=erl -I $(INCLUDE_DIR) -noshell -pa $(EBIN_DIR)

.PHONY: test clean 

# install:
# We will need to do this one at some point

compile: src/*.erl
	@ echo Compiling Erlang source ...
	@ mkdir -p $(INCLUDE_DIR)
	@ mkdir -p $(EBIN_DIR)
	$(ERLC) -o $(EBIN_DIR) $?
	@ echo

test: compile
	@ echo Running Erlang tests ...
	@ mkdir -p $(TEST_EBIN_DIR)
	$(ERLC) -o $(TEST_EBIN_DIR) $(TEST_SOURCE_DIR)/*.erl
	time $(ERL) $(TEST_EBIN_DIR) -s test_helper test -s erlang halt
	@ echo

examples: compile
	@ mkdir -p $(EXAMPLES_EBIN_DIR)
	$(ERLC) -o $(EXAMPLES_EBIN_DIR) $(EXAMPLES_SOURCE_DIR)/*.erl
	$(ERL) $(EXAMPLES_EBIN_DIR) -s sample simple_graph -s erlang halt
	@ echo

clean: 
	rm -rf $(EBIN_DIR)/*.beam
	rm -rf $(TEST_EBIN_DIR)/*.beam
	rm -rf $(EXAMPLES_EBIN_DIR)/*.beam
	@ echo

