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
import AllList from "@/components/CollectionList/AllList";
import NewsList from "@/components/CollectionList/NewsList";
import ArticlesList from "@/components/CollectionList/ArticlesList";
import VideosList from "@/components/CollectionList/VideosList";

export default {
  name: "CollectionsDetailPageTab",
  components:{
    AllList,
    NewsList,
    ArticlesList,
    VideosList
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

.tabs > .el-tabs__content {
  padding: 32px;
  background-color: #f4f5f7;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>