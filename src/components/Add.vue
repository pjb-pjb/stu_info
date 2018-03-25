<template>
	<div class="container" style="position: absolute;left: 0;right: 0;margin: auto;">
		<form action="javascript:">
		<div class="form-group has-success">
			<label class="control-label" for="inputSuccess1">姓名</label>
			<input v-model="name" type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
		</div>
		<div class="form-group has-warning">
			<label class="control-label" for="inputWarning1">年龄</label>
			<input v-model="age" type="date" class="form-control" id="inputWarning1">
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError1">性别</label>
			<div class="radio">
				<label>
    <input v-model="sex" type="radio" name="sex" id="optionsRadios1" value="man" checked>
   	男
  </label>
			</div>
			<div class="radio">
				<label>
    <input v-model="sex" type="radio" name="sex" id="optionsRadios2" value="women">
    女
  </label>
			</div>
		</div>
		<div class="form-group has-success">
			<label class="control-label" for="inputSuccess1">班级</label>
			<input v-model="classes" type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
		</div>
		<div class="form-group has-success">
			<label class="control-label" for="inputSuccess1">科目</label>
			<input v-model="project" type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
		</div>
		<div class="form-group has-success">
			<label class="control-label" for="inputSuccess1">分数</label>
			<input v-model="num" type="text" class="form-control" id="inputSuccess1" aria-describedby="helpBlock2">
		</div>
		<input class="btn btn-default" type="submit" value="提交" @click="add">
		</form>
	</div>
</template>

<script>
	export default{
		data(){
			return {
				datas:[],
				name:"",
				sex:"man",
				age:"",
				classes:"",
				project:"",
				num:""
			}
		},
		methods:{
			add(){
				fetch(`/api/add?name=${this.name||""}&age=${this.age||""}&sex=${this.sex}&classes=${this.classes||""}&project=${this.project||""}&num=${this.num||""}&uid=${sessionStorage.id}`).then(function(e){
					return e.text();
				}).then(function(e){
					if(e=="ok"){
						if(!confirm("添加成功,是否继续添加？")){
							this.$router.push("/");
						}
					}
				}.bind(this));
			}
		}
	}
</script>

<style>

</style>