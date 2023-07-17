<template>
  <div class="ah_section">
    <div v-if="conInfo">
      <div class="emptyContent" v-if="conInfo.total === 0">
        <span>还没有内容，点击这里添加内容</span>
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
      <Pagination :listInfo="conInfo" @getInfo="getData" />
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { getUserCon } from "@/api/login";
import { useRoute } from "vue-router";
import Pagination from "@/components/Pagination";

export default {
  name: "UsersPageCon",
  components: {
    Pagination,
  },
  setup() {
    const page = ref(1);
    const route = useRoute();
    const uId = route.params.id;

    const { conInfo, getData } = useUserCon(uId, page.value);
    getData(page.value);
    return { conInfo, getData };
  },
};

//获取用户投稿
function useUserCon(uId) {
  const conInfo = ref();
  const getData = (current) => {
    getUserCon(uId, current).then((data) => {
      conInfo.value = data.result;
    });
  };
  return { conInfo, getData };
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
