import { useStore } from "vuex";
import { useRouter } from "vue-router";
import { ElMessage } from "element-plus";

export default function useLoginAfter() {
  //获取 store 对象
  const store = useStore();
  //获取 router 对象
  const router = useRouter();
  //登录成功后
  const loginSuccessful = ({ code, message, result }) => {
    if (code === 200) {
      //存储用户信息
      store.commit("user/setUser", {
        //存储用户信息
        //用户id
        uId: result.uId,
        //用户头像
        avatar: result.avatar,
        //用户昵称
        name: result.name,
        //用户账号
        account: result.account,
        //用户密码
        password: result.password,
        //用户类型
        category: result.category,
        //用户登录凭证
        token: result.token,
      });
      //跳转到首页
      router.push("/").then(() => {
        ElMessage({
          message: "登录成功",
          grouping: true,
          type: "success",
        });
      });
    } else {
      ElMessage({
        message: message,
        grouping: true,
        type: "error",
      });
    }
  };

  return { loginSuccessful };
}
