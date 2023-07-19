<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row class="row-bg" justify="center">
          <el-col :span="4">
            <img src="@/assets/banner/hotinfo.png" alt="" />
          </el-col>
        </el-row>
      </el-header>
      <el-main>
        <el-row justify="center">
          <ContributePageForm></ContributePageForm>
        </el-row>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import ContributePageForm from "@/views/contribute/components/ContributePageForm";

export default {
  name: "ContributePage",
  components: {
    ContributePageForm,
  },
};
</script>

<style scoped>
.el-row {
  margin: 10px 0;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.gnav_item {
  float: right;
  display: inline-block;
  font-weight: 600;
}
</style>
