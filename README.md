# node-vagrant

![zelda-nyan](http://i1.kym-cdn.com/photos/images/original/000/402/521/a01.png "something something")

It's dangerous to go alone! Here's a reliable Vagrant setup to help you on your Node adventure.

This uses an Ubuntu 14.04 LTS 64-bit box with sugar, spice and everything that's nice.

## Usage

    vagrant up
    vagrant ssh


## Setup

Make sure you have installed [VirtualBox] and at least [Vagrant] `1.7.2`.

Installing a Vagrant box (only required if the host lacks the image). Nothing fancy:

    $ vagrant box add ubuntu/trusty64

**Optional**: For future proofing the machine against Virtualbox updates, install the plugin.

    $ vagrant plugin install vagrant-vbguest


### Provisioning

The `scripts` folder contains all the required material, during the provisioning process, `bootstrap.sh` will be called, which in turn will execute the following:

  1. `pre_install.sh` - updates and installs common required deps, such as `git` and `build-essential`.
  2. `install_*` - installs tools such as mongoDB
  3. Installs npm packages such as nodemon, bower and ember-cli.


### Misc

Ports `1337, 3000, 4200 and 5000` are forwarded to the host, so when you type [http://localhost:3000](http://localhost:3000) on your browser, it points to your VM.

Seeing as we don't want to run `sudo npm install` [each time](http://stackoverflow.com/a/27429191/992453) we use node, this box uses an unprivileged installation of [nvm] to run node.
As such, `install_nvm.sh` gets called as the last provisioning step by the non-root user.


#### Start VM and login

    $ vagrant up
    $ vagrant ssh


#### Reloading changes

    vagrant reload  # restarts the VM, skipping the initial import step.
    vagrant reload --provision  # the flag instructs Vagrant to run the provisioners


#### Suspending/halting the machine

    vagrant suspend # save the current running state of the machine and stop it (dumps RAM contents to disk)
    vargant halt    # gracefully shut down the guest OS and power down the guest machine


#### Nuking your box

    vagrant destroy # will remove all traces of the guest machine from your system

Remember you can call `vagrant up` at any time and Vagrant will recreate your work environment.


[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[Vagrant]: http://www.vagrantup.com/downloads.html
[nvm]: https://github.com/creationix/nvm
