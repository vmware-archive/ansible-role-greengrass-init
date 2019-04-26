# Copyright © 2018 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0 OR GPL-3.0-only
FROM williamyeh/ansible:ubuntu16.04

RUN apt-get update -qq && apt-get install -y python-pip git

VOLUME /code
ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt
RUN ansible-galaxy install -r requirements.yml

CMD ["tests/test.yml", "-i", "tests/inventory", "--extra-vars", "@extra_vars.yml"]
ENTRYPOINT ["ansible-playbook"]
