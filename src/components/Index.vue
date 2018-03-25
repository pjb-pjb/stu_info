<template>
	<div class="container" style="position: absolute;left: 0;right: 0;margin: auto;">
		<table class="table table table-bordered">
			<tbody>
				<tr>
					<th>id</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>班级</th>
					<th>科目</th>
					<th>分数</th>
					<th>操作</th>
				</tr>
				<tr v-for="item in datas">
					<td v-text="item.sid"></td>
					<td v-text="item.name"></td>
					<td v-text="item.age"></td>
					<td v-text="item.sex"></td>
					<td v-text="item.class"></td>
					<td v-text="item.project"></td>
					<td v-text="item.num"></td>
					<td>
						<button class="btn btn-default" @click="del(item.sid)">删除</button>
						<a class="btn btn-default" @click="edit(item.sid)" role="button">编辑</a>
					</td>
				</tr>
				<tr v-if="datas.length==0">
					<td colspan="8">没有数据</td>
				</tr>
			</tbody>
		</table>
		<a href="#/add" class="btn btn-success" role="button">+</a>
	</div>
</template>

<script>
	export default{
		data(){
			return {
				datas:[]
			}
		},
		methods:{
			edit(id){
				this.$router.push('/edit/'+id);
			},
			del(id){
				fetch("/api/del/"+id).then(function(e){
					return e.text();
				}).then(function(e){
					if(e=="ok"){
						this.datas=this.datas.filter(function(val,index){
							return val.sid!=id;
						});
					}
				}.bind(this));
			}
		},
		mounted(){
			fetch("/api/find/"+sessionStorage.id).then(function(e){
				return e.json();
			}).then(function(e){
				if(e.message!="err"){
					e.forEach(function(val,index){
						val.age=new Date().getFullYear()-new Date(val.age).getFullYear()+1;
						val.sex=val.sex=="man"?"男":"女";
					});
					this.datas=e;
				}
			}.bind(this));
		}
	}
</script>

<style scoped>
	td,th{
		text-align: center !important;
	}
	th{
		font-size: 18px;
	}
</style>