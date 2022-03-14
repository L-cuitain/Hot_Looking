<template>
  <div class="ah_section">
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
    <Pagination :listInfo="colInfo" @getInfo="getData" />
  </div>
</template>

<script>
import { ref } from "vue";
import { getUserCol } from "@/api/login";
import { useRoute } from "vue-router";
import Pagination from "@/components/Pagination";

export default {
  name: "UsersPageCol",
  components: {
    Pagination,
  },
  setup() {
    const page = ref(1);
    const route = useRoute();
    const uId = route.params.id;

    const { colInfo, getData } = useUserCol(uId, page.value);
    getData(page.value);
    return { colInfo, getData };
  },
};

//获取用户订阅
function useUserCol(uId) {
  const colInfo = ref();
  const getData = (current) => {
    getUserCol(uId, current).then((data) => {
      colInfo.value = data.result;
    });
  };

  return { colInfo, getData };
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
  background-color: rgb(41, 182, 246);
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
