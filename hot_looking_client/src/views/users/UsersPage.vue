<template>
  <div class="profilePage" v-if="userInfo">
    <div class="container">
      <el-row :gutter="20">
        <el-col :span="18">
          <div class="am_card">
            <el-tabs v-model="activeName" class="tabs">
              <el-tab-pane label="主页" name="first"
                ><UsersPageHome @changeTab="handleChangeTab"
              /></el-tab-pane>
              <el-tab-pane label="投稿" name="second"
                ><UsersPageCon
              /></el-tab-pane>
              <el-tab-pane label="订阅" name="third"
                ><UsersPageCol
              /></el-tab-pane>
            </el-tabs>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="am_card">
            <div class="am_card_inner">
              <div class="profilePage_sidebar_avatar am_card_block">
                <div class="avatar avatar-size-follow avatar-v">
                  <img class="avatar_img" :src="userInfo.avatar" />
                  <div class="avatar_text">
                    <h3>{{ userInfo.name }}</h3>
                  </div>
                </div>
              </div>
              <div
                class="am_card_block profilePage_sidebar_actions"
                v-if="uId == user.profile.uId"
              >
                <a
                  class="btn btn-outline-dark btn-ellipse"
                  href="#"
                  @click="loginOut"
                  >退出登录</a
                >
              </div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
  <AppFooter />
</template>

<script>
import AppFooter from "@/components/App/AppFooter";
import UsersPageHome from "@/views/users/components/UsersPageHome";
import UsersPageCol from "@/views/users/components/UsersPageCol";
import UsersPageCon from "@/views/users/components/UsersPageCon";
import { ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useStore } from "vuex";
import { getUserInfo } from "@/api/login";

export default {
  name: "UsersPage",
  components: {
    AppFooter,
    UsersPageHome,
    UsersPageCon,
    UsersPageCol,
  },
  setup() {
    const route = useRoute();
    const router = useRouter();
    const store = useStore();
    const uId = route.params.id;
    const user = store.state.user;
    const activeName = ref("first");
    //点击切换tab
    const handleChangeTab = (tabName) => {
      activeName.value = tabName;
    };
    //获取请求参数
    const { userInfo } = useUserInfo(uId);

    //退出登录
    const loginOut = () => {
      store.commit("user/setUser", {});
      router.push("/login").then(() => {
        location.reload();
      });
    };

    return { activeName, handleChangeTab, uId, user, userInfo, loginOut };
  },
};

//渲染用户信息
function useUserInfo(uId) {
  const userInfo = ref();
  const getData = () => {
    getUserInfo(uId).then((data) => {
      userInfo.value = data.result[0];
    });
  };

  getData();
  return { userInfo };
}
</script>

<style scoped>
.profilePage {
  background: #f7f7f8;
  padding: 30px 0;
  color: #323232;
}
.container {
  max-width: 1140px;
  margin: 0 15px;
}

.am_card {
  width: 100%;
  margin-bottom: 30px;
  overflow: hidden;
  background: #fff;
  border-radius: 4px;
}

.tabs {
  padding: 0 20px;
}

:deep(.el-tabs__item) {
  color: #f56c6c;
  font-size: 14px;
  font-weight: 600;
  padding: 11px 20px;
  height: auto;
}

:deep(.el-tabs__active-bar) {
  background-color: #323232;
}

.profilePage .am_card_inner {
  padding: 22px;
}

.profilePage .am_card_inner .am_card_block {
  margin-left: -22px;
  margin-right: -22px;
}
.profilePage .am_card_block:first-child {
  padding-top: 0;
}
.profilePage_sidebar_avatar {
  display: flex;
  justify-content: center;
}
.profilePage .am_card_block {
  margin-bottom: 22px;
}
.profilePage .am_card_block,
.profilePage .am_card_inner {
  padding: 22px;
}

.profilePage_sidebar .avatar {
  font-size: 0.875rem;
  --avatar-size: 4.5rem;
  line-height: 2.25rem;
  word-break: break-all;
}

.am_card_block {
  padding: 22px;
  border-bottom: 1px solid #f2f4f7;
}

.avatar-v {
  flex-direction: column;
  text-align: center;
}

.avatar {
  display: inline-flex;
  align-items: center;
  word-break: break-all;
  font-size: 0.75rem;
  --avatar-size: 2.25rem;
  line-height: 1.125rem;
}

img.avatar_img {
  width: 72px;
  height: 72px;
  border-radius: 50%;
  background: #dcdcdc;
  border: 3px solid #fff;
  margin-bottom: 14px;
}
.avatar-v .avatar_text {
  margin: 0;
  line-height: 18px;
}

.avatar h3 {
  font-size: 1.375rem;
  line-height: inherit;
  margin: 0 0 10px;
}

.profilePage .am_card_inner .am_card_block {
  margin-left: -22px;
  margin-right: -22px;
}
.profilePage .am_card_block + .am_card_block {
  padding-top: 0;
}
.profilePage .am_card_block:last-child {
  border: 0;
  margin-bottom: 0;
  padding-bottom: 0;
  text-align: center;
}

.btn:not(:disabled):not(.disabled) {
  cursor: pointer;
}

.btn-ellipse {
  border-radius: 1.28571em;
}
.btn-outline-dark {
  color: #464646;
  border-color: #464646;
}
</style>
