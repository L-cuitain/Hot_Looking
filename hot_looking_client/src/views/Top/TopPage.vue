<template>
  <AppLayout>
    <div class="top">
      <div class="list_container container">
        <!--        标题-->
        <h2 class="top_title">最新</h2>
        <!--        列表-->
        <Suspense>
          <TopPageList />
        </Suspense>
      </div>
    </div>
    <AppFooter />
  </AppLayout>
</template>

<script>
import AppLayout from "../../components/App/AppLayout";
import AppFooter from "../../components/App/AppFooter";
import TopPageList from "./components/TopPageList";

export default {
  name: "TopPage",
  components: {
    TopPageList,
    AppLayout,
    AppFooter,
  },
};
</script>

<style scoped>
.top {
  padding-bottom: 5.625rem;
  padding-top: 2.8125rem;
}

.top_title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 1.125rem;
  font-weight: 600;
  line-height: 1;
  margin: 0 1rem 1.875rem 1rem;
  color: #323232;
}

.list_container {
  padding: 0;
  background-color: #fff;
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
