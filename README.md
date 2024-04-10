## Foundry ERC-20

Creating a a Ric Token based on ERC-20 standards.
There are 2 Token contracs:
### ManualToken.sol: 
The contract contains basic functions taken from the Ethereum Improvement Proposals page:
https://eips.ethereum.org/EIPS/eip-20 

### RicToken.sol:
The contract inherits the code from ERC-20 OpenZeppelin Solidity Contract Librairy under token:
- **OpenZeppelin**: https://www.openzeppelin.com/contracts
- **OpenZepeling Github**: https://github.com/OpenZeppelin/openzeppelin-contracts/
Steps to use it:
In terminal install the package:
```shell
$ forge install OpenZeppelin/openzeppelin-contracts --no-commit
```
In the solidity contract:
```shell
$ import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract RicToken is ERC20 {}
```

## ChatGPT Test
We made use of GPT to generate unit tests for our erc20 contract: few suggestions had to be updated 
