<template>
  <AppLayout>
    <div class="collection_detail">
<!--      顶部-->
      <CollectionsDetailPageNav />
<!--      列表-->
      <div class="list_container container">
        <CollectionsDetailPageTab />
      </div>
    </div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "@/components/App/AppLayout";
import CollectionsDetailPageNav from "@/views/collections/components/CollectionsDetailPageNav";
import CollectionsDetailPageTab from "@/views/collections/components/CollectionsDetailPageTab";
import AppFooter from "@/components/App/AppFooter";

export default {
  name: "CollectionsDetailPage",
  components:{
    AppLayout,
    CollectionsDetailPageNav,
    CollectionsDetailPageTab,
    AppFooter
  }
};
</script>

<style scoped>

</style>