# Tensorkube Deploy Github Action

This action runs the deploys the respository application using tensorkube.

## Inputs

### token
**Required** Your tensorkube `token`

### session_id
**Required** Your tensorkube `session_id`

### gpus
**Optional** Number of gpus to use. Default `0`.

### `gpu_type`
**Optional** Type of GPU to use. Default is `null`.

### `cpu`
**Optional** Number of CPUs to use. Default is `100`.

### `memory`
**Optional** Amount of memory to use. Default is `200`.

### `min_scale`
**Optional** Minimum number of replicas. Default is `0`.

### `max_scale`
**Optional** Maximum number of replicas. Default is `3`.

### `env`
**Optional** Environment in which to deploy. Default is `null`.

### `secrets`
**Optional** Secrets to use. Default is ` `.

### `path`
**Optional** Path where to run the command. Default is ` `.


## Example usage

uses: tensorfuse/tensorkube-github-deploy@v1
with:
  path: 'test_app'
  gpus: 1
  gpu_type: 'a10g'
  min_scale: 0
  max_scale: 5
  env: 'dev'
