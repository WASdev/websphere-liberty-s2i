LIBERTY_VERSION=22.0.0.12
JAVA8_IMAGE_VERSION=$(LIBERTY_VERSION)-java8
JAVA8_RUNTIME_IMAGE_VERSION=$(LIBERTY_VERSION)-runtime-java8
JAVA11_IMAGE_VERSION=$(LIBERTY_VERSION)-java11
JAVA11_RUNTIME_IMAGE_VERSION=$(LIBERTY_VERSION)-runtime-java11
NAMESPACE?=ibmcom
PROD_NAMESPACE?=ibmcom
PLATFORM=websphere-liberty-s2i
IMAGE_NAME=${NAMESPACE}/${PLATFORM}
BUILD_IMAGE_NAME=${PROD_NAMESPACE}/${PLATFORM}

build = ./build.sh

script_env = \
	IMAGE_NAME=$(IMAGE_NAME) \
	BUILD_IMAGE_NAME=${BUILD_IMAGE_NAME} \
	LIBERTY_VERSION=$(LIBERTY_VERSION) \
    JAVA8_IMAGE_VERSION=$(JAVA8_IMAGE_VERSION) \
	JAVA8_RUNTIME_IMAGE_VERSION=$(JAVA8_RUNTIME_IMAGE_VERSION) \
	JAVA11_IMAGE_VERSION=$(JAVA11_IMAGE_VERSION) \
	JAVA11_RUNTIME_IMAGE_VERSION=$(JAVA11_RUNTIME_IMAGE_VERSION)

.PHONY: build
build:
	$(script_env) $(build)

.PHONY: test
test:
	$(script_env) TEST_MODE=true $(build)

