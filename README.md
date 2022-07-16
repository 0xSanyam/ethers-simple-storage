# Ethers Simple Storage

This is a simple smart contract made by using ethers.js, which allows users to store a number and retrieve it. The users are mapped to the numbers respectively.

## QuickStart

Clone this repo

```
git clone
```

Then install dependencies

```
yarn
```

> Note: You'll notice in `package.json` we are using `"solc": "0.8.7-fixed"`. Usually, you'll just be able to do `"solc": "0.8.7"` to get a specific version, but there is an issue with that one.

## Usage

1. Run your ganache local chain, by hitting `quickstart` on your ganache application

    > Save the workspace. This way, next time you open ganache you can start the workspace you've created, otherwise you'll have to redo all the steps below.

2. Copy the `RPC SERVER` from ganache, and place it into your `.env` file.

    ![Ganache RPC](/assets/RPC.png)

    `.env` Example:

    ```
    RPC_URL = http://0.0.0.0:8545
    ```

3. Hit the key on one of the accounts, and copy the key you see and place it into your `.env` file.

    ![Ganache Key](/assets/KEY.png)

    ![Ganache Private](/assets/PRIVATE.png)

    `.env` Example:

    ```
    PRIVATE_KEY=15e691a01da28afab4445f2e5f0fafbcb81af237bcbe3b2e46ad968b3643fd73
    ```

4. Compile your code

    Run

    ```
    yarn compile
    ```

    You'll see files `SimpleStorage_sol_SimpleStorage.abi` and `SimpleStorage_sol_SimpleStorage.bin` be created.

5. Run your application

    ```
    node deploy.js
    ```

### Deploying to a testnet

Make sure you have a [metamask](https://metamask.io/) or other wallet, and export the private key.

**IMPORTANT**

_Use a Metamask that doesn't have any real funds in it._ Just in case you accidentally push your private key to a public place.

1. [Export your private key](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key) and place it in your `.env` file, as done above.

2. Go to [Alchemy](https://alchemy.com/) and create a new project on the testnet of choice (e.g. Rinkeby)

3. Grab your URL associated with the testnet, and place it into your `.env` file.

4. Make sure you have [testnet ETH](https://faucets.chain.link/) in your account. You should get testnet ETH for the same testnet that you made a project in Alchemy.

5. Run

    ```
    node deploy.js
    ```

    ![Deploy JS](/assets/Deploy%20JS.png)

    ```
    ts-node deploy.ts
    ```

    ![Deploy TS](/assets/Deploy%20TS.png)
