// API Routes here

const String firebaseLoginEndPoint = '/api/citizen/v1/auth/firebase-login';
const String firebaseDemoLoginEndPoint = '/api/citizen/v1/auth/firebase-demo-login';
const String registerEndPoint = '/api/citizen/v1/auth/register';
const String logoutEndPoint = '/api/citizen/v1/auth/logout';
const String userInfoEndPoint = '/api/citizen/v1/profile';

const String updateAddressEndPoint = '/api/citizen/v1/profile/address';
const String updateProfileEndPoint = '/api/citizen/v1/profile';
const String updateProfilePhotoEndPoint = '/api/citizen/v1/profile/photo';

const String getHomePageDataEndPoint = '/api/citizen/v1/page/home';
const String createReportEndPoint = '/api/citizen/v1/reports';
const String listReportEndPoint = '/api/citizen/v1/reports';
const String getFilterOptionsEndPoint = '/api/citizen/v1/reports/filter-options';
const String mapQueryEndPoint = '/api/citizen/v1/reports/map';
const String reportDetailEndPoint = '/api/citizen/v1/reports/{id}';
const String listCommentsEndPoint = '/api/citizen/v1/reports/{id}/comments';

const String saveTokenEndPoint = '/api/citizen/v1/notification/save-token';
const String faqListEndPoint = '/api/citizen/v1/faqs';
const String getAvailableEndPoint = '/api/citizen/v1/sectors/available';
const String faqDetailEndPoint = '/api/citizen/v1/faqs/{id}';

const String detailEndPoint = '/api/citizen/v1/notification/{id}';
const String listEndPoint = '/api/citizen/v1/notification';
const String readEndPoint = '/api/citizen/v1/notification/{id}/read';
const String deleteEndPoint = '/api/citizen/v1/notification/{id}';
const String countUnreadEndPoint = '/api/citizen/v1/notification/count-unread';
const String markAsReadAllEndPoint = '/api/citizen/v1/notification/read';
const String aboutPageEndPoint = '/api/citizen/v1/page/about';
const String termsPageEndPoint = '/api/citizen/v1/page/terms';
const String policyPageEndPoint = '/api/citizen/v1/page/policy';
const String reportHistoryListEndPoint = '/api/citizen/v1/reports/history';

const String createCommentEndPoint = '/api/citizen/v1/comments';
const String deleteCommentEndPoint = '/api/moderator/v1/comments/{id}';
