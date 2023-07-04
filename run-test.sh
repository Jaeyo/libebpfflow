#!/bin/bash

docker run --privileged -v $(pwd):/app -it libebpfflow-test /bin/bash

