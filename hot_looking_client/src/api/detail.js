//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取资讯内容
 * @param nId
 * @returns {*|Promise}
 */
export function getNewsContent(nId) {
  return request("/detail/content", "get", { nId });
}

/**
 * 获取本周最热文章
 * @returns {*|Promise}
 */
export function getHotArticles() {
  return request("/detail/week", "get");
}

/**
 * 获取资讯评论
 * @param nId
 * @param current
 * @returns {*|Promise}
 */
export function getComment(nId, current) {
  return request("/detail/comment", "get", { nId, current });
}

/**
 * 获取文章内容
 * @param aId
 * @returns {*|Promise}
 */
export function getArticleContent(aId) {
  return request("/detail/article", "get", { aId });
}

/**
 * 获取指定文章评论
 * @param aId
 * @returns {*|Promise}
 */
export function getAComment(aId, current) {
  return request("/detail/article/comment", "get", { aId, current });
}

/**
 * 获取指定视频内容
 * @param vId
 * @returns {*|Promise}
 */
export function getVideosContent(vId) {
  return request("/detail/video", "get", { vId });
}

/**
 * 获取指定文章评论
 * @param vId
 * @returns {*|Promise}
 */
export function getVComment(vId, current) {
  return request("/detail/video/comment", "get", { vId, current });
}
