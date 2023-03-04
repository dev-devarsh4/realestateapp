const String USERS_API = "users";
const String PRODUCTS_API = "products";

//10 seconds timeout for all apis
const int API_CONNECT_TIMEOUT = 240000;
const int RECEIVE_TIMEOUT = 240000;
const int SEND_TIMEOUT = 240000;
const String SOCKET_EXCEPTION = "SocketException";
const String MISSING_INSTANCEID_EXCEPTION = "MISSING_INSTANCEID_SERVICE";
const int UN_AUTHORISED = 401;
const int REQUEST_ALREADY_SUBMITTED = 416;
const int INTERNET_CONNECTION_ERROR_STATUS_CODE = -1;
const int API_CALL_TIMEOUT_ERROR_STATUS_CODE = -2;
const int SERVICE_DOWN_STATUS_CODE = 503;
const int ANNUAL_DECLARATION_FAILURE_STATUS_CODE = 504;

//Certificates
const String CERTIFICATE_REQUEST = "CertificateRequestSubmission";
const String GET_MEMBER_CERTIFICATE_DETAILS = "GetMemberCertificateDetailNew";

//Terms and condition and Privacy policy
const String GET_TERMS_AND_CONDITION_PRIVACY_POLICY =
    "GetTCANDPrivacyPolicyContent";

//App force update
const String GET_MOBILE_APP_CONFIGURATION = "GetMobileAPPConfigurationNew";

const String GET_DURATION_OF_SERVICE = "GetDurationOfService";

const String GET_IBAN_AND_BANK_NAME = "GetIBANAndBankNameNew";

const String GET_HELP_CATEGORY_DETAILS = "GetHelpCategoryDetails";

// Login with UAE Pass
const String UAE_PASS_USER_VERIFY_AND_SAVE_DEVICE_INFO_API =
    "UAEPassUserVerifyAndSaveDeviceInformation";
// This is remove and now we use User Verify and Save Device Info API
const String UAE_PASS_USER_VERIFY_API = "UAEPassUserVerify";

const String METHOD_CHANNEL_MULTIPART = "flutter.native/multipart";

const String MULTIPART_RESPONSE = "native_response";
const String MULTIPART_STATUS_CODE = "native_status_code";
const String MULTIPART_STATUS = "native_status";

const String CHANGE_BANK_DETAILS_NEW = "ChangeBankDetailsNew";
const String SUBMIT_REQUEST_FOR_CERTIFICATE_NEW =
    "SubmitRequestForCertificateNew";
const String UPLOAD_PROFILE_PICTURE_NEW = "UploadProfilePictureNew";
const String SUBMIT_ADD_PREVIOUS_SERVICE_REQUEST_NEW =
    "SubmitAddPreviousServiceRequestNew";
const String GET_REQUEST_CARD_DATA = "GetRequestCardData";
const String SUBMIT_REQUEST_CARD = "SubmitRequestCard";
const String SUBMIT_REQUEST_CARD_TWO = "SubmitRequestCardNew";

//Get Personalized Dashboard Cards
const String GET_PERSONALIZED_DASHBOARD_CARDS = "GetPersonalizedDashboardCards";

const String GET_LIST_OF_BANK = "GetListofBank";

const String GET_LIST_OF_BRANCHES = "GetListofBranches";

const String GET_ANNUAL_DECLARATION_DETAILS = "GetAnnualDeclarationDetails";

const String SUBMIT_ANNUAL_DECLARATION = "SubmitAnnualDeclaration";

const String MEMBER_PROFILE_OTP_SEND = "MemberProfileOTPSend";

const String SUBMIT_ADD_PS_REQUEST = "SubmitAddPSRequest";

const String GET_ADD_PS_DATA = "getAddPSData3";

const String SUBMIT_ADD_PS_TWO_REQUEST = "submitAddPsRequestPhaseTwo";

const String GET_DIRECT_DEBIT_PDF = "getDirectDebitPdf";

const String CANCEL_PS_REQUEST = "cancelPsRequest";

const String GET_ENTITY_ICON = "getEntityIcon";

const String SEND_ADD_PS_EMAIL = "sendAddPSEmail";

const String TOKEN_KEY = 'Token';
