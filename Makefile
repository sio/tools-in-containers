CONTAINERS=$(foreach df,$(wildcard */Dockerfile),$(patsubst %/,%,$(dir $(df))))
PUSH?=


DOCKER?=docker
DOCKER_USER?=sio
DOCKER_REPO?=ghcr.io/sio/tools-in-containers
DOCKER_REGISTRY?=$(dir $(DOCKER_REPO))
DOCKER_REGISTRY_PASSWD?=
export DOCKER_REGISTRY_PASSWD


.PHONY: $(CONTAINERS)
$(CONTAINERS):
	cd $@; $(DOCKER) build --pull --tag "$(DOCKER_REPO)/$@" .
ifneq (,$(PUSH))
	echo $$DOCKER_REGISTRY_PASSWD | $(DOCKER) login -u $(DOCKER_USER) --password-stdin $(DOCKER_REGISTRY)
	$(DOCKER) push "$(DOCKER_REPO)/$@"
endif
