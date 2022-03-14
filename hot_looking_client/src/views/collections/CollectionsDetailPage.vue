<template>
  <div class="collection_detail">
    <!--      顶部-->
    <CollectionsDetailPageNav />
    <!--      列表-->
    <div class="list_container container">
      <CollectionsDetailPageTab />
    </div>
  </div>
  <AppFooter />
</template>

<script>
import CollectionsDetailPageNav from "@/views/collections/components/CollectionsDetailPageNav";
import CollectionsDetailPageTab from "@/views/collections/components/CollectionsDetailPageTab";
import AppFooter from "@/components/App/AppFooter";

export default {
  name: "CollectionsDetailPage",
  components: {
    CollectionsDetailPageNav,
    CollectionsDetailPageTab,
    AppFooter,
  },
};
</script>

<style scoped></style>
