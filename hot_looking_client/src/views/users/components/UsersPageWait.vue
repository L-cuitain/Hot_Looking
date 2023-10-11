<template>
  <div class="ah_section">
    <div class="colInfo" v-if="conReview">
      <div class="emptyContent" v-if="conReview.total === 0">
        <span>还没有等待审核的内容</span>
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
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <Pagination :listInfo="conReview" @getInfo="getData" />

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
  </div>
</template>

<script>
import Pagination from "@/components/Pagination";
import ReviewTimeLine from "@/components/ReviewTimeLine";
import { ref } from "vue";
import { getUserWaitReview } from "@/api/login";
import { useRoute } from "vue-router";

export default {
  name: "UsersPageWait",
  components: {
    Pagination,
    ReviewTimeLine,
  },
  setup() {
    const page = ref(1);
    const route = useRoute();
    const uId = route.params.id;
    const { conReview, getData } = useWaitReview(uId, page.value);
    const dialogVisible = ref(false);
    return {
      conReview,
      getData,
      dialogVisible,
    };
  },
};

//获取用户待审核文章
function useWaitReview(uId, current) {
  const conReview = ref();
  const getData = () => {
    getUserWaitReview(uId, current).then((data) => {
      conReview.value = data.result;
    });
  };
  return { conReview, getData };
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
