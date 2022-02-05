#/////////////////////////////////////////////////////////////////////////////#
#
# Copyright (c) 2022, Joshua Ford
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#/////////////////////////////////////////////////////////////////////////////#

# VARIABLES, CONFIG, & SETTINGS
#//////////////////////////////////////////////////////////////////////////////
#
# ANSIBLE_LINT:    Path to ansible-lint executable.
# MOLECULE:        Path to molecule executable.
# MOLECULE_DISTRO: Platform to test when running molecule tests.
#
ANSIBLE_LINT = pipenv run ansible-lint
MOLECULE = pipenv run molecule
MOLECULE_DISTRO ?= "debian:10"


# TASKS
#//////////////////////////////////////////////////////////////////////////////

.DEFAULT_GOAL = help

.PHONY: clean
clean: ## Delete python-generated artifacts and caches.
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +

.PHONY: lint
lint: ## Lint source code for style.
	@echo "--- Running ansible-lint"
	$(ANSIBLE_LINT)

.PHONY: test
test: ## Run molecule test suite.
	@echo "--- Running molecule tests"
	MOLECULE_DISTRO=$(MOLECULE_DISTRO) $(MOLECULE) test

.PHONY: help
help: ## Show this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "; printf "\nUsage:\n"}; {printf "  %-15s %s\n", $$1, $$2}'
	@echo


