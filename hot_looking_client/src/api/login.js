//引入封装好的axios请求
import requestWithToken from "../utils/request";

/**
 * 登录
 * @param account
 * @param password
 * @returns {*|Promise}
 */
export function login(account, password) {
  console.log(account, password);
  return requestWithToken("/user/login", "post", { account, password });
}

/**
 * 注册
 * @param name
 * @param account
 * @param password
 * @returns {*|Promise}
 * @constructor
 */
export function register(name, account, password) {
  return requestWithToken("/user/register", "post", {
    name,
    account,
    password,
  });
}

/**
 * 查询是否订阅专题
 * @param uId
 * @param colId
 * @returns {*|Promise}
 */
export function getIsSubCol(uId, colId) {
  return requestWithToken("/user/issub", "post", { uId, colId });
}

/**
 * 添加订阅
 * @param uId
 * @param colId
 * @returns {*|Promise}
 */
export function getAddUserCol(uId, colId) {
  return requestWithToken("/user/addcol", "post", { uId, colId });
}

/**
 * 减少订阅
 * @param uId
 * @param colId
 * @returns {*|Promise}
 */
export function getCancelUserCol(uId, colId) {
  return requestWithToken("/user/cancelcol", "post", { uId, colId });
}

/**
 * 用户是否点赞
 * @param hcId 内容id
 * @param uId  用户id
 * @returns {*|AxiosPromise}
 */
export function getUserIsLikes(hcId, uId) {
  return requestWithToken("/user/islikes", "get", { hcId, uId });
}

/**
 * 用户点赞
 * @param hcId  内容id
 * @param uId   用户id
 * @returns {*|AxiosPromise}
 */
export function getUserLikes(hcId, uId) {
  return requestWithToken("/user/likes", "post", { hcId, uId });
}

/**
 * 用户取消点赞
 * @param hcId  内容id
 * @returns {*|AxiosPromise}
 */
export function getUserDisLikes(hcId, uId) {
  return requestWithToken("/user/dislikes", "post", { hcId, uId });
}

/**
 * 用户评论
 * @param id
 * @param uId
 * @param content
 * @param commentTime
 * @returns {*|Promise}
 */
export function getUserComment(id, uId, content, commentTime) {
  return requestWithToken("/user/comment", "post", {
    id,
    uId,
    content,
    commentTime,
  });
}

/**
 * 获取用户信息
 * @param uId
 * @returns {*|Promise}
 */
export function getUserInfo(uId) {
  return requestWithToken("/user/info", "post", { uId });
}

/**
 * 获取用户投稿
 * @param uId
 * @param current
 * @returns {*|Promise}
 */
export function getUserCon(uId, current) {
  return requestWithToken("/user/con", "post", { uId, current });
}

/**
 * 获取用户订阅
 * @param uId
 * @param current
 * @returns {*|Promise}
 */
export function getUserCol(uId, current) {
  return requestWithToken("/user/col", "post", { uId, current });
}

/**
 * 投稿内容
 * @param form 内容表单信息
 * @returns {*|AxiosPromise}
 */
export function addContent(form) {
  return requestWithToken("/user/addCon", "post", { form });
}

/**
 * 管理员需审核文章
 * @param uId 用户id
 * @param current 当前页数
 * @returns {*|AxiosPromise}
 */
export function getAdminReview(uId, current) {
  return requestWithToken("/user/review", "post", { uId, current });
}

/**
 * 用户待审核文章
 * @param uId 用户id
 * @param current 当前页数
 * @returns {*|AxiosPromise}
 */
export function getUserWaitReview(uId, current) {
  return requestWithToken("/user/wait", "post", { uId, current });
}
