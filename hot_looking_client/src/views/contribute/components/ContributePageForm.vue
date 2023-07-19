<template>
  <el-form :model="form" label-width="120px" style="width: 800px">
    <el-form-item label="内容标题">
      <el-input
        v-model="form.title"
        placeholder="输入标题"
        type="textarea"
        :autosize="{ minRows: 2, maxRows: 4 }"
      />
    </el-form-item>
    <el-form-item label="内容封面地址">
      <el-input v-model="form.img" placeholder="输入封面地址">
        <template #prepend>https://</template>
      </el-input>
    </el-form-item>
    <el-form-item label="内容摘要">
      <el-input
        v-model="form.summary"
        placeholder="输入摘要"
        type="textarea"
        :autosize="{ minRows: 2, maxRows: 4 }"
      />
    </el-form-item>
    <el-form-item label="选择标签" prop="region">
      <el-select v-model="form.label" placeholder="标签分类">
        <el-option label="游戏" value="L01" />
        <el-option label="生活" value="L02" />
        <el-option label="科技" value="L03" />
        <el-option label="设计" value="L04" />
        <el-option label="影视" value="L05" />
        <el-option label="故事" value="L06" />
      </el-select>
    </el-form-item>
    <el-form-item label="选择类别" prop="region">
      <el-select v-model="form.category" placeholder="内容类别">
        <el-option label="资讯" value="news" />
        <el-option label="文章" value="articles" />
        <el-option label="视频" value="videos" />
      </el-select>
    </el-form-item>
    <el-form-item label="视频地址" v-if="form.category === 'videos'">
      <el-input v-model="form.url" placeholder="输入视频地址">
        <template #prepend>https://</template>
      </el-input>
    </el-form-item>
    <el-form-item label="内容图片">
      <el-input v-model="form.contentImg" placeholder="输入图片地址">
        <template #prepend>https://</template>
      </el-input>
    </el-form-item>
    <el-form-item label="内容文章">
      <el-input
        v-model="form.content"
        type="textarea"
        rows="10"
        placeholder="在这里输入内容..."
      />
    </el-form-item>
    <el-form-item justify="center">
      <button
        class="btn btn-outline-dark btn-ellipse gnav_item"
        type="button"
        @click="getSubmit"
      >
        投稿
      </button>
    </el-form-item>
  </el-form>
</template>

<script>
import { reactive } from "vue";
import { useStore } from "vuex";
import { addContent } from "@/api/login";
import router from "@/router";
import { ElMessage } from "element-plus";

export default {
  name: "ContributePageForm",
  setup() {
    //获取当前用户
    const store = useStore();
    const user = store.state.user;

    // 表单参数
    const form = reactive({
      title: "",
      summary: "",
      img: "",
      category: "",
      label: "",
      url: "",
      contentImg: "",
      content: "",
    });

    const getSubmit = () => {
      form.uId = user.profile.uId;
      addContent(form).then((data) => {
        if (data.message === "投稿成功") {
          ElMessage({
            showClose: true,
            message: "投稿成功",
            type: "success",
          });
          router.push(`/users/${user.profile.uId}`);
        }
      });
    };

    return {
      form,
      getSubmit,
    };
  },
};
</script>

<style scoped>
.btn-ellipse {
  border-radius: 1.2857142857em;
}

.btn-outline-dark {
  color: #464646;
  border-color: #464646;
}
</style>
