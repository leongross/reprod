# Ko building

## Build by hand
```
export KO_DOCKER_REPO="your_registry"
ko .ko.yaml /path/to/constellation
cd /path/to/constellation
ko build ./path/to/target

```

## Build with action



## CGO:
Find if libcryptsetup is there
```
sudo ldconfig -N -v | grep libcryptsetup
```
