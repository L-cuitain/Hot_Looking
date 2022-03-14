<template>
  <el-tabs v-model="activeName" class="tabs">
    <el-tab-pane label="全部" name="first">
      <Suspense>
        <AllList />
      </Suspense>
    </el-tab-pane>
    <el-tab-pane label="资讯" name="second">
      <Suspense>
        <NewsList />
      </Suspense>
    </el-tab-pane>
    <el-tab-pane label="文章" name="third">
      <Suspense>
        <ArticlesList />
      </Suspense>
    </el-tab-pane>
    <el-tab-pane label="视频" name="fourth">
      <Suspense>
        <VideosList />
      </Suspense>
    </el-tab-pane>
  </el-tabs>
</template>

<script>
import { ref } from "vue";
import AllList from "../../../components/LabelList/AllList";
import NewsList from "../../../components/LabelList/NewsList";
import VideosList from "../../../components/LabelList/VideosList";
import ArticlesList from "../../../components/LabelList/ArticlesList";

export default {
  name: "CategoryPageTab",
  components: {
    AllList,
    NewsList,
    VideosList,
    ArticlesList,
  },
  setup() {
    const activeName = ref("first");
    return { activeName };
  },
};
</script>

<style scoped>
.tabs {
  margin: 0 15px;
}

:deep(.el-tabs__item) {
  color: #f56c6c;
  font-size: 14px;
  font-weight: 600;
}

:deep(.el-tabs__active-bar) {
  background-color: #323232;
}
</style>
