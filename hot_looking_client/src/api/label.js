//引入封装好的axios请求
import request from "../utils/request";

/**
 * 根据标签id查询3篇最热文章
 * @param lId
 * @returns {*|Promise}
 */
export function getHotNews(lId) {
  return request("/label/news", "get", { lId });
}

/**
 * 根据标签id查询3篇最热视频
 * @param lId
 * @returns {*|Promise}
 */
export function getHotVideo(lId) {
  return request("/label/videos", "get", { lId });
}

/**
 * 根据标签id查询推荐专题
 * @param lId
 * @returns {*|Promise}
 */
export function getHotCollection(lId) {
  return request("/label/collection", "get", { lId });
}

/**
 * 根据标签id查询全部列表内容
 * @param lId
 * @param current
 * @returns {*|Promise}
 */
export function getLabelList(lId, current) {
  return request("/label/list", "get", { lId, current });
}

/**
 * 根据标签id查询资讯列表数量
 * @param lId
 * @param current
 * @returns {*|Promise}
 */
export function getNewsList(lId, current) {
  return request("/label/news/list", "get", { lId, current });
}

/**
 * 根据标签id查询视频列表数量
 * @param lId
 * @param current
 * @returns {*|Promise}
 */
export function getVideosList(lId, current) {
  return request("/label/videos/list", "get", { lId, current });
}

/**
 * 根据标签id查询文章列表数量
 * @param lId
 * @param current
 * @returns {*|Promise}
 */
export function getArticlesList(lId, current) {
  return request("/label/articles/list", "get", { lId, current });
}
