# Endpoint check action

This action send GET request to chosen endpoint and compare result with `expected` filed.
Parsing only JSON file with `jq` command.

## Inputs

### `hostname`

**Required** Hostname to check. Without schema. Default `"my-json-server.typicode.com"`.

### `path`

**Required** Path of endpoint. Started with `/`. Default `"/typicode/demo/db"`.

### `filter`

**Required** Filter for `jq` command. Original syntax. Default `".profile.name"`.

### `expected`

**Required** Expected value from request. Default `"typicode"`.

### `unsecure`

**Not Required** If true action will skip certification validation. Default `false`.

## Outputs

### `result`

The result of command.

## Example usage

```yaml
- name: Check my-json-server
  uses: 3sky/glowing-spoon@v0.0.1
  with:
    hostname: 'my-json-server.typicode.com'
    path: '/typicode/demo/db'
    filter: '.profile.name'
    expected: 'typicode'
```