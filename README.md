# 🛡️ Yearn Token Vault (Vyper 0.3.3) – Verified on Mantle

This repository contains the source code and deployment details for the `Vault` contract, inspired by **Yearn Finance V2 Vaults**, adapted for the **Mantle Network**.

The goal of this Vault is to provide a staking-like system for the **MNT** token, which natively lacks interest-bearing functionality. Users deposit MNT and receive an **interest-bearing token**, which appreciates over time thanks to automated DeFi strategies and an additional yield boost provided by the project’s foundation.

---

## 📍 Contract Information

- **Contract Name:** Vault
- **Internal Title (Vyper):** Yearn Token Vault
- **Language:** Vyper
- **Compiler Version:** 0.3.3
- **Deployed Address:** [`0x5B5278FBf319bc93C6bE7E7423E52c778EB74D56`](https://explorer.mantle.xyz/address/0x5B5278FBf319bc93C6bE7E7423E52c778EB74D56)
- **Chain ID:** 5000 (Mantle)
- **Optimizer:** Enabled – 10,000 runs

---

## 📂 Source Files

- `contracts/Vault.vy`  
  Contains the complete smart contract written in Vyper, inspired by Yearn’s architecture and optimized for Mantle.

---

## 🚀 How It Works (For Users)

### 🧩 What is the Vault?

The Vault is a DeFi smart contract that allows users to:

- deposit **MNT tokens**
- receive **Vault shares** that represent their stake
- earn **passive yield** through automated DeFi strategies

---

### 🛠️ How It Works

1. **Deposit** your MNT tokens into the Vault
2. Receive **Vault shares** representing your stake
3. Funds are deployed into yield-generating strategies
4. Share value increases as yield is earned
5. **Withdraw anytime** to receive your MNT + accrued interest

---

### 📊 How Is the Yield Generated?

There are three main sources of yield:

1. **Active DeFi strategies** on Mantle (e.g. lending, liquidity provision)
2. **Automatic compounding** of earnings
3. **Foundation boost**:
   - The project’s foundation invests its own MNT into strategies
   - Only the **interest earned** from this capital is redistributed to Vault users
   - The **original capital is never shared**, ensuring sustainability

> Example: if the foundation deposits 100 MNT and earns 101 MNT, only the **1 MNT profit** is added to the Vault’s yield pool for users.

---

### ✅ User Requirements

- A Mantle-compatible wallet (e.g. MetaMask with Mantle configured)
- MNT tokens
- Connection to the dApp (coming soon)

---

## 🧾 Contract Verification

MantleScan currently **does not support automated verification** for Vyper contracts.  
This repository serves as a **transparent public verification**, including:

- Full original source code
- Compilation parameters
- Deployment address
- Contract behavior documentation

---

## 🔗 Useful Links

- [MantleScan – Official Explorer](https://explorer.mantle.xyz/address/0x5B5278FBf319bc93C6bE7E7423E52c778EB74D56)
- [Yearn V2 Documentation](https://docs.yearn.fi/getting-started/guides/using-yearn-v2)
- [Vyper Language Docs](https://docs.vyperlang.org/en/stable/)

---

## 👨‍💻 Author

Smart contract developed by [your name or alias].  
For questions or audits, open an issue or contact me via [GitHub](https://github.com/your-username).

---
