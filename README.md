
# docker-vertcoind

> Run a full Vertcoin node with one command

A Docker configuration with sane defaults for running a full
Vertcoin node.

## Usage

```
docker run -v /home/username/vertcoin:/data -p 5889:5889 firrae/vertcoind
```

If there's a `vertcoin.conf` in the `/data` volume it'll be used. If not, one will be created for you with a randomly generated JSON-RPC password.

### JSON-RPC

To access JSON-RPC you'll also need to expose port 5888. You probably only want this available to localhost:

```
docker run -v /home/username/vertcoin:/data -p 5889:5889 -p 127.0.0.1:5888:5888 firrae/vertcoind
```

### CLI Arguments

All CLI arguments are passed directly through to vertcoind.

You can use this to configure via CLI args without a config file:

```
docker run -v /home/username/vertcoin:/data \
  -p 5889:5889 \
  -p 127.0.0.1:5888:5888 \
  firrae/vertcoind -rpcuser=jonsnow -rpcpassword=ikn0wnothin
```

Or just use the container like a vertcoind binary:

```
$ docker run firrae/vertcoind -version
Vertcoin Core Daemon version v0.11.1.0-9c5018b
Copyright (C) 2009-2017 The Vertcoin Core developers
Copyright (C) 2009-2017 The Bitcoin Core developers

Please contribute if you find Vertcoin Core useful. Visit
<https://vertcoin.org> for further information about the software.
The source code is available from <https://github.com/vertcoin/vertcoin>.

This is experimental software.
Distributed under the MIT software license, see the accompanying file COPYING
or <https://opensource.org/licenses/MIT>

This product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit <https://www.openssl.org> and cryptographic software written by
Eric Young and UPnP software written by Thomas Bernard.
```

### Version

You can also run a specific version of vertcoind if you want.

```
docker run -v /home/username/vertcoin:/data -p 5889:5889 firrae/vertcoind:v0.11.1.0
```

## License

MIT © Steven Lambe

## Originally By

MIT © Luke Childs
