# bitshares-docker
Dockerfile for bitshares witness node and bitshares cli wallet

- We expose witness node at port 8090, and cli wallet at 8091
- After initial run
  - wallet is at `wallet.json`
  - need to run `set_password <pass>` and `unlock <pass>`
  - use `import_key myaccount <wif_priv_key>` to import account
- Upon every run
  - use `unlock <pass>` to unlock wallet

## Build

```
docker build -t bitshares .
```

## Run

```
mkdir data
# watch account `1.2.3456` for query actions
docker run --rm -itd --name ibts -e "track_account=1.2.3456" -p 8090:8090 -p 8091:8091 -v `pwd`/data:/opt/coin bitshares
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/bitshares/>:

```
docker run --rm -itd --name ibts -e "track_account=1.2.3456" -p 8090:8090 -p 8091:8091 -v `pwd`/data:/opt/coin mixhq/bitshares
```
