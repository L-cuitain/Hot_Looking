<template>
  <div class="paginationContainer">
    <el-pagination
      v-if="listInfo"
      background
      layout="prev, pager, next"
      :total="listInfo.total"
      :page-size="listInfo.pageSize"
      v-model:currentPage="page"
      @current-change="handleCurrentChange"
    >
    </el-pagination>
  </div>
</template>

<script>
import { ref, watch } from "vue";

export default {
  name: "Pagination",
  props: ["listInfo"],
  emits: ["getInfo"],
  setup(props, { emit }) {
    const page = ref(1);
    //改变页数
    const handleCurrentChange = () => {
      emit("getInfo", page.value);
    };
    //监听页数
    watch(
      () => page,
      () => {
        handleCurrentChange();
      },
      { deep: true, immediate: true }
    );
    return { page, handleCurrentChange };
  },
};
</script>

<style scoped></style>
