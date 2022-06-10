class Config {
  // ROUTES
  // static const baseUrl = 'api.o3virtual.com'; // live
  // static const baseUrl = '10.0.2.2:5000'; // android emulator localhost maps to pc localhost
  static const baseUrl = '127.0.0.1:5000'; // ios emulator
  // static const baseUrl = 'https://0026ca16de46.ngrok.io/api/v1';


  static const transferAccountResolve = 'verify-bank-account-number';
  static const cifAccountResolve = 'verify-cif-number';
  static const transfer = 'request-transfer';

  static const profileCheckRequired = 'check-required-info';
  static const profileCreatePersonal = 'create-personal-info';
  static const profileCreateAddress = 'create-address-info';
  static const profileCreateEmployer = 'create-employer-info';
  static const profileUploadDoc = 'manage-document-info';
  static const checkBvn = 'verify-bvn';

  static const createCreditcard = 'create-O3-card';
  static const createPrepaidcard = 'request-prepaid-card';
  static const fetchCards = 'fetch-card-balance';
  static const linkCard = 'link-virtual-card';

  static const fetchBills = 'get-bill-categories';

  static const requestTopup = 'request-topup';
  static const requestLoanCharge = 'request-loanpayment';
  static const transactions = 'get-transactions';

  static const requestLoan = 'request-loan';
  static const requestBill = 'request-bill';

  static const authLogin = '/api/v1/login';
  static const authRegister = 'signup';
  static const resetPassword = 'password-reset';
  static const forgotPassword = 'initiate-password-reset';
  static const setupPin = 'spin';
}