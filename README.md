yarn and react-native patch
===

this hacks react-native and set dev bundle server IP when install dev app to android/iOS devices via:

* `rn-project/.rn-dev-host`
* `rn-project/../.rn-dev-host`
* `~/.rn-dev-host`

> for example, `echo 192.168.1.101 > ~/.rn-dev-host` and `yarn android` / run on physical iOS device from XCode

## Install via [homeshick](https://github.com/andsens/homeshick)

```bash
homeshick clone https://github.com/pastleo/yarn-react-native.git
```

## Setup: patch yarn

only once after npm i -g yarn

```bash
~/.bin/install-yarn-react-native
# or just `install-yarn-react-native` if `~/.bin` is in $PATH
# should work for yarn 1.22.4
```

after `yarn install` and `react-native` package is detected, `rn-node-modules.patch` will be applied to `node_modules`

> this patch should work with `react-native` `0.63.2`
