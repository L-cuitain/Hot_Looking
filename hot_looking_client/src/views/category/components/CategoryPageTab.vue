<template>
  <el-tabs v-model="activeName" class="tabs">
    <el-tab-pane label="全部" name="first"><AllList /></el-tab-pane>
    <el-tab-pane label="资讯" name="second"><NewsList /></el-tab-pane>
    <el-tab-pane label="文章" name="third"><ArticlesList /></el-tab-pane>
    <el-tab-pane label="视频" name="fourth"><VideosList /></el-tab-pane>
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

.tabs > .el-tabs__content {
  padding: 32px;
  background-color: #f4f5f7;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>
