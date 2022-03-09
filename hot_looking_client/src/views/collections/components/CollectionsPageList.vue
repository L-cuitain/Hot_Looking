<template>
  <el-row :gutter="24" v-if="colInfo">
    <el-col :span="6" v-for="item in colInfo.colList" :key="item.colId">
      <RouterLink
        :to="`/collections/detail/${item.colId}`"
        href="#"
        class="a_cover"
      >
        <img :src="item.colImg" alt="" />
      </RouterLink>
    </el-col>
  </el-row>
  <!--  分页-->
  <Pagination :listInfo="colInfo" @getInfo="getData" />
</template>

<script>
import { ref } from "vue";
import { getCollectionsAll } from "../../../api/collections";
import Pagination from "../../../components/Pagination";

export default {
  name: "CollectionsPageList",
  components: { Pagination },
  setup() {
    const { colInfo, getData } = getColList();

    return { colInfo, getData };
  },
};

function getColList() {
  const colInfo = ref();
  const getData = (current) => {
    getCollectionsAll(current).then((data) => {
      colInfo.value = data.result;
    });
  };

  return { colInfo, getData };
}
</script>

<style scoped>
a {
  display: block;
  padding-bottom: 119.84733%;
  position: relative;
  border-radius: 4px;
  overflow: hidden;
  margin-bottom: 20px;
  background-color: #e5e4e5;
}

img {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 100%;
}
</style>
