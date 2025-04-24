// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "./IVault.sol";

contract InitializeVault is Script {
    address public vault = 0x5B5278FBf319bc93C6bE7E7423E52c778EB74D56;

    IYearnTokenVault public Ivault = IYearnTokenVault(vault); // Missing semicolon added
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address token = vm.parseAddress("0x78c1b0C915c4FAA5FffA6CAbf0219DA63d7f4cb8");

        Ivault.initialize(
            token,
            msg.sender, // governance
            msg.sender, // rewards
            "Vault stMNT", // name
            "stMNT", // symbol
            msg.sender, // guardian
            msg.sender // management
        );

        address _governator = Ivault.governance();
        require(_governator == msg.sender, "Problem with initilize governator");
        address _token = Ivault.token();
        require(token == _token, "Problem with initialize token");
        vm.stopBroadcast();
    }
}
