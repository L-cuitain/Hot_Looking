//引入封装好的axios请求
import request from "../utils/request";

/**
 * 获取专题列表
 * @returns {*|Promise}
 */
export function getCollectionsAll(current) {
  return request("/collections/list", "get", { current });
}

/**
 * 获取指定专题
 * @param colId
 * @returns {*|Promise}
 */
export function getSpecifyCollection(colId){
  return request("/collections/specify","get",{ colId });
}

/**
 * 获取专题全部详情
 * @param colId
 * @param current
 * @returns {*|Promise}
 */
export function getAllList(colId,current){
  return request("/collections/all","get",{colId,current});
}

/**
 * 获取专题资讯详情
 * @param colId
 * @param current
 * @returns {*|Promise}
 */
export function getNewsList(colId,current){
  return request("/collections/news","get",{colId,current});
}

/**
 * 获取专题文章详情
 * @param colId
 * @param current
 * @returns {*|Promise}
 */
export function getArticlesList(colId,current){
  return request("/collections/articles","get",{colId,current});
}

/**
 * 获取专题视频详情
 * @param colId
 * @param current
 * @returns {*|Promise}
 */
export function getVideosList(colId,current){
  return request("/collections/videos","get",{colId,current});
}