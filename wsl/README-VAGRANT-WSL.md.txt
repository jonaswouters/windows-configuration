# Install vagrant on ubuntu

```bash
sudo wget https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb
sudo dpkg -i vagrant_2.2.7_x86_64.deb

echo export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1" > .bashrc
```