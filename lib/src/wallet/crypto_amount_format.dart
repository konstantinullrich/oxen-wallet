double cryptoAmountToDouble({num amount, num divider}) => amount / divider;

int doubleToCryptoAmount({double amount, num divider}) => (amount * divider).toInt();

// Litecoin
const litecoinAmountDivider = 100000000;
double litecoinAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: litecoinAmountDivider);

// Ethereum
const ethereumAmountDivider = 1000000000000000000;
double ethereumAmountToDouble({num amount}) =>
    cryptoAmountToDouble(amount: amount, divider: ethereumAmountDivider);

// Dash
const dashAmountDivider = 100000000;
double dashAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: dashAmountDivider);

// Bitcoin Cash
const bitcoinCashAmountDivider = 100000000;
double bitcoinCashAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: bitcoinCashAmountDivider);

// Bitcoin
const bitcoinAmountDivider = 100000000;
double bitcoinAmountToDouble({int amount}) =>
    cryptoAmountToDouble(amount: amount, divider: bitcoinAmountDivider);