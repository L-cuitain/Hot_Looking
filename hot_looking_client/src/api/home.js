//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取首页5条专题
 * @returns {*|Promise}
 */
export function getCollections() {
  return request("/home/collections", "get");
}

/**
 * 获取首页推荐专题
 * @returns {*|Promise}
 */
export function getRecommendCollection() {
  return request("/home/rTopics", "get");
}

/**
 * 获取首页推荐视频
 * @returns {*|Promise}
 */
export function getHotVideo() {
  return request("/home/hotVideo", "get");
}

/**
 * 获取首页推荐资讯
 * @returns {*|Promise}
 */
export function getRecommendNews() {
  return request("/home/rNews", "get");
}

/**
 * 获取首页最新资讯
 * @returns {*|Promise}
 */
export function getUpNews() {
  return request("/home/uNews", "get");
}

/**
 * 获取首页最新文章与资讯
 * @returns {*|Promise}
 */
export function getUpAV() {
  return request("/home/uAV", "get");
}

/**
 * 获取首页播放视频
 * @returns {*|Promise}
 */
export function getPlayVideo() {
  return request("/home/playVideo", "get");
}
