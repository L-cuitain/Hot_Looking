//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取资讯页最新资讯
 * @returns {*|Promise}
 */
export function getTopNews() {
  return request("/news/top", "get");
}

/**
 * 获取资讯页最热资讯
 * @returns {*|Promise}
 */
export function getHotNews() {
  return request("/news/hot", "get");
}

/**
 * 获取资讯页列表
 * @returns {*|Promise}
 */
export function getNewsList(current) {
  return request("/news/list", "get", { current });
}
