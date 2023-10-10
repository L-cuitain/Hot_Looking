<template>
  <div>
    <div class="ah_section">
      <!--        标题-->
      <div v-if="category === '用户'">
        <h2 class="ah_title">
          <a href="#" @click="onChangeTab('second')"
            >投稿的文章
            <span class="pm_2">
              <svg
                t="1645494758486"
                class="title_icon"
                viewBox="0 0 1024 1024"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                p-id="3356"
              >
                <path
                  d="M409.307429 167.789714l304.274285 302.08a61.878857 61.878857 0 0 1 18.285715 45.494857 61.878857 61.878857 0 0 1-18.285715 45.494858l-304.274285 302.08c-24.283429 24.137143-64.073143 24.283429-88.502858 0.146285l0.438858 0.438857-2.925715-3.072a61.659429 61.659429 0 0 1 0.146286-80.310857l3.510857-3.803428 262.729143-260.827429L321.974857 254.537143a61.908114 61.908114 0 0 1-3.657143-84.114286l2.925715-3.218286 3.510857-3.218285c24.576-20.48 61.586286-19.017143 84.553143 3.803428z"
                  p-id="3357"
                ></path>
              </svg> </span
          ></a>
        </h2>
        <div v-if="conInfo">
          <div class="emptyContent" v-if="conInfo.total === 0">
            <span
              >还没有内容，<RouterLink
                to="/contribute"
                style="color: #ec625c"
                target="_blank"
                >点击这里添加内容</RouterLink
              ></span
            >
          </div>
          <el-row v-else>
            <el-col :span="8" v-for="item in conInfo.list" :key="item.hcId">
              <div class="subscription">
                <RouterLink
                  v-if="item.category === 'news'"
                  :to="`/news/detail/${item.hcId}`"
                  class="subscription_l"
                >
                  <div>{{ item.title.charAt(0) }}</div>
                </RouterLink>
                <RouterLink
                  v-if="item.category === 'articles'"
                  :to="`/articles/detail/${item.hcId}`"
                  class="subscription_l"
                >
                  <div>{{ item.title.charAt(0) }}</div>
                </RouterLink>
                <RouterLink
                  v-if="item.category === 'videos'"
                  :to="`/videos/detail/${item.hcId}`"
                  class="subscription_l"
                >
                  <div>{{ item.title.charAt(0) }}</div>
                </RouterLink>
                <div class="subscription_content">
                  <h3 class="subscription_name">
                    <RouterLink
                      v-if="item.category === 'news'"
                      :to="`/news/detail/${item.hcId}`"
                    >
                      {{ item.title }}
                    </RouterLink>
                    <RouterLink
                      v-if="item.category === 'articles'"
                      :to="`/articles/detail/${item.hcId}`"
                    >
                      {{ item.title }}
                    </RouterLink>
                    <RouterLink
                      v-if="item.category === 'videos'"
                      :to="`/videos/detail/${item.hcId}`"
                    >
                      {{ item.title }}
                    </RouterLink>
                  </h3>
                  <p v-if="item.category === 'news'">
                    {{ item.category === "news" ? "资讯" : "" }}
                  </p>
                  <p v-if="item.category === 'articles'">
                    {{ item.category === "articles" ? "文章" : "" }}
                  </p>
                  <p v-if="item.category === 'videos'">
                    {{ item.category === "videos" ? "视频" : "" }}
                  </p>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
      <div v-else>
        <h2 class="ah_title">
          <a href="#" @click="onChangeTab('fifth')"
            >需要审核的文章
            <span class="pm_2">
              <svg
                t="1645494758486"
                class="title_icon"
                viewBox="0 0 1024 1024"
                version="1.1"
                xmlns="http://www.w3.org/2000/svg"
                p-id="3356"
              >
                <path
                  d="M409.307429 167.789714l304.274285 302.08a61.878857 61.878857 0 0 1 18.285715 45.494857 61.878857 61.878857 0 0 1-18.285715 45.494858l-304.274285 302.08c-24.283429 24.137143-64.073143 24.283429-88.502858 0.146285l0.438858 0.438857-2.925715-3.072a61.659429 61.659429 0 0 1 0.146286-80.310857l3.510857-3.803428 262.729143-260.827429L321.974857 254.537143a61.908114 61.908114 0 0 1-3.657143-84.114286l2.925715-3.218286 3.510857-3.218285c24.576-20.48 61.586286-19.017143 84.553143 3.803428z"
                  p-id="3357"
                ></path>
              </svg> </span
          ></a>
        </h2>
        <div v-if="conReview">
          <div class="emptyContent" v-if="conReview.total === 0">
            <span>还没有需要审核的内容</span>
          </div>
          <el-row v-else>
            <el-col :span="8" v-for="item in conReview.list" :key="item.hcId">
              <div
                class="subscription subscription_show"
                @click="dialogVisible = true"
              >
                <div class="subscription_l">
                  <div>{{ item.title.charAt(0) }}</div>
                </div>
                <div class="subscription_content">
                  <h3 class="subscription_name">
                    {{ item.title }}
                  </h3>
                  <p v-if="item.category === 'news'">
                    {{ item.category === "news" ? "资讯" : "" }}
                  </p>
                  <p v-if="item.category === 'articles'">
                    {{ item.category === "articles" ? "文章" : "" }}
                  </p>
                  <p v-if="item.category === 'videos'">
                    {{ item.category === "videos" ? "视频" : "" }}
                  </p>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
    <!--  审核  -->
    <el-dialog v-model="dialogVisible" title="审核状态" width="30%">
      <ReviewTimeLine />
      <template #footer>
        <span class="dialog-footer">
          <el-button v-if="category === '管理员'">文章预览</el-button>
          <el-button @click="dialogVisible = false">确定</el-button>
        </span>
      </template>
    </el-dialog>

    <div class="ah_section">
      <!--        标题-->
      <h2 class="ah_title">
        <a href="#" @click="onChangeTab('third')"
          >订阅
          <span class="pm_2">
            <svg
              t="1645494758486"
              class="title_icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="3356"
            >
              <path
                d="M409.307429 167.789714l304.274285 302.08a61.878857 61.878857 0 0 1 18.285715 45.494857 61.878857 61.878857 0 0 1-18.285715 45.494858l-304.274285 302.08c-24.283429 24.137143-64.073143 24.283429-88.502858 0.146285l0.438858 0.438857-2.925715-3.072a61.659429 61.659429 0 0 1 0.146286-80.310857l3.510857-3.803428 262.729143-260.827429L321.974857 254.537143a61.908114 61.908114 0 0 1-3.657143-84.114286l2.925715-3.218286 3.510857-3.218285c24.576-20.48 61.586286-19.017143 84.553143 3.803428z"
                p-id="3357"
              ></path>
            </svg> </span
        ></a>
      </h2>
      <div class="colInfo" v-if="colInfo">
        <div class="emptyContent" v-if="colInfo.total === 0">
          <span>还没有内容</span>
        </div>
        <el-row v-else>
          <el-col :span="8" v-for="item in colInfo.list" :key="item.colId">
            <div class="subscription">
              <RouterLink
                :to="`/collections/detail/${item.colId}`"
                class="subscription_l"
              >
                <div>{{ item.colTitle.charAt(0) }}</div>
              </RouterLink>
              <div class="subscription_content">
                <h3 class="subscription_name">
                  <RouterLink :to="`/collections/detail/${item.colId}`">
                    {{ item.colTitle }}
                  </RouterLink>
                </h3>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useRoute } from "vue-router";
import { getUserCon, getUserCol, getAdminReview } from "@/api/login";
import ReviewTimeLine from "@/components/ReviewTimeLine";
import store from "@/store";

export default {
  name: "UsersPageHome",
  components: { ReviewTimeLine },
  emits: ["changeTab"],
  setup(props, { emit }) {
    const page = ref(1);
    const route = useRoute();
    const uId = route.params.id;
    const category = store.state.user.profile.category;
    const onChangeTab = (tabname) => {
      emit("changeTab", tabname);
    };
    const { conInfo } = useUserCon(uId, page.value);
    const { colInfo } = useUserCol(uId, page.value);
    const { conReview } = useAdminCon(uId, page.value);

    const dialogVisible = ref(false);

    return {
      onChangeTab,
      category,
      conInfo,
      colInfo,
      conReview,
      open,
      dialogVisible,
    };
  },
};

//获取用户投稿
function useUserCon(uId, current) {
  const conInfo = ref();
  const getData = () => {
    getUserCon(uId, current).then((data) => {
      conInfo.value = data.result;
    });
  };
  getData();
  return { conInfo };
}

//获取管理员需审核文章
function useAdminCon(uId, current) {
  const conReview = ref();
  const getData = () => {
    getAdminReview(uId, current).then((data) => {
      conReview.value = data.result;
    });
  };
  getData();
  return { conReview };
}

//获取用户订阅
function useUserCol(uId, current) {
  const colInfo = ref();
  const getData = () => {
    getUserCol(uId, current).then((data) => {
      colInfo.value = data.result;
    });
  };
  getData();
  return { colInfo };
}
</script>

<style scoped>
.ah_section {
  margin-bottom: 40px;
}

.ah_section:last-child {
  margin: 0;
}

.profilePage .ah_title {
  font-size: 14px;
  margin-bottom: 14px;
}

.ah_title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 1.125rem;
  font-weight: 600;
  line-height: 2;
  margin: 0 0 1.875rem;
  color: #323232;
}

.emptyContent {
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  margin-bottom: 1rem;
  height: 180px;
}

.emptyContent span {
  color: #5a5a5a;
  font-size: 0.85714em;
}

.subscription {
  display: flex;
  align-items: center;
  color: #323232;
  line-height: 1;
  font-size: 0.875rem;
  overflow: hidden;
  margin: 0 1rem 1.25rem 1rem;
}

.subscription_show {
  cursor: pointer;
}

.subscription_l {
  flex: 0 0 auto;
  margin-right: 20px;
  width: 4.5rem;
  height: 4.5rem;
  border-radius: 50%;
  font-size: 1.875rem;
  overflow: hidden;
  background-color: #e47470;
  color: #fff;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: cover;
}

.subscription_l > div {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.2);
}

.subscription_content {
  flex: 1 1 auto;
  white-space: nowrap;
}

.subscription_name {
  font-size: 0.875rem;
  margin-bottom: 8px;
}
</style>
