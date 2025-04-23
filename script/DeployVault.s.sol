// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

contract DeployVaultFromJson is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        // Carica il file JSON
        string memory path = "out/Vault.json";
        string memory json = vm.readFile(path);

        // Estrai bytecode e abi
        bytes memory bytecode = vm.parseJsonBytes(json, ".bytecode");
        // abi lo puoi usare in ethers.js se vuoi interagire dopo

        address deployed;
        assembly {
            deployed := create(0, add(bytecode, 0x20), mload(bytecode))
            if iszero(deployed) {
                revert(0, 0)
            }
        }

        console2.log("Vault deployed at:", deployed);
        vm.stopBroadcast();
    }
}
