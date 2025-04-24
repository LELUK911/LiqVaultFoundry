// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IYearnTokenVault {
    // ERC20 Standard Functions
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    // Vault-Specific View Functions
    function token() external view returns (address);
    function governance() external view returns (address);
    function management() external view returns (address);
    function guardian() external view returns (address);
    function rewards() external view returns (address);
    function depositLimit() external view returns (uint256);
    function emergencyShutdown() external view returns (bool);
    function totalAssets() external view returns (uint256);
    function pricePerShare() external view returns (uint256);
    function availableDepositLimit() external view returns (uint256);
    function creditAvailable(address strategy) external view returns (uint256);
    function debtOutstanding(address strategy) external view returns (uint256);
    function expectedReturn(address strategy) external view returns (uint256);

    // Vault-Specific Write Functions
    function deposit(uint256 amount, address recipient) external returns (uint256);
    function withdraw(uint256 shares, address recipient, uint256 maxLoss) external returns (uint256);
    function report(uint256 gain, uint256 loss, uint256 debtPayment) external returns (uint256);

    // Initialization
    function initialize(
        address token,
        address governance,
        address rewards,
        string calldata nameOverride,
        string calldata symbolOverride,
        address guardian,
        address management
    ) external;

    // Administrative Functions
    function setGovernance(address governance) external;
    function acceptGovernance() external;
    function setManagement(address management) external;
    function setRewards(address rewards) external;
    function setGuardian(address guardian) external;
    function setEmergencyShutdown(bool active) external;
    function setDepositLimit(uint256 limit) external;
    function setPerformanceFee(uint256 fee) external;
    function setManagementFee(uint256 fee) external;

    // Strategy Management
    function addStrategy(
        address strategy,
        uint256 debtRatio,
        uint256 minDebtPerHarvest,
        uint256 maxDebtPerHarvest,
        uint256 performanceFee
    ) external;
    function revokeStrategy(address strategy) external;
    function migrateStrategy(address oldVersion, address newVersion) external;
    function updateStrategyDebtRatio(address strategy, uint256 debtRatio) external;
    function updateStrategyMinDebtPerHarvest(address strategy, uint256 minDebt) external;
    function updateStrategyMaxDebtPerHarvest(address strategy, uint256 maxDebt) external;
    function updateStrategyPerformanceFee(address strategy, uint256 fee) external;
    function addStrategyToQueue(address strategy) external;
    function removeStrategyFromQueue(address strategy) external;

    // Utility
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        bytes calldata signature
    ) external returns (bool);

    function sweep(address token, uint256 amount) external;
}
