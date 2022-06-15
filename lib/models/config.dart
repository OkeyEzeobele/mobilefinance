class Config {
  // ROUTES
  // static const baseUrl = 'api.o3virtual.com'; // live
  // static const baseUrl = '10.0.2.2:5000'; // android emulator localhost maps to pc localhost
  static const baseUrl = '127.0.0.1:5000'; // ios emulator
  // static const baseUrl = 'https://0026ca16de46.ngrok.io/api/v1';


  static const transferAccountResolve = '/api/v1/verify-bank-account-number';
  static const cifAccountResolve = '/api/v1/verify-cif-number';
  static const transfer = '/api/v1/request-transfer';

  static const profileCheckRequired = '/api/v1/check-required-info';
  static const profileCreatePersonal = '/api/v1/create-personal-info';
  static const profileCreateAddress = '/api/v1/create-address-info';
  static const profileCreateEmployer = '/api/v1/create-employer-info';
  static const profileUploadDoc = '/api/v1/manage-document-info';
  static const checkBvn = '/api/v1/verify-bvn';

  static const createCreditcard = '/api/v1/create-O3-card';
  static const createPrepaidcard = 'request-prepaid-card';
  static const fetchCards = '/api/v1/fetch-card-balance';
  static const linkCard = '/api/v1/link-virtual-card';

  static const fetchBills = '/api/v1/get-bill-categories';

  static const requestTopup = '/api/v1/request-topup';
  static const requestLoanCharge = '/api/v1/request-loanpayment';
  static const transactions = '/api/v1/get-transactions';

  static const requestLoan = '/api/v1/request-loan';
  static const requestBill = '/api/v1/request-bill';

  static const authLogin = '/api/v1/login';
  static const authRegister = '/api/v1/signup';
  static const resetPassword = '/api/v1/password-reset';
  static const forgotPassword = '/api/v1/initiate-password-reset';
  static const setupPin = '/api/v1/spin';
}