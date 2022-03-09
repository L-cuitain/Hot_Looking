<template>
  <AppLayout>
    <div class="user">用户详情页</div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "@/components/App/AppLayout";
import AppFooter from "@/components/App/AppFooter";

export default {
  name: "UsersPage",
  components: {
    AppLayout,
    AppFooter,
  },
};
</script>

<style scoped></style>
