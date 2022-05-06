<template>
  <AppLayout>
    <div class="collections">
      <el-row>
        <el-col :span="24"
          ><img src="@/assets/banner/collections.png" class="banner_img" alt=""
        /></el-col>
      </el-row>

      <div class="list_container container">
        <Suspense>
          <CollectionsPageList />
        </Suspense>
      </div>
    </div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/App/AppLayout";
import CollectionsPageList from "./components/CollectionsPageList";
import AppFooter from "../../components/App/AppFooter";

export default {
  name: "TopicsPage",
  components: {
    AppLayout,
    AppFooter,
    CollectionsPageList,
  },
};
</script>

<style scoped>
.collections {
  width: 100%;
}

.container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
  box-sizing: border-box;
}
</style>
