# Install Node.js 16, the latest version supported with the version of Ubuntu that's installed
#  in PaizaCloud containers. (At least for the free ones)

# The Ubuntu version it uses was last updated in 2018.

#!/bin/bash
unset NPM_CONFIG_PREFIX
if grep -q "NPM_CONFIG_PREFIX" ~/.bashrc; then
  sed -i 's/^NPM_CONFIG_PREFIX/#NPM_CONFIG_PREFIX/' ~/.bashrc
fi
if ! command -v nvm &> /dev/null; then
  echo "NVM not found. Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  source ~/.bashrc
fi
nvm install 16
nvm use 16
nvm alias default 16
if ! grep -q "export NVM_DIR" ~/.bashrc; then
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
  echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc
  source ~/.bashrc
fi
sudo rm -f /etc/apt/sources.list.d/docker.list /etc/apt/sources.list.d/dockerproject.list && \
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C0BA5CE6DC6315A3 868C56076B935C6E 4B7C549A058F8B6B 23E7166788B63E1E && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
curl -s https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - && \
curl -s https://cli-assets.heroku.com/apt/release.key | sudo apt-key add - && \
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt update && sudo apt upgrade -y
