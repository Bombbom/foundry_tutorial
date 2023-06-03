## Hello foundry

- Install 
- forge init hello_foundry 
  - compile
  - test

![forge test](Asset/20230603114107.png)
## Write basic tests 
- counterV2
  - test setup, ok, fail
  - match
  - verbose 
  - gas report

- Test function Inc:
![Write foundry test ](Asset/20230603114540.png)

- Test function Dec:
![Test dec](Asset/20230603114951.png)

> count variable is uint 
> 
> call dec() when count=0 --> error

![](Asset/20230603115309.png)

![](Asset/20230603115457.png)

- show detail error

```
$ forge test --match-path test/CounterV2.t.sol -vvvvv
[⠢] Compiling...
No files changed, compilation skipped

Running 4 tests for test/CounterV2.t.sol:CounterV2Test
[FAIL. Reason: Arithmetic over/underflow] testDec() (gas: 8307)
Traces:
  [109608] CounterV2Test::setUp() 
    ├─ [55105] → new CounterV2@0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
    │   └─ ← 275 bytes of code
    └─ ← ()

  [8307] CounterV2Test::testDec() 
    ├─ [2261] CounterV2::count() [staticcall]
    │   └─ ← 0
    ├─ [394] CounterV2::dec() 
    │   └─ ← "Arithmetic over/underflow"
    └─ ← "Arithmetic over/underflow"

[PASS] testDecUnderflow() (gas: 10967)
Traces:
  [109608] CounterV2Test::setUp() 
    ├─ [55105] → new CounterV2@0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
    │   └─ ← 275 bytes of code
    └─ ← ()

  [10967] CounterV2Test::testDecUnderflow() 
    ├─ [0] VM::expectRevert(Arithmetic over/underflow) 
    │   └─ ← ()
    ├─ [2394] CounterV2::dec() 
    │   └─ ← "Arithmetic over/underflow"
    └─ ← ()

[PASS] testFailDec() (gas: 7563)
Traces:
  [109608] CounterV2Test::setUp() 
    ├─ [55105] → new CounterV2@0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
    │   └─ ← 275 bytes of code
    └─ ← ()

  [7563] CounterV2Test::testFailDec() 
    ├─ [2394] CounterV2::dec() 
    │   └─ ← "Arithmetic over/underflow"
    └─ ← "Arithmetic over/underflow"

[PASS] testInc() (gas: 29183)
Traces:
  [109608] CounterV2Test::setUp() 
    ├─ [55105] → new CounterV2@0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
    │   └─ ← 275 bytes of code
    └─ ← ()

  [29183] CounterV2Test::testInc() 
    ├─ [2261] CounterV2::count() [staticcall]
    │   └─ ← 0
    ├─ [20344] CounterV2::inc() 
    │   └─ ← ()
    ├─ [261] CounterV2::count() [staticcall]
    │   └─ ← 1
    └─ ← ()

Test result: FAILED. 3 passed; 1 failed; finished in 1.04ms

Failing tests:
Encountered 1 failing test in test/CounterV2.t.sol:CounterV2Test
[FAIL. Reason: Arithmetic over/underflow] testDec() (gas: 8307)

Encountered a total of 1 failing tests, 3 tests succeeded
```

- gas report 

![Gas report](Asset/20230603115725.png)

## Set version 

- foundry.toml 

```
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
solc_version = "0.8.17"
optimizer = true 
optimizer_runs = 200
# See more config options https://github.com/foundry-rs/foundry/tree/master/config
```

## Remapping
- forge install
- forge remappings
- forge update
- forge remove
- npm install Openzeppelin
- remappings.txt


- install solmate:

Install a dependency:


`forge install transmissions11/solmate`

Install a specific version of a dependency:


`forge install transmissions11/solmate@v7`

Install multiple dependencies:


`forge install transmissions11/solmate@v7 OpenZeppelin/openzeppelin-contracts`

Install a dependency without creating a submodule:


`forge install --no-git transmissions11/solmate`

Install a dependency in a specific folder:


`forge install soulmate=transmissions11/solmate`

- forge remappings

```
$forge remappings 
ds-test/=lib/forge-std/lib/ds-test/src/
forge-std/=lib/forge-std/src/
soulmate/=lib/soulmate/src/
```