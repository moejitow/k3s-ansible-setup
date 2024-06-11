FROM ubuntu:24.04

# Update apt cache
RUN apt-get -y update

# Install ansible
RUN apt-get install -y \
    software-properties-common \
    curl
RUN add-apt-repository -y --update ppa:ansible/ansible
RUN apt-get install -y ansible

# add playbooks to the image
ADD . /work/k3s-ansible-setup
WORKDIR /work/k3s-ansible-setup

# Run ansible using the site.yml playbook
CMD ansible-playbook -vvv /work/k3s-ansible-setup/site.yaml --extra-vars "variable_host=localhost"