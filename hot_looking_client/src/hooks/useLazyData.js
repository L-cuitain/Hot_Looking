import { ref } from "vue";
import { useIntersectionObserver } from "@vueuse/core";

/**
 * 监听元素进入可视区，进行数据加载
 * @param apiFunction 用户获取数据的 api 函数
 */
export default function useLazyData(apiFunction) {
  //创建元素引用对象
  const target = ref(null);
  //存储数据
  const result = ref(null);
  //监听元素进入可视区
  const { stop } = useIntersectionObserver(target, ([{ isIntersecting }]) => {
    //元素进入可视区
    if (isIntersecting) {
      //停止监听
      stop();
      //获取数据
      apiFunction().then((data) => (result.value = data.result));
    }
  });
  return { target, result };
}
